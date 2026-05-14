import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/l10n/languages.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/colors.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    // Create a sorted copy of languageOptions.
    final sortedLanguageOptions = List.from(languageOptions)
      ..sort((a, b) => a.key.compareTo(b.key));

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.language)),
      body: RadioGroup<int>(
        groupValue: appConfigViewModel.selectedLanguageNumber,
        onChanged: (v) {
          if (v != null) {
            final option = sortedLanguageOptions.firstWhere(
              (opt) => opt.index == v,
            );
            appConfigViewModel.setSelectedLanguage(option.key);
          }
        },
        child: SafeArea(
          child: ListView(
            children: sortedLanguageOptions.map((languageOption) {
              return RadioListTile<int>(
                value: languageOption.index,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  languageOption.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: getListTextColor(context),
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
