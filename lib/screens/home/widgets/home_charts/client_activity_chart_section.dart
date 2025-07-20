import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/config2/responsive.dart';
import 'package:pi_hole_client/data2/services/gateways/shared/models/overtime_data.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/clients/clients_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/clients/clients_last_hours_line.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/skeleton/bar_chart_skeleton.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/skeleton/line_chart_skeleton.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';
import 'package:pi_hole_client/ui2/core/ui/components/error_data_chart.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// A responsive widget that visualizes client DNS activity over the past 24 hours.
///
/// Displays:
/// - A line or bar chart showing queries per client over time
/// - A color-coded list of client names/IPs matching the chart colors
///
/// Includes:
/// - Section label
/// - Chart widget (line or bar) based on app configuration
/// - Legend with colored dots for each client
///
/// The layout adjusts based on screen size using [FractionallySizedBox] and [Wrap].
/// If no client data is available, a [NoDataChart] is displayed instead.
class ClientActivityChartSection extends StatelessWidget {
  const ClientActivityChartSection({
    required this.width,
    super.key,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.read<AppConfigProvider>();

    final overTimeDataLoadStatus = context.select<StatusProvider, LoadStatus>(
      (provider) => provider.getOvertimeDataLoadStatus,
    );

    final overtimeDataJson =
        context.select<StatusProvider, Map<String, dynamic>?>(
      (provider) => provider.getOvertimeDataJson,
    );

    final overtimeData = context.select<StatusProvider, OverTimeData?>(
      (provider) => provider.getOvertimeData,
    );

    final clientsListIps = overtimeData != null
        ? overtimeData.clients.map((client) {
            return client.ip;
          }).toList()
        : <String>[];

    Widget child;
    switch (overTimeDataLoadStatus) {
      case LoadStatus.error:
        child = _buildErrorChart(context);
      case LoadStatus.loading:
        child = _buildSkeleton(
          context,
          appConfigProvider,
          overtimeData,
          clientsListIps,
        );
      case LoadStatus.loaded:
        child = _hasData(overtimeDataJson)
            ? _buildLoadedContent(
                context,
                appConfigProvider,
                overtimeData,
                overtimeDataJson,
                clientsListIps,
              )
            : _buildNoDataChart(context);
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  /// Builds a widget that displays an error chart with a top label indicating
  /// the total number of queries in the last 24 hours.
  ///
  /// The [context] parameter is used to access localization resources for the label.
  ///
  /// Returns an [ErrorDataChart] widget with a localized top label.
  Widget _buildErrorChart(BuildContext context) {
    return ErrorDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  /// Builds a skeleton UI for the client activity chart section, typically shown while data is loading.
  ///
  /// This widget displays a placeholder for the section label, a chart skeleton (either line or bar chart,
  /// depending on the current visualization mode), and a legend section with fake client data.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [appConfigProvider]: Provides app configuration and state, such as theme and visualization mode.
  /// - [overtimeData]: The data for client activity over time (can be null while loading).
  /// - [clientsListIps]: The list of client IP addresses.
  ///
  /// Returns a widget displaying the skeleton layout for the client activity chart section.
  Widget _buildSkeleton(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    OverTimeData? overtimeData,
    List<String> clientsListIps,
  ) {
    final fakeClients = List.generate(
      3,
      (index) => Client(
        ip: '192.168.0.${index + 1}',
        name: '',
        color: Theme.of(context).extension<GraphColors>()!.getColor(index),
      ),
    );

    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Theme.of(context).colorScheme.secondaryContainer,
        highlightColor: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton.keep(
                child: SectionLabel(
                  label: AppLocalizations.of(context)!.clientActivity24,
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 350,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: appConfigProvider.homeVisualizationMode == 0
                    ? LineChartSkeleton(
                        selectedTheme: appConfigProvider.selectedTheme,
                        nums: 3,
                        showAnimation: appConfigProvider.loadingAnimation,
                      )
                    : BarChartSkeleton(
                        selectedTheme: appConfigProvider.selectedTheme,
                        nums: 3,
                        showAnimation: appConfigProvider.loadingAnimation,
                      ),
              ),
            ],
          ),
          _buildLegendSection(
            context,
            overtimeData,
            clientsListIps,
            fakeClients: fakeClients,
          ),
        ],
      ),
    );
  }

