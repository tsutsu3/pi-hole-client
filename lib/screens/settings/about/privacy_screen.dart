import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/list_tile_title.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';
import 'package:provider/provider.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.privacyInfo),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Privacy Policy Section
              SectionLabel(
                label: AppLocalizations.of(context)!.privacyPolicy,
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.privacyPolicy,
                  colorScheme: colorScheme,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.privacyPolicyDescription,
                ),
                trailing: Icon(
                  Icons.open_in_new_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
                onTap: () => openUrl(Urls.privacyPolicy),
              ),
              const SizedBox(height: 20),
              // Crash Report Section
              SectionLabel(
                label: AppLocalizations.of(context)!.sendCrashReport,
              ),
              ListTile(
                leading: const Icon(Icons.bug_report_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.enableCrashReport,
                  colorScheme: colorScheme,
                ),
                subtitle:
                    Text(AppLocalizations.of(context)!.enableCrashReportDetail),
                trailing: Consumer<AppConfigProvider>(
                  builder: (context, appConfigProvider, child) {
                    return Switch(
                      value: appConfigProvider.sendCrashReports,
                      onChanged: (bool value) async {
                        final result =
                            await appConfigProvider.setSendCrashReports(value);
                        if (!context.mounted) return;
                        if (result == true) {
                          showCautionSnackBar(
                            context: context,
                            appConfigProvider: appConfigProvider,
                            label: AppLocalizations.of(context)!
                                .restartAppTakeEffect,
                            duration: 6,
                          );
                        } else {
                          showErrorSnackBar(
                            context: context,
                            appConfigProvider: appConfigProvider,
                            label: AppLocalizations.of(context)!
                                .cannotUpdateSettings,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
