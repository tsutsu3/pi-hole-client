import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeVisualizationScreen extends StatelessWidget {
  const HomeVisualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final mediaQuery = MediaQuery.of(context);

    Widget item(String title, String description, IconData icon, int value) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          child: InkWell(
            onTap: () => appConfigProvider.setHomeVisualizationMode(value),
            borderRadius: BorderRadius.circular(28),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: value == appConfigProvider.homeVisualizationMode
                    ? Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.1)
                    : Theme.of(context).dialogTheme.backgroundColor,
                border: Border.all(
                  color: value == appConfigProvider.homeVisualizationMode
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 50,
                    color: value == appConfigProvider.homeVisualizationMode
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
                            color:
                                value == appConfigProvider.homeVisualizationMode
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: mediaQuery.size.width - 170,
                          child: Text(
                            description,
                            style: TextStyle(
                              color: value ==
                                      appConfigProvider.homeVisualizationMode
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                            ),
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
        title: Text(AppLocalizations.of(context)!.twentyFourHourViewMode),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            item(
              AppLocalizations.of(context)!.lineChart,
              AppLocalizations.of(context)!.listDescription,
              Icons.show_chart_rounded,
              0,
            ),
            const SizedBox(height: 24),
            item(
              AppLocalizations.of(context)!.barChart,
              AppLocalizations.of(context)!.pieChartDescription,
              Icons.bar_chart_rounded,
              1,
            ),
          ],
        ),
      ),
    );
  }
}
