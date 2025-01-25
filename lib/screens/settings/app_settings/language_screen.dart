import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/constants/languages.dart';
import 'package:pi_hole_client/functions/colors.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/widgets/custom_radio.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedItem = 0;

  @override
  void initState() {
    _selectedItem = Provider.of<AppConfigProvider>(context, listen: false)
        .selectedLanguageNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // System language
            // Other languages
            ...(languageOptions..sort((a, b) => a.key.compareTo(b.key)))
                .map((languageOption) {
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() => _selectedItem = languageOption.index);
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
                        groupValue: _selectedItem,
                        backgroundColor:
                            Theme.of(context).dialogBackgroundColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
