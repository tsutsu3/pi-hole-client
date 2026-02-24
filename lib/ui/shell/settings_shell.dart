import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/settings/settings.dart';

/// Shell for Settings routes that provides a master-detail layout on desktop.
///
/// - Desktop (width > [ResponsiveConstants.large]):
///   `Row[SettingsWidget (master) | child (detail)]`
/// - Mobile: returns [child] directly (full-screen).
class SettingsShell extends StatelessWidget {
  const SettingsShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.large) {
      return Row(
        children: [
          const SizedBox(width: 300, child: SettingsWidget()),
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
/// - Mobile: full settings list (SettingsWidget).
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
    return const SettingsWidget();
  }
}