  /// Builds the content to display when the client activity data is loaded.
  ///
  /// This widget displays a section label, a graph of client activity over time,
  /// and a legend section. It takes the following parameters:
  ///
  /// - [context]: The build context.
  /// - [appConfigProvider]: The provider for app configuration.
  /// - [overtimeData]: The data representing client activity over time (optional).
  /// - [overtimeDataJson]: The raw JSON data for client activity over time (optional).
  /// - [clientsListIps]: The list of client IP addresses to display in the chart and legend.
  ///
  /// Returns a [Column] widget containing the chart and legend.
  Widget _buildLoadedContent(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    OverTimeData? overtimeData,
    Map<String, dynamic>? overtimeDataJson,
    List<String> clientsListIps,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionLabel(
              label: AppLocalizations.of(context)!.clientActivity24,
            ),
            Container(
              width: double.maxFinite,
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildClientsGraph(
                appConfigProvider,
                overtimeDataJson,
                clientsListIps,
              ),
            ),
          ],
        ),
        _buildLegendSection(context, overtimeData, clientsListIps),
      ],
    );
  }

  /// Builds a widget that displays a chart indicating no data is available.
  ///
  /// This widget uses [NoDataChart] and sets the topLabel to the localized
  /// string for "Client Activity (24h)".
  ///
  /// [context] is used to access localization resources.
  Widget _buildNoDataChart(BuildContext context) {
    return NoDataChart(
      topLabel: AppLocalizations.of(context)!.clientActivity24,
    );
  }

  /// Builds a legend section widget displaying a list of clients with their corresponding legend dots.
  ///
  /// The legend is displayed as a [Wrap] of legend dots, each representing a client. The layout adapts
  /// based on the available width and the number of clients, using [FractionallySizedBox] to control the width
  /// of each legend item.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [overtimeData]: The data containing client information over time. If [fakeClients] is provided, it will be used instead.
  /// - [clientsListIps]: A list of client IP addresses to be displayed in the legend.
  /// - [fakeClients]: (Optional) A list of fake clients to use instead of the clients from [overtimeData].
  ///
  /// Returns a [Container] widget containing the legend section.
  Container _buildLegendSection(
    BuildContext context,
    OverTimeData? overtimeData,
    List<String> clientsListIps, {
    List<Client>? fakeClients,
  }) {
    final clients = fakeClients ?? overtimeData?.clients ?? [];

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Wrap(
        runSpacing: 16,
        children: clients
            .asMap()
            .entries
            .map(
              (entry) => FractionallySizedBox(
                widthFactor:
                    width > ResponsiveConstants.xLarge && clients.length > 3
                        ? 0.33
                        : width > 350
                            ? 0.5
                            : 1,
                child: _buildLegendDot(context, entry, clientsListIps),
              ),
            )
            .toList(),
      ),
    );
  }

  /// Determines whether sufficient data exists to render the client activity chart.
  ///
  /// Returns `true` if the JSON data contains at least one client entry and
  /// one time-series data point for `over_time`; otherwise returns `false`.
  ///
  /// - [overtimeDataJson]: The JSON data containing client activity over time.
  bool _hasData(Map<String, dynamic>? overtimeDataJson) {
    return overtimeDataJson != null &&
        overtimeDataJson['over_time'].keys.length > 0 &&
        overtimeDataJson['clients'].length > 0;
  }

  /// Builds a legend entry displaying a colored dot, client name (optional), and IP address.
  ///
  /// This legend item corresponds to a line or bar on the client activity chart.
  /// If the client's name is empty, only the IP is shown. Text is truncated to fit.
  ///
  /// The dot color is determined by [_getColor] based on the client’s IP address.
  ///
  /// - [context]: Used to access theme and color.
  /// - [entry]: A [MapEntry] of client index and the [Client] object.
  /// - [clientsListIps]: A list of known client IPs to determine color index.
  ///
  /// Returns a [Row] widget with the dot and text information.
  Row _buildLegendDot(
    BuildContext context,
    MapEntry<int, Client> entry,
    List<String> clientsListIps,
  ) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _getColor(context, entry.value, entry.key, clientsListIps),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (entry.value.name != '') ...[
                Text(
                  entry.value.name,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
              ],
              Text(
                entry.value.ip,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Resolves the display color for a [Client] based on its IP address.
  ///
  /// If the client's IP is found in [clientsListIps], the color is retrieved
  /// from the theme's [GraphColors] palette based on its index.
  /// Otherwise, the fallback is the client's defined color value.
  ///
  /// - [context]: The current [BuildContext] for theme access.
  /// - [client]: The [Client] whose color is being resolved.
  /// - [index]: The index in the list (not used directly, but typically aligns with position).
  /// - [clientsListIps]: A list of known client IPs to determine color index.
  ///
  /// Returns a [Color] used for both chart and legend representation.
  Color _getColor(
    BuildContext context,
    Client client,
    int index,
    List<String> clientsListIps,
  ) {
    final exists = clientsListIps.indexOf(client.ip);
    if (exists >= 0) {
      return Theme.of(context).extension<GraphColors>()!.getColor(exists);
    } else {
      return client.color;
    }
  }

  /// Builds and returns the client activity chart widget based on app settings.
  ///
  /// The chart type is determined by homeVisualizationMode:
  /// - 0 = Line chart ([ClientsLastHoursLine])
  /// - 1 = Bar chart ([ClientsLastHoursBar])
  ///
  /// Additional flags like `reducedDataCharts` and `hideZeroValues` influence chart rendering.
  ///
  /// - [appConfigProvider]: Provides user config such as visualization mode and flags.
  /// - [overtimeDataJson]: The JSON data containing client activity over time.
  /// - [clientsListIps]: Ordered list of known client IPs for color resolution.
  ///
  /// Returns a widget displaying the client activity chart.
  Widget _buildClientsGraph(
    AppConfigProvider appConfigProvider,
    Map<String, dynamic>? overtimeDataJson,
    List<String> clientsListIps,
  ) {
    if (appConfigProvider.homeVisualizationMode == 0) {
      return ClientsLastHoursLine(
        realtimeListIps: clientsListIps,
        data: overtimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
        hideZeroValues: appConfigProvider.hideZeroValues,
      );
    } else {
      return ClientsLastHoursBar(
        realtimeListIps: clientsListIps,
        data: overtimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
        hideZeroValues: appConfigProvider.hideZeroValues,
      );
    }
  }
}
