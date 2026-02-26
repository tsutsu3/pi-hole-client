import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:provider/provider.dart';

class ChartVisualizationScreen extends StatelessWidget {
  const ChartVisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    Widget homeItem(
      String title,
      IconData icon,
      HomeVisualizationMode value,
    ) {
      final isSelected = value == appConfigViewModel.homeVisualizationMode;
      return _ChartModeItem(
        title: title,
        icon: icon,
        isSelected: isSelected,
        onTap: () => appConfigViewModel.setHomeVisualizationMode(value),
      );
    }

    Widget statsItem(
      String title,
      IconData icon,
      StatisticsVisualizationMode value,
    ) {
      final isSelected =
          value == appConfigViewModel.statisticsVisualizationMode;
      return _ChartModeItem(
        title: title,
        icon: icon,
        isSelected: isSelected,
        onTap: () => appConfigViewModel.setStatisticsVisualizationMode(value),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chartDisplayModeTitle),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionLabel(
              label: AppLocalizations.of(context)!.homeChartModeTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 16),
              child: Text(
                AppLocalizations.of(context)!.homeChartModeDescription,
              ),
            ),
            homeItem(
              AppLocalizations.of(context)!.lineChart,
              Icons.show_chart_rounded,
              HomeVisualizationMode.lineArea,
            ),
            const SizedBox(height: 24),
            homeItem(
              AppLocalizations.of(context)!.barChart,
              Icons.bar_chart_rounded,
              HomeVisualizationMode.bar,
            ),
            const SizedBox(height: 24),
            SectionLabel(
              label: AppLocalizations.of(context)!.statsChartModeTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 16),
              child: Text(
                AppLocalizations.of(context)!.statsChartModeDescription,
              ),
            ),
            statsItem(
              AppLocalizations.of(context)!.list,
              Icons.list_rounded,
              StatisticsVisualizationMode.list,
            ),
            const SizedBox(height: 24),
            statsItem(
              AppLocalizations.of(context)!.pieChart,
              Icons.pie_chart_rounded,
              StatisticsVisualizationMode.pieChart,
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartModeItem extends StatelessWidget {
  const _ChartModeItem({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const radius = 16.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: isSelected
                  ? Theme.of(
                      context,
                    ).colorScheme.primaryContainer.withValues(alpha: 0.6)
                  : Theme.of(context).dialogTheme.backgroundColor,
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 42,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
