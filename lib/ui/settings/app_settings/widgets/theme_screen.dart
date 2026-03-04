import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/colors.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  Widget _buildThemeRow(
    BuildContext context, {
    required IconData icon,
    required String text,
    required AppThemeMode value,
  }) {
    return RadioListTile<AppThemeMode>(
      value: value,
      secondary: Icon(icon),
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: getListTextColor(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    return WillPopScope(
      // Ensures the system back gesture (or physical back button) navigates back to the Settings screen.
      // Without this, the gesture back may cause the app to exit/close.
      // Note: Using PopScope instead does not return to Settings and causes the app to close.
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.theme)),
        body: RadioGroup<AppThemeMode>(
          groupValue: appConfigViewModel.appThemeMode,
          onChanged: (v) => appConfigViewModel.setSelectedTheme(v!),
          child: SafeArea(
            child: ListView(
              children: [
                _buildThemeRow(
                  context,
                  icon: Icons.phone_android_rounded,
                  text: AppLocalizations.of(context)!.systemTheme,
                  value: AppThemeMode.system,
                ),
                _buildThemeRow(
                  context,
                  icon: Icons.light_mode_rounded,
                  text: AppLocalizations.of(context)!.light,
                  value: AppThemeMode.light,
                ),
                _buildThemeRow(
                  context,
                  icon: Icons.dark_mode_rounded,
                  text: AppLocalizations.of(context)!.dark,
                  value: AppThemeMode.dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
