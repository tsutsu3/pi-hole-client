import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/enter_passcode_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/reset_screen.dart';
import 'package:provider/provider.dart';

class AdvancedOptionsScreen extends StatelessWidget {
  const AdvancedOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    final topBarHeight = MediaQuery.of(context).viewPadding.top;
    final width = MediaQuery.of(context).size.width;

    final isV6 =
        serversViewModel.selectedServer?.apiVersion.startsWith('v6') ?? false;

    final logDescription = isV6
        ? AppLocalizations.of(context)!.logsSettingNotApplicable
        : '${appConfigViewModel.logsPerQuery == 0.5 ? '30' : appConfigViewModel.logsPerQuery.toInt()} '
              '${appConfigViewModel.logsPerQuery == 0.5 ? AppLocalizations.of(context)!.minutes : AppLocalizations.of(context)!.hours}';

    Future<void> updateUseReducedData(bool newStatus) async {
      final result = await appConfigViewModel.setReducedDataCharts(newStatus);
      if (!context.mounted) return;

      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> updateHideZeroValues(bool newStatus) async {
      final result = await appConfigViewModel.setHideZeroValues(newStatus);
      if (!context.mounted) return;

      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> updateShowLoadingAnimation(bool newStatus) async {
      final result = await appConfigViewModel.setShowLoadingAnimation(newStatus);
      if (!context.mounted) return;

      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> updateLiveLog(bool newStatus) async {
      final result = await appConfigViewModel.setLiveLog(newStatus);
      if (!context.mounted) return;

      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.settingsUpdatedSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context)!.cannotUpdateSettings,
        );
      }
    }

    Future<void> deleteApplicationData() async {
      Future<void> reset() async {
        final process = ProcessModal(context: context);
        process.open(AppLocalizations.of(context)!.deleting);
        await serversViewModel.deleteDbData();
        await appConfigViewModel.restoreAppConfig();
        if (!context.mounted) return;
        appConfigViewModel.setSelectedTab(0);
        process.close();
        Phoenix.rebirth(context);
      }

      if (appConfigViewModel.passCode != null) {
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
              useBiometrics: appConfigViewModel.useBiometrics,
              window: true,
            ),
          );
        } else {
          showModalBottomSheet(
            context: context,
            builder: (context) => AppUnlockSetupModal(
              topBarHeight: topBarHeight,
              useBiometrics: appConfigViewModel.useBiometrics,
              window: false,
            ),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          );
        }
      }

      if (appConfigViewModel.passCode != null) {
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
                  updateUseReducedData(!appConfigViewModel.reducedDataCharts),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigViewModel.reducedDataCharts,
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
                  updateHideZeroValues(!appConfigViewModel.hideZeroValues),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigViewModel.hideZeroValues,
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
                !appConfigViewModel.loadingAnimation,
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigViewModel.loadingAnimation,
                onChanged: updateShowLoadingAnimation,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.pie_chart_rounded,
              label: AppLocalizations.of(context)!.chartDisplayModeTitle,
              description: AppLocalizations.of(
                context,
              )!.chartDisplayModeSubtitle,
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedChartVisualization,
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
                  '${appConfigViewModel.getAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedStatsRefreshTime,
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
              onTap: () => updateLiveLog(!appConfigViewModel.liveLog),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              trailing: Switch(
                value: appConfigViewModel.liveLog,
                onChanged: updateLiveLog,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.update,
              label: AppLocalizations.of(context)!.logAutoRefreshTime,
              description:
                  '${appConfigViewModel.logAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedLogRefreshInterval,
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
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedLogsQuantityLoad,
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
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedAppLogs,
              ),
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
              color: appConfigViewModel.colors.commonRed ?? Colors.red,
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
