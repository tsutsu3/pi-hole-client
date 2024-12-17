// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/providers/app_config_provider.dart';

class StartInfoModal extends StatelessWidget {
  const StartInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider =
        Provider.of<AppConfigProvider>(context, listen: false);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: IntrinsicHeight(
          child: AlertDialog(
            scrollable: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_rounded,
                  size: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context)!.gettingStarted,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.only(top: 60),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show the required versions
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.requiredVersions,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pi-hole: v5.12+",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5),
                          Text("Web interface: v5.14.2+",
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      AppLocalizations.of(context)!.olderVersion,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 60)),
                // Help improve the app
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.helpUsImprove,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      AppLocalizations.of(context)!.helpUsImproveMessage,
                      textAlign: TextAlign.left,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.allowCrashReport,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Switch(
                          value: true, // todo: add db value
                          onChanged: (value) {
                            // use provider
                          },
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!
                                .agreePrivacyPolicy,
                            style: const TextStyle(fontSize: 14),
                          ),
                          TextSpan(text: ' '),
                          TextSpan(
                            text: AppLocalizations.of(context)!.privacyPolicy,
                            style: const TextStyle(
                              color: Colors.blue, // ToDo: Use the theme color
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => openUrl(privacyPolicyUrl),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await appConfigProvider.setImportantInfoReaden(true);
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
