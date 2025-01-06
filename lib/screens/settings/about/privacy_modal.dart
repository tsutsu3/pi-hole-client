import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class PrivacyModal extends StatefulWidget {
  const PrivacyModal({super.key});

  @override
  State<PrivacyModal> createState() => _PrivacyModalState();
}

class _PrivacyModalState extends State<PrivacyModal> {
  final expandableController = ExpandableController();

  Future<bool> _getSendCrashReports(AppConfigProvider appConfigProvider) async {
    return appConfigProvider.sendCrashReports;
  }

  Widget _appDetailLine({
    String? url,
    Widget? icon,
    required String title,
    required String subtitle,
    required ColorScheme colorScheme,
    bool showWebViewIcon = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: url != null ? () => openUrl(url) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon ?? const SizedBox(width: 0),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              if (showWebViewIcon)
                Tooltip(
                  message: AppLocalizations.of(context)!.openExternalUrl,
                  child: Icon(
                    Icons.open_in_browser_rounded,
                    size: 20,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appConfigProvider =
        Provider.of<AppConfigProvider>(context, listen: true);

    return FutureBuilder<bool>(
      future: _getSendCrashReports(appConfigProvider),
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

        return AlertDialog(
          scrollable: true,
          title: Column(
            children: [
              Icon(
                Icons.contact_page_rounded,
                size: 24,
                color: colorScheme.secondary,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!.privacyInfo,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          contentPadding: const EdgeInsets.all(40),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appDetailLine(
                url: Urls.privacyPolicy,
                icon: Icon(
                  Icons.privacy_tip_rounded,
                  color: colorScheme.onSurface,
                ),
                title: AppLocalizations.of(context)!.privacyPolicy,
                subtitle:
                    AppLocalizations.of(context)!.privacyPolicyDescription,
                colorScheme: colorScheme,
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.allowCrashReport,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Switch(
                    value: sendCrashReportStatus,
                    onChanged: (value) async {
                      await appConfigProvider.setSendCrashReports(value);
                    },
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        );
      },
    );
  }
}
