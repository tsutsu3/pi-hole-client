import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/clients.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_data_chart.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/clients/clients_last_hours_bar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/clients/clients_last_hours_line.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/skeleton/bar_chart_skeleton.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/skeleton/line_chart_skeleton.dart';
import 'package:pi_hole_client/ui/statistics/widgets/no_data_chart.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ClientActivityChartSection extends StatelessWidget {
  const ClientActivityChartSection({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = context.read<AppConfigViewModel>();

    final overTimeDataLoadStatus = context.select<StatusViewModel, LoadStatus>(
      (provider) => provider.getOvertimeDataLoadStatus,
    );

    final overtimeData = context.select<StatusViewModel, OverTime?>(
      (provider) => provider.getOvertimeData,
    );

    final clientsListIps = overtimeData != null
        ? overtimeData.clients.map((client) => client.ip).toList()
        : <String>[];

    Widget child;
    switch (overTimeDataLoadStatus) {
      case LoadStatus.error:
        child = _buildErrorChart(context);
      case LoadStatus.loading:
        child = _buildSkeleton(
          context,
          appConfigViewModel,
          overtimeData,
          clientsListIps,
        );
      case LoadStatus.loaded:
        child = _hasData(overtimeData)
            ? _buildLoadedContent(
                context,
                appConfigViewModel,
                overtimeData,
                clientsListIps,
              )
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

  Widget _buildSkeleton(
    BuildContext context,
    AppConfigViewModel appConfigViewModel,
    OverTime? overtimeData,
    List<String> clientsListIps,
  ) {
    final fakeClients = List.generate(
      3,
      (index) => Client(ip: '192.168.0.${index + 1}', name: ''),
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
                child: appConfigViewModel.homeVisualizationMode == HomeVisualizationMode.lineArea
                    ? LineChartSkeleton(
                        selectedTheme: appConfigViewModel.selectedTheme,
                        nums: 3,
                        showAnimation: appConfigViewModel.loadingAnimation,
                      )
                    : BarChartSkeleton(
                        selectedTheme: appConfigViewModel.selectedTheme,
                        nums: 3,
                        showAnimation: appConfigViewModel.loadingAnimation,
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

  Widget _buildLoadedContent(
    BuildContext context,
    AppConfigViewModel appConfigViewModel,
    OverTime? overtimeData,
    List<String> clientsListIps,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.clientActivity24),
            Container(
              width: double.maxFinite,
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildClientsGraph(
                appConfigViewModel,
                overtimeData,
                clientsListIps,
              ),
            ),
          ],
        ),
        _buildLegendSection(context, overtimeData, clientsListIps),
      ],
    );
  }

  Widget _buildNoDataChart(BuildContext context) {
    return NoDataChart(
      topLabel: AppLocalizations.of(context)!.clientActivity24,
    );
  }

  Container _buildLegendSection(
    BuildContext context,
    OverTime? overtimeData,
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

  bool _hasData(OverTime? overtimeData) {
    return overtimeData != null &&
        overtimeData.clientEntries.isNotEmpty &&
        overtimeData.clients.isNotEmpty;
  }

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
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              if (entry.value.name != null && entry.value.name!.isNotEmpty) ...[
                Text(entry.value.name!, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
              ],
              Text(entry.value.ip, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }

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
      return Theme.of(context).extension<GraphColors>()!.getColor(index);
    }
  }

  Widget _buildClientsGraph(
    AppConfigViewModel appConfigViewModel,
    OverTime? overtimeData,
    List<String> clientsListIps,
  ) {
    if (appConfigViewModel.homeVisualizationMode == HomeVisualizationMode.lineArea) {
      return ClientsLastHoursLine(
        realtimeListIps: clientsListIps,
        data: overtimeData!,
        reducedData: appConfigViewModel.reducedDataCharts,
        hideZeroValues: appConfigViewModel.hideZeroValues,
      );
    } else {
      return ClientsLastHoursBar(
        realtimeListIps: clientsListIps,
        data: overtimeData!,
        reducedData: appConfigViewModel.reducedDataCharts,
        hideZeroValues: appConfigViewModel.hideZeroValues,
      );
    }
  }
}
