import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/overtime/overtime.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_data_chart.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_content.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts/queries/queries_skeleton.dart';
import 'package:pi_hole_client/ui/statistics/widgets/no_data_chart.dart';
import 'package:provider/provider.dart';

class TotalQueriesChartSection extends StatelessWidget {
  const TotalQueriesChartSection({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    final overTimeDataLoadStatus = context.select<StatusViewModel, LoadStatus>(
      (provider) => provider.getOvertimeDataLoadStatus,
    );

    final overtimeData = context.select<StatusViewModel, OverTime?>(
      (provider) => provider.getOvertimeData,
    );

    Widget child;
    switch (overTimeDataLoadStatus) {
      case LoadStatus.error:
        child = ErrorDataChart(
          topLabel: AppLocalizations.of(context)!.totalQueries24,
        );
      case LoadStatus.loading:
        child = const QueriesSkeleton();
      case LoadStatus.loaded:
        child = _hasData(overtimeData)
            ? const QueriesContent()
            : NoDataChart(
                topLabel: AppLocalizations.of(context)!.totalQueries24,
              );
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.medium ? 0.5 : 1,
      child: child,
    );
  }

  bool _hasData(OverTime? overtimeData) {
    if (overtimeData == null) return false;
    return overtimeData.domainsOverTime.any((e) => e.count > 0) ||
        overtimeData.adsOverTime.any((e) => e.count > 0);
  }
}
