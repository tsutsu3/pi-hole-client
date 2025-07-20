import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class ChartVisualizationScreen extends StatelessWidget {
  const ChartVisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    int getGraphValue(GraphSection section) {
      return section == GraphSection.statsView
          ? appConfigProvider.statisticsVisualizationMode
          : appConfigProvider.homeVisualizationMode;
    }

    Future<bool> setGraphValue(
      GraphSection section,
      int value,
    ) async {
      if (section == GraphSection.statsView) {
        return appConfigProvider.setStatisticsVisualizationMode(value);
      } else {
        return appConfigProvider.setHomeVisualizationMode(value);
      }
    }

    Widget item(
      String title,
      IconData icon,
      int value,
      GraphSection section,
    ) {
      const radius = 16.0;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            onTap: () => setGraphValue(section, value),
            borderRadius: BorderRadius.circular(radius),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: value == getGraphValue(section)
                    ? Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.6)
                    : Theme.of(context).dialogTheme.backgroundColor,
                border: Border.all(
                  color: value == getGraphValue(section)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 42,
                    color: value == getGraphValue(section)
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
                            color: value == getGraphValue(section)
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
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
              child:
                  Text(AppLocalizations.of(context)!.homeChartModeDescription),
            ),
            item(
              AppLocalizations.of(context)!.lineChart,
              Icons.show_chart_rounded,
              0,
              GraphSection.homeView,
            ),
            const SizedBox(height: 24),
            item(
              AppLocalizations.of(context)!.barChart,
              Icons.bar_chart_rounded,
              1,
              GraphSection.homeView,
            ),
            const SizedBox(height: 24),
            SectionLabel(
              label: AppLocalizations.of(context)!.statsChartModeTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 26, bottom: 16),
              child:
                  Text(AppLocalizations.of(context)!.statsChartModeDescription),
            ),
            item(
              AppLocalizations.of(context)!.list,
              Icons.list_rounded,
              0,
              GraphSection.statsView,
            ),
            const SizedBox(height: 24),
            item(
              AppLocalizations.of(context)!.pieChart,
              Icons.pie_chart_rounded,
              1,
              GraphSection.statsView,
            ),
          ],
        ),
      ),
    );
  }
}
