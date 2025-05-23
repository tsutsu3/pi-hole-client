import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class StartInfoModal extends StatelessWidget {
  const StartInfoModal({super.key});

  Future<bool> getSendCrashReports(AppConfigProvider appConfigProvider) async {
    return appConfigProvider.sendCrashReports;
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    return FutureBuilder<bool>(
      future: getSendCrashReports(appConfigProvider),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        final sendCrashReportStatus = snapshot.data ?? false;

        return Dialog(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: IntrinsicHeight(
              child: AlertDialog(
                scrollable: true,
                title: Column(
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
                contentPadding: const EdgeInsets.only(top: 60),
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
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(top: 10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pi-hole: v5.12+',
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Web interface: v5.14.2+',
                                textAlign: TextAlign.left,
                              ),
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
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          AppLocalizations.of(context)!.helpUsImproveMessage,
                          textAlign: TextAlign.left,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.allowCrashReport,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Switch(
                              value: sendCrashReportStatus,
                              onChanged: (value) async {
                                await appConfigProvider
                                    .setSendCrashReports(value);
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
                              const TextSpan(text: ' '),
                              TextSpan(
                                text:
                                    AppLocalizations.of(context)!.privacyPolicy,
                                style: const TextStyle(
                                  color:
                                      Colors.blue, // ToDo: Use the theme color
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => openUrl(Urls.privacyPolicy),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                ),
                actionsPadding: const EdgeInsets.only(bottom: 20),
                actions: [
                  TextButton(
                    onPressed: () async {
                      await appConfigProvider.setImportantInfoReaden(true);
                      if (!context.mounted) return;
                      await Navigator.maybePop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.close),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
