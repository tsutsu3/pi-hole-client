// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pi_hole_client/classes/http_override.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/system_overlay_style.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/app_logs/app_logs.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/enter_passcode_modal.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/logs_quantity_load_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/reset_screen.dart';
import 'package:pi_hole_client/screens/settings/app_settings/advanced_settings/statistics_visualization_screen.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class AdvancedOptions extends StatelessWidget {
  const AdvancedOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final topBarHeight = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;

    Future<void> updateSslCheck(bool newStatus) async {
      final result = await appConfigProvider.setOverrideSslCheck(newStatus);
      if (result == true) {
        showCautionSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.restartAppTakeEffect,
          duration: 6,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> updateUseReducedData(bool newStatus) async {
      final result = await appConfigProvider.setReducedDataCharts(newStatus);
      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> updateHideZeroValues(bool newStatus) async {
      final result = await appConfigProvider.setHideZeroValues(newStatus);
      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> deleteApplicationData() async {
      Future<void> reset() async {
        final process = ProcessModal(context: context);
        process.open(AppLocalizations.of(context)!.deleting);
        await serversProvider.deleteDbData();
        await appConfigProvider.restoreAppConfig();
        appConfigProvider.setSelectedTab(0);
        process.close();
        if (appConfigProvider.overrideSslCheck == true) {
          logger.d('SSL Check Override: ON');
          HttpOverrides.global = MyHttpOverrides();
        }
        Phoenix.rebirth(context);
      }

      if (appConfigProvider.passCode != null) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => EnterPasscodeModal(
              onConfirm: reset,
              window: width > ResponsiveConstants.medium,
            ),
          ),
        );
      } else {
        await reset();
      }
    }

    void openAppUnlockModal() {
      void openModal() {
        if (width > ResponsiveConstants.medium) {
          showDialog(
            context: context,
            useRootNavigator:
                false, // Prevents unexpected app exit on mobile when pressing back
            builder: (context) => AppUnlockSetupModal(
              topBarHeight: topBarHeight,
              useBiometrics: appConfigProvider.useBiometrics,
              window: true,
            ),
          );
        } else {
          showModalBottomSheet(
            context: context,
            builder: (context) => AppUnlockSetupModal(
              topBarHeight: topBarHeight,
              useBiometrics: appConfigProvider.useBiometrics,
              window: false,
            ),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          );
        }
      }

      if (appConfigProvider.passCode != null) {
        if (width > ResponsiveConstants.medium) {
          showDialog(
            context: context,
            useRootNavigator:
                false, // Prevents unexpected app exit on mobile when pressing back
            builder: (BuildContext context) => EnterPasscodeModal(
              onConfirm: openModal,
              window: true,
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) => EnterPasscodeModal(
                onConfirm: openModal,
                window: false,
              ),
            ),
          );
        }
      } else {
        openModal();
      }
    }

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: systemUiOverlayStyleConfig(context),
        title: Text(AppLocalizations.of(context)!.advancedSetup),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.security),
            CustomListTile(
              leadingIcon: Icons.lock,
              label: AppLocalizations.of(context)!.dontCheckCertificate,
              description:
                  AppLocalizations.of(context)!.dontCheckCertificateDescription,
              trailing: Switch(
                value: appConfigProvider.overrideSslCheck,
                onChanged: updateSslCheck,
              ),
              onTap: () => updateSslCheck(!appConfigProvider.overrideSslCheck),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.fingerprint_rounded,
              label: AppLocalizations.of(context)!.appUnlock,
              description: AppLocalizations.of(context)!.appUnlockDescription,
              onTap: openAppUnlockModal,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.charts),
            CustomListTile(
              leadingIcon: Icons.stacked_line_chart_rounded,
              label: AppLocalizations.of(context)!.reducedDataCharts,
              description:
                  AppLocalizations.of(context)!.reducedDataChartsDescription,
              onTap: () =>
                  updateUseReducedData(!appConfigProvider.reducedDataCharts),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigProvider.reducedDataCharts,
                onChanged: updateUseReducedData,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.exposure_zero_rounded,
              label: AppLocalizations.of(context)!.hideZeroValues,
              description:
                  AppLocalizations.of(context)!.hideZeroValuesDescription,
              onTap: () =>
                  updateHideZeroValues(!appConfigProvider.hideZeroValues),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigProvider.hideZeroValues,
                onChanged: updateHideZeroValues,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.pie_chart_rounded,
              label: AppLocalizations.of(context)!.domainsClientsDataMode,
              description: AppLocalizations.of(context)!
                  .domainsClientsDataModeDescription,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StatisticsVisualizationScreen(),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.performance),
            CustomListTile(
              leadingIcon: Icons.update,
              label: AppLocalizations.of(context)!.autoRefreshTime,
              description:
                  '${appConfigProvider.getAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AutoRefreshTimeScreen(),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.list_rounded,
              label: AppLocalizations.of(context)!.logsQuantityPerLoad,
              description:
                  '${appConfigProvider.logsPerQuery == 0.5 ? '30' : appConfigProvider.logsPerQuery.toInt()} ${appConfigProvider.logsPerQuery == 0.5 ? AppLocalizations.of(context)!.minutes : AppLocalizations.of(context)!.hours}',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogsQuantityLoadScreen(),
                ),
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.others),
            CustomListTile(
              leadingIcon: Icons.list,
              label: AppLocalizations.of(context)!.appLogs,
              description: AppLocalizations.of(context)!.errorsApp,
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppLogs(),
                  ),
                ),
              },
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.delete,
              label: AppLocalizations.of(context)!.resetApplication,
              description: AppLocalizations.of(context)!.erasesAppData,
              color: convertColor(serversProvider.colors, Colors.red),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetScreen(
                      onConfirm: deleteApplicationData,
                    ),
                  ),
                ),
              },
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
