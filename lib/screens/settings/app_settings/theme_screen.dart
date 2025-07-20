import 'package:flutter/material.dart';
import 'package:pi_hole_client/functions/colors.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/custom_radio.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  Widget _buildThemeRow(
    BuildContext context, {
    required IconData icon,
    required String text,
    required int value,
    required AppConfigProvider appConfigProvider,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          appConfigProvider.setSelectedTheme(value);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: getListTextColor(context),
              ),
            ),
            trailing: CustomRadio(
              value: value,
              groupValue: appConfigProvider.selectedThemeNumber,
              backgroundColor: Theme.of(context).dialogTheme.backgroundColor!,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    return WillPopScope(
      // Ensures the system back gesture (or physical back button) navigates back to the Settings screen.
      // Without this, the gesture back may cause the app to exit/close.
      // Note: Using PopScope instead does not return to Settings and causes the app to close.
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.theme),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              _buildThemeRow(
                context,
                icon: Icons.phone_android_rounded,
                text: AppLocalizations.of(context)!.systemTheme,
                value: 0,
                appConfigProvider: appConfigProvider,
              ),
              _buildThemeRow(
                context,
                icon: Icons.light_mode_rounded,
                text: AppLocalizations.of(context)!.light,
                value: 1,
                appConfigProvider: appConfigProvider,
              ),
              _buildThemeRow(
                context,
                icon: Icons.dark_mode_rounded,
                text: AppLocalizations.of(context)!.dark,
                value: 2,
                appConfigProvider: appConfigProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
