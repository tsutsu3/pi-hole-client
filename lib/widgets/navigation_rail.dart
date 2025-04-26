import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

import 'package:pi_hole_client/models/app_screen.dart';

class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    required this.screens,
    required this.selectedScreen,
    required this.onChange,
    super.key,
  });

  final List<AppScreen> screens;
  final int selectedScreen;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    String getStringLocalization(String name) {
      switch (name) {
        case 'home':
          return AppLocalizations.of(context)!.home;

        case 'statistics':
          return AppLocalizations.of(context)!.statistics;

        case 'logs':
          return AppLocalizations.of(context)!.logs;

        case 'domains':
          return AppLocalizations.of(context)!.domains;

        case 'settings':
          return AppLocalizations.of(context)!.settings;

        case 'connect':
          return AppLocalizations.of(context)!.connect;

        default:
          return '';
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: NavigationRail(
                selectedIndex: selectedScreen,
                onDestinationSelected: onChange,
                destinations: screens
                    .map(
                      (screen) => NavigationRailDestination(
                        icon: screen.icon,
                        label: Text(getStringLocalization(screen.name)),
                      ),
                    )
                    .toList(),
                labelType: NavigationRailLabelType.all,
                useIndicator: true,
                groupAlignment: 0,
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.05),
              ),
            ),
          ),
        );
      },
    );
  }
}
