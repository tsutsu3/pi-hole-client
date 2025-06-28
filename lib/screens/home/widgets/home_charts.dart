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
import 'package:pi_hole_client/screens/home/widgets/queries_last_hours_bar.dart';
import 'package:pi_hole_client/screens/home/widgets/queries_last_hours_line.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

/// A responsive widget that displays two types of Pi-hole charts:
/// - Total queries and ads over time
/// - Client activity over time
///
/// This widget reacts to the current [LoadStatus] from [StatusProvider]:
/// - Shows a loading spinner while data is loading
/// - Shows chart visualizations when data is loaded
/// - Displays an error icon and message if loading fails
///
/// It also includes logic to handle:
/// - Conditional rendering based on available data
/// - Responsive layout between full-width and half-width charts
/// - Graph color assignment based on clients' IP addresses
class HomeCharts extends StatelessWidget {
  const HomeCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    final clientsListIps = statusProvider.getOvertimeData != null
        ? statusProvider.getOvertimeData!.clients.map((client) {
            return client.ip;
          }).toList()
        : <String>[];

    Color getColor(Client client, int index) {
      final exists = clientsListIps.indexOf(client.ip);
      if (exists >= 0) {
        return Theme.of(context).extension<GraphColors>()!.getColor(exists);
      } else {
        return client.color;
      }
    }

    switch (statusProvider.getOvertimeDataLoadStatus) {
      case LoadStatus.loading:
        return SizedBox(
          width: double.maxFinite,
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.loadingCharts,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        );

      case LoadStatus.loaded:
        return Wrap(
          children: [
            FractionallySizedBox(
              widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
              child: _checkExistsData(
                        statusProvider
                            .getOvertimeDataJson!['domains_over_time'],
                      ) ||
                      _checkExistsData(
                        statusProvider.getOvertimeDataJson!['ads_over_time'],
                      )
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionLabel(
                          label: AppLocalizations.of(context)!.totalQueries24,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 350,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _buildQueriesGraph(
                            appConfigProvider,
                            statusProvider,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .extension<GraphColors>()!
                                        .getColor(0), //blue
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(AppLocalizations.of(context)!.blocked),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .extension<GraphColors>()!
                                        .getColor(3), //green
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(AppLocalizations.of(context)!.notBlocked),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : NoDataChart(
                      topLabel: AppLocalizations.of(context)!.totalQueries24,
                    ),
            ),
            FractionallySizedBox(
              widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
              child: statusProvider
                              .getOvertimeDataJson!['over_time'].keys.length >
                          0 &&
                      statusProvider.getOvertimeDataJson!['clients'].length > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionLabel(
                              label: AppLocalizations.of(context)!
                                  .clientActivity24,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 350,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: _buildClientsGraph(
                                appConfigProvider,
                                statusProvider,
                                clientsListIps,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Wrap(
                            runSpacing: 16,
                            children: statusProvider.getOvertimeData!.clients
                                .asMap()
                                .entries
                                .map(
                                  (entry) => FractionallySizedBox(
                                    widthFactor:
                                        width > ResponsiveConstants.xLarge &&
                                                statusProvider.getOvertimeData!
                                                        .clients.length >
                                                    3
                                            ? 0.33
                                            : width > 350
                                                ? 0.5
                                                : 1,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: getColor(
                                              entry.value,
                                              entry.key,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (entry.value.name != '') ...[
                                                Text(
                                                  entry.value.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    )
                  : NoDataChart(
                      topLabel: AppLocalizations.of(context)!.clientActivity24,
                    ),
            ),
          ],
        );

      case LoadStatus.error:
        return SizedBox(
          width: double.maxFinite,
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
              const SizedBox(height: 50),
              Text(
                AppLocalizations.of(context)!.chartsNotLoaded,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        );
    }
  }

  /// Checks whether any value in the given [data] map is greater than 0.
  ///
  /// Returns `true` if at least one non-zero value exists; otherwise `false`.
  ///
  /// Used to determine if sufficient data exists to render a chart.
  bool _checkExistsData(Map<String, dynamic> data) {
    var exists = false;
    for (final element in data.keys) {
      if (data[element] > 0) {
        exists = true;
        break;
      }
    }
    return exists;
  }

  /// Builds the chart widget for total and blocked queries over the last 24 hours.
  ///
  /// The chart type (line or bar) is selected based on
  /// appConfigProvider.homeVisualizationMode.
  ///
  /// Returns either a [QueriesLastHoursLine] or [QueriesLastHoursBar].
  Widget _buildQueriesGraph(
    AppConfigProvider appConfigProvider,
    StatusProvider statusProvider,
  ) {
    if (appConfigProvider.homeVisualizationMode == 0) {
      return QueriesLastHoursLine(
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    } else {
      return QueriesLastHoursBar(
        data: statusProvider.getOvertimeDataJson!,
        reducedData: appConfigProvider.reducedDataCharts,
      );
    }
  }

  /// Builds the chart widget for client activity over the last 24 hours.
  ///
  /// The chart type (line or bar) is selected based on
  /// appConfigProvider.homeVisualizationMode.
  ///
  /// The chart also accounts for configuration settings like
  /// hideZeroValues and applies colors dynamically by IP.
  ///
  /// Returns either a [ClientsLastHoursLine] or [ClientsLastHoursBar].
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
