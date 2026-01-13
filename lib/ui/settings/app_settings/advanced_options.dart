import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/ui/app_logs/app_logs.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/auto_refresh_time_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/chart_visualization_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/enter_passcode_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/log_refresh_interval_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/logs_quantity_load_screen.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/reset_screen.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:provider/provider.dart';

class AdvancedOptions extends StatelessWidget {
  const AdvancedOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final topBarHeight = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;

    final isV6 =
        serversProvider.selectedServer?.apiVersion.startsWith('v6') ?? false;

    final logDescription = isV6
        ? AppLocalizations.of(context)!.logsSettingNotApplicable
        : '${appConfigProvider.logsPerQuery == 0.5 ? '30' : appConfigProvider.logsPerQuery.toInt()} '
              '${appConfigProvider.logsPerQuery == 0.5 ? AppLocalizations.of(context)!.minutes : AppLocalizations.of(context)!.hours}';

    Future<void> updateUseReducedData(bool newStatus) async {
      final result = await appConfigProvider.setReducedDataCharts(newStatus);
      if (!context.mounted) return;

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
      if (!context.mounted) return;

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

    Future<void> updateShowLoadingAnimation(bool newStatus) async {
      final result = await appConfigProvider.setShowLoadingAnimation(newStatus);
      if (!context.mounted) return;

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

    Future<void> updateLiveLog(bool newStatus) async {
      final result = await appConfigProvider.setLiveLog(newStatus);
      if (!context.mounted) return;

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
        if (!context.mounted) return;
        appConfigProvider.setSelectedTab(0);
        process.close();
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
            builder: (BuildContext context) =>
                EnterPasscodeModal(onConfirm: openModal, window: true),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) =>
                  EnterPasscodeModal(onConfirm: openModal, window: false),
            ),
          );
        }
      } else {
        openModal();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.advancedSetup)),
      body: SafeArea(
        child: ListView(
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.security),
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
              description: AppLocalizations.of(
                context,
              )!.reducedDataChartsDescription,
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
              description: AppLocalizations.of(
                context,
              )!.hideZeroValuesDescription,
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
              leadingIcon: Icons.animation_rounded,
              label: AppLocalizations.of(context)!.showLoadingAnimation,
              description: AppLocalizations.of(
                context,
              )!.showLoadingAnimationDescription,
              onTap: () => updateShowLoadingAnimation(
                !appConfigProvider.loadingAnimation,
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigProvider.loadingAnimation,
                onChanged: updateShowLoadingAnimation,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.pie_chart_rounded,
              label: AppLocalizations.of(context)!.chartDisplayModeTitle,
              description: AppLocalizations.of(
                context,
              )!.chartDisplayModeSubtitle,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChartVisualizationScreen(),
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
              leadingIcon: Icons.timer_outlined,
              label: AppLocalizations.of(context)!.liveLog,
              description: AppLocalizations.of(context)!.liveLogDescription,
              onTap: () => updateLiveLog(!appConfigProvider.liveLog),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigProvider.liveLog,
                onChanged: updateLiveLog,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.update,
              label: AppLocalizations.of(context)!.logAutoRefreshTime,
              description:
                  '${appConfigProvider.logAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogRefreshIntervalScreen(),
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
              description: logDescription,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogsQuantityLoadScreen(
                    apiVersion:
                        serversProvider.selectedServer?.apiVersion ?? '',
                  ),
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
                  MaterialPageRoute(builder: (context) => const AppLogs()),
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
                    builder: (context) =>
                        ResetScreen(onConfirm: deleteApplicationData),
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
