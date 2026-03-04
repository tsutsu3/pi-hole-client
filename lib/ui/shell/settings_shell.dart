import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/settings/widgets/settings_screen.dart';

/// Shell for Settings routes that provides a master-detail layout on desktop.
///
/// - Desktop (width > [ResponsiveConstants.large]):
///   `Row[SettingsScreen (master) | child (detail)]`
/// - Mobile: returns [child] directly (full-screen).
class SettingsShell extends StatelessWidget {
  const SettingsShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.large) {
      // Remove horizontal safe-area padding for the master pane:
      // the NavigationRail (left) and detail pane (right) handle their
      // own insets, so SettingsScreen should not add extra padding.
      final noHorizontalPadding = MediaQuery.of(
        context,
      ).padding.copyWith(left: 0, right: 0);

      return Row(
        children: [
          SizedBox(
            width: 300,
            child: MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(padding: noHorizontalPadding),
              child: const SettingsScreen(),
            ),
          ),
          Expanded(child: child),
        ],
      );
    }

    // Mobile: just show the child (full-screen)
    return child;
  }
}

/// Default content for the `/settings` route.
///
/// - Desktop: placeholder text ("Select an option from the left column")
///   because SettingsShell already shows the settings list on the left.
/// - Mobile: full settings list (SettingsScreen).
class SettingsDefaultPage extends StatelessWidget {
  const SettingsDefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.large) {
      // Desktop: placeholder in the detail pane
      return Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              AppLocalizations.of(context)!.selectOptionLeftColumn,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      );
    }

    // Mobile: show the settings list
    return const SettingsScreen();
  }
}
