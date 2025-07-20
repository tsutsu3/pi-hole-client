import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/services/gateways/shared/models/app_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
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

    return NavigationBar(
      selectedIndex: selectedScreen,
      onDestinationSelected: onChange,
      destinations: screens
          .map(
            (screen) => NavigationDestination(
              icon: screen.icon,
              label: getStringLocalization(screen.name),
            ),
          )
          .toList(),
    );
  }
}
