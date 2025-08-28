import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/languages.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_radio.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/utils/colors.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    // Create a sorted copy of languageOptions.
    final sortedLanguageOptions = List.from(languageOptions)
      ..sort((a, b) => a.key.compareTo(b.key));

    return WillPopScope(
      // Ensures the system back gesture (or physical back button) navigates back to the Settings screen.
      // Without this, the gesture back may cause the app to exit/close.
      // Note: Using PopScope instead does not return to Settings and causes the app to close.
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.language)),
        body: SafeArea(
          child: ListView(
            children: sortedLanguageOptions.map((languageOption) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    appConfigProvider.setSelectedLanguage(languageOption.key);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      title: Text(
                        languageOption.displayName,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: getListTextColor(context),
                        ),
                      ),
                      trailing: CustomRadio(
                        value: languageOption.index,
                        groupValue: appConfigProvider.selectedLanguageNumber,
                        backgroundColor: Theme.of(
                          context,
                        ).dialogTheme.backgroundColor!,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
