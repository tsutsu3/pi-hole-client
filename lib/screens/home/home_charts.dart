import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/clients_last_hours_line.dart';
import 'package:pi_hole_client/screens/home/widgets/queries_last_hours_line.dart';
import 'package:pi_hole_client/screens/statistics/no_data_chart.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class HomeCharts extends StatelessWidget {
  const HomeCharts({super.key});

  bool checkExistsData(Map<String, dynamic> data) {
    var exists = false;
    for (final element in data.keys) {
      if (data[element] > 0) {
        exists = true;
        break;
      }
    }
    return exists;
  }

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    final clientsListIps = statusProvider.getOvertimeData != null
        ? statusProvider.getOvertimeData!.clients.map((client) {
            return client.ip;
          }).toList()
        : [];

    Color getColor(Client client, int index) {
      final exists = clientsListIps.indexOf(client.ip);
      if (exists >= 0) {
        return Theme.of(context).extension<GraphColors>()!.getColor(exists);
      } else {
        return client.color;
      }
    }

    switch (statusProvider.getOvertimeDataLoadStatus) {
      case 0:
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

      case 1:
        return Wrap(
          children: [
            FractionallySizedBox(
              widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
              child: checkExistsData(
                        statusProvider
                            .getOvertimeDataJson!['domains_over_time'],
                      ) &&
                      checkExistsData(
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
                          child: QueriesLastHoursLine(
                            data: statusProvider.getOvertimeDataJson!,
                            reducedData: appConfigProvider.reducedDataCharts,
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
                              child: ClientsLastHoursLine(
                                realtimeListIps: clientsListIps as List<String>,
                                data: statusProvider.getOvertimeDataJson!,
                                reducedData:
                                    appConfigProvider.reducedDataCharts,
                                hideZeroValues:
                                    appConfigProvider.hideZeroValues,
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

      case 2:
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

      default:
        return const SizedBox();
    }
  }
}
