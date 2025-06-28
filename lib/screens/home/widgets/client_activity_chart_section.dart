import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/clients_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/clients_last_hours_line.dart';
import 'package:pi_hole_client/screens/home/widgets/line_chart_skeleton.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/widgets/error_data_chart.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
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
    required this.statusProvider,
    required this.appConfigProvider,
    required this.clientsListIps,
    super.key,
  });

  final double width;
  final StatusProvider statusProvider;
  final AppConfigProvider appConfigProvider;
  final List<String> clientsListIps;

  @override
  Widget build(BuildContext context) {
    final status = statusProvider.getOvertimeDataLoadStatus;

    Widget child;
    switch (status) {
      case LoadStatus.error:
        child = _buildErrorChart(context);
      case LoadStatus.loading:
        child = _buildSkeleton(context);
      case LoadStatus.loaded:
        child = _hasData()
            ? _buildLoadedContent(context)
            : _buildNoDataChart(context);
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  Widget _buildErrorChart(BuildContext context) {
    return ErrorDataChart(
      topLabel: AppLocalizations.of(context)!.totalQueries24,
    );
  }

  Widget _buildSkeleton(BuildContext context) {
    final fakeClients = List.generate(
      3,
      (index) => Client(
        ip: '192.168.0.${index + 1}',
        name: '',
        color: Theme.of(context).extension<GraphColors>()!.getColor(index),
      ),
    );

    return Skeletonizer(
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
                child: LineChartSkeleton(
                  selectedTheme: appConfigProvider.selectedTheme,
                  nums: 3,
                ),
              ),
            ],
          ),
          _buildLegendSection(context, fakeClients: fakeClients),
        ],
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context) {
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
                statusProvider,
                clientsListIps,
              ),
            ),
          ],
        ),
        _buildLegendSection(context),
      ],
    );
  }

  Widget _buildNoDataChart(BuildContext context) {
    return NoDataChart(
      topLabel: AppLocalizations.of(context)!.clientActivity24,
    );
  }

  Container _buildLegendSection(
    BuildContext context, {
    List<Client>? fakeClients,
  }) {
    final clients = fakeClients ?? statusProvider.getOvertimeData!.clients;

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
                widthFactor: width > ResponsiveConstants.xLarge &&
                        statusProvider.getOvertimeData!.clients.length > 3
                    ? 0.33
                    : width > 350
                        ? 0.5
                        : 1,
                child: _buildLegendDot(context, entry),
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
  bool _hasData() {
    return statusProvider.getOvertimeDataJson != null &&
        statusProvider.getOvertimeDataJson!['over_time'].keys.length > 0 &&
        statusProvider.getOvertimeDataJson!['clients'].length > 0;
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
  ///
  /// Returns a [Row] widget with the dot and text information.
  Row _buildLegendDot(BuildContext context, MapEntry<int, Client> entry) {
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
            color: _getColor(
              context,
              entry.value,
              entry.key,
            ),
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
  ///
  /// Returns a [Color] used for both chart and legend representation.
  Color _getColor(BuildContext context, Client client, int index) {
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
  /// - [statusProvider]: Supplies parsed client activity data from the server.
  /// - [clientsListIps]: Ordered list of known client IPs for color resolution.
  ///
  /// Returns a widget displaying the client activity chart.
  Widget _buildClientsGraph(
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
    List<String> clientsListIps,
  ) {
    if (appConfigProvider.homeVisualizationMode == 0) {
      return ClientsLastHoursLine(
        realtimeListIps: clientsListIps,
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
        hideZeroValues: appConfigProvider.hideZeroValues,
      );
    } else {
      return ClientsLastHoursBar(
        realtimeListIps: clientsListIps,
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
        hideZeroValues: appConfigProvider.hideZeroValues,
      );
    }
  }
}
