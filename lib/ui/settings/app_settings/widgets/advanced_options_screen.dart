import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/app_unlock_setup_modal.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/enter_passcode_modal.dart';
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
      final result = await appConfigViewModel.setShowLoadingAnimation(
        newStatus,
      );
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
            ListTile(
              leading: const Icon(Icons.fingerprint_rounded),
              title: Text(AppLocalizations.of(context)!.appUnlock),
              subtitle: Text(
                AppLocalizations.of(context)!.appUnlockDescription,
              ),
              onTap: openAppUnlockModal,
            ),
            SectionLabel(label: AppLocalizations.of(context)!.charts),
            ListTile(
              leading: const Icon(Icons.stacked_line_chart_rounded),
              title: Text(AppLocalizations.of(context)!.reducedDataCharts),
              subtitle: Text(
                AppLocalizations.of(context)!.reducedDataChartsDescription,
              ),
              onTap: () =>
                  updateUseReducedData(!appConfigViewModel.reducedDataCharts),
              trailing: Switch(
                value: appConfigViewModel.reducedDataCharts,
                onChanged: updateUseReducedData,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exposure_zero_rounded),
              title: Text(AppLocalizations.of(context)!.hideZeroValues),
              subtitle: Text(
                AppLocalizations.of(context)!.hideZeroValuesDescription,
              ),
              onTap: () =>
                  updateHideZeroValues(!appConfigViewModel.hideZeroValues),
              trailing: Switch(
                value: appConfigViewModel.hideZeroValues,
                onChanged: updateHideZeroValues,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.animation_rounded),
              title: Text(AppLocalizations.of(context)!.showLoadingAnimation),
              subtitle: Text(
                AppLocalizations.of(context)!.showLoadingAnimationDescription,
              ),
              onTap: () => updateShowLoadingAnimation(
                !appConfigViewModel.loadingAnimation,
              ),
              trailing: Switch(
                value: appConfigViewModel.loadingAnimation,
                onChanged: updateShowLoadingAnimation,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart_rounded),
              title: Text(AppLocalizations.of(context)!.chartDisplayModeTitle),
              subtitle: Text(
                AppLocalizations.of(context)!.chartDisplayModeSubtitle,
              ),
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedChartVisualization,
              ),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.performance),
            ListTile(
              leading: const Icon(Icons.update),
              title: Text(AppLocalizations.of(context)!.autoRefreshTime),
              subtitle: Text(
                '${appConfigViewModel.getAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              ),
              onTap: () =>
                  context.pushNamed(Routes.settingsAppAdvancedStatsRefreshTime),
            ),
            ListTile(
              leading: const Icon(Icons.timer_outlined),
              title: Text(AppLocalizations.of(context)!.liveLog),
              subtitle: Text(AppLocalizations.of(context)!.liveLogDescription),
              onTap: () => updateLiveLog(!appConfigViewModel.liveLog),
              trailing: Switch(
                value: appConfigViewModel.liveLog,
                onChanged: updateLiveLog,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: Text(AppLocalizations.of(context)!.logAutoRefreshTime),
              subtitle: Text(
                '${appConfigViewModel.logAutoRefreshTime} ${AppLocalizations.of(context)!.seconds}',
              ),
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedLogRefreshInterval,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list_rounded),
              title: Text(AppLocalizations.of(context)!.logsQuantityPerLoad),
              subtitle: Text(logDescription),
              onTap: () =>
                  context.pushNamed(Routes.settingsAppAdvancedLogsQuantityLoad),
            ),
            SectionLabel(label: AppLocalizations.of(context)!.others),
            ListTile(
              leading: const Icon(Icons.list),
              title: Text(AppLocalizations.of(context)!.appLogs),
              subtitle: Text(AppLocalizations.of(context)!.errorsApp),
              onTap: () => context.pushNamed(Routes.settingsAppAdvancedAppLogs),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text(AppLocalizations.of(context)!.resetApplication),
              subtitle: Text(AppLocalizations.of(context)!.erasesAppData),
              subtitleTextStyle: TextStyle(
                color: appConfigViewModel.colors.commonRed ?? Colors.red,
              ),
              onTap: () => context.pushNamed(
                Routes.settingsAppAdvancedReset,
                extra: deleteApplicationData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
