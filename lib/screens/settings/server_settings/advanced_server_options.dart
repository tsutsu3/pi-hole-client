import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/widgets/confirmation_modal.dart';
import 'package:pi_hole_client/widgets/custom_button_list_tile.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvancedServerOptions extends StatefulWidget {
  const AdvancedServerOptions({super.key});

  @override
  State<AdvancedServerOptions> createState() => _AdvancedServerOptionsState();
}

class _AdvancedServerOptionsState extends State<AdvancedServerOptions> {
  late ApiGateway? apiGateway;
  late AppConfigProvider appConfigProvider;
  bool? isLoggingEnabled;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();
    apiGateway = context.watch<ServersProvider>().selectedApiGateway;

    // Get the query logging status when the widget is first built
    if (isLoading && apiGateway != null) {
      _loadQueryLoggingStatus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    isLoggingEnabled = null;
    isLoading = true;
  }

  Future<void> _loadQueryLoggingStatus() async {
    setState(() => isLoading = true);

    final result =
        await apiGateway?.getConfiguration(element: 'dns/queryLogging');
    if (!mounted) return;

    setState(() {
      if (result?.result == APiResponseType.success) {
        isLoggingEnabled = result?.data?.dns?.queryLogging;
      } else {
        isLoggingEnabled = null;
        logger.i('failed ok');
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.watch<AppConfigProvider>();
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );
    final theme = Theme.of(context).extension<AppColors>()!;

    if (apiGateway == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.interface),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    if (apiGateway.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.adlistManagementTitle),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    final loggingEnabled = isLoggingEnabled;
    logger.i('loggingEnabled $loggingEnabled');
    logger.i('isLoading $isLoading');

    Future<void> onEnableQueryLogging() async {
      final process = ProcessModal(context: context);
      final isCurrentlyEnabled = isLoggingEnabled;

      process.open(
        isLoggingEnabled == true
            ? AppLocalizations.of(context)!.disableQueryLogging
            : AppLocalizations.of(context)!.enableQueryLogging,
      );

      final result = isLoggingEnabled == true
          ? await apiGateway.patchDnsQueryLoggingConfig(false)
          : await apiGateway.patchDnsQueryLoggingConfig(true);
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      if (result.result == APiResponseType.success) {
        setState(() {
          isLoggingEnabled =
              isCurrentlyEnabled == null ? null : !isCurrentlyEnabled;
        });

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: isLoggingEnabled == true
              ? AppLocalizations.of(context)!.disableQueryLogSuccess
              : AppLocalizations.of(context)!.enableQueryLogSuccess,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: isLoggingEnabled == true
              ? AppLocalizations.of(context)!.disableQueryLogFailure
              : AppLocalizations.of(context)!.enableQueryLogFailure,
        );
      }
    }

    Future<void> onRestartDns() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.restartingDnsResolver);

      final result = await apiGateway.restartDns();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      if (result.result == APiResponseType.success) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.dnsRestartSuccess,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.dnsRestartFailure,
        );
      }
    }

    Future<void> onFlushArp() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.flushingNetworkTable);

      final result = await apiGateway.flushArp();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      if (result.result == APiResponseType.success) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.flushedNetworkTableSuccess,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.flushedNetworkTableFailure,
        );
      }
    }

    Future<void> onFlushLogs() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.flushingLogs);

      final result = await apiGateway.flushLogs();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      if (result.result == APiResponseType.success) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.flushLogsSuccess,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.flushLogsFailure,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.advancedSetup),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: ListView(
            children: [
              SectionLabel(label: AppLocalizations.of(context)!.actions),
              Skeletonizer(
                enabled: isLoading,
                effect: ShimmerEffect(
                  baseColor: Theme.of(context).colorScheme.secondaryContainer,
                  highlightColor: Theme.of(context).colorScheme.surface,
                ),
                child: loggingEnabled == null
                    ? CustomButtonListTile(
                        leadingIcon: Icons.notifications_rounded,
                        label: AppLocalizations.of(context)!.tryAgainLater,
                        color: isLoading
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      )
                    : CustomButtonListTile(
                        leadingIcon: loggingEnabled
                            ? Icons.stop_rounded
                            : Icons.play_arrow_rounded,
                        label: loggingEnabled
                            ? AppLocalizations.of(context)!.disableQueryLogging
                            : AppLocalizations.of(context)!.enableQueryLogging,
                        color: isLoading
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : loggingEnabled
                                ? theme.queryOrange
                                : theme.queryBlue,
                        onTap: () => showDialog(
                          context: context,
                          useRootNavigator: false,
                          builder: (context) => ConfirmationModal(
                            icon: loggingEnabled
                                ? Icons.stop_rounded
                                : Icons.play_arrow_rounded,
                            title: loggingEnabled
                                ? AppLocalizations.of(context)!
                                    .disableQueryLogging
                                : AppLocalizations.of(context)!
                                    .enableQueryLogging,
                            message: AppLocalizations.of(context)!
                                .queryLoggingSwitchWarning,
                            onConfirm: onEnableQueryLogging,
                            confirmButtonText: loggingEnabled
                                ? AppLocalizations.of(context)!.disable
                                : AppLocalizations.of(context)!.enable,
                            confirmButtonColor: loggingEnabled
                                ? theme.queryOrange
                                : theme.queryBlue,
                          ),
                          barrierDismissible: false,
                        ),
                      ),
              ),
              CustomButtonListTile(
                leadingIcon: Icons.restart_alt_rounded,
                label: AppLocalizations.of(context)!.restartDnsResolver,
                color: theme.queryOrange,
                onTap: () => showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) => ConfirmationModal(
                    icon: Icons.restart_alt_rounded,
                    title: AppLocalizations.of(context)!.restartDnsResolver,
                    message: AppLocalizations.of(context)!.dnsRestartWarning,
                    onConfirm: onRestartDns,
                    confirmButtonText: AppLocalizations.of(context)!.restart,
                    confirmButtonColor: theme.queryOrange,
                  ),
                  barrierDismissible: false,
                ),
              ),
              CustomButtonListTile(
                leadingIcon: Icons.delete_rounded,
                label: AppLocalizations.of(context)!.flushNetworkTable,
                color: theme.queryRed,
                onTap: () => showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) => ConfirmationModal(
                    icon: Icons.delete_rounded,
                    title: AppLocalizations.of(context)!.flushNetworkTable,
                    message:
                        AppLocalizations.of(context)!.flushNetworkTableWarning,
                    onConfirm: onFlushArp,
                    confirmButtonText: AppLocalizations.of(context)!.flush,
                    confirmButtonColor: theme.queryRed,
                  ),
                  barrierDismissible: false,
                ),
              ),
              CustomButtonListTile(
                leadingIcon: Icons.delete_rounded,
                label: AppLocalizations.of(context)!.flushLogs24h,
                color: theme.queryRed,
                onTap: () => showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (context) => ConfirmationModal(
                    icon: Icons.delete_rounded,
                    title: AppLocalizations.of(context)!.flushLogs,
                    message: AppLocalizations.of(context)!.flushLogsWarning,
                    onConfirm: onFlushLogs,
                    confirmButtonText: AppLocalizations.of(context)!.flush,
                    confirmButtonColor: theme.queryRed,
                  ),
                  barrierDismissible: false,
                ),
              ),
              // SectionLabel(label: AppLocalizations.of(context)!.system),
              // CustomListTile(
              //   leadingIcon: Icons.settings_ethernet_rounded,
              //   label: AppLocalizations.of(context)!.dhcp,
              //   description: AppLocalizations.of(context)!.dhcpDescription,
              // ),
              // CustomListTile(
              //   leadingIcon: Icons.devices_rounded,
              //   label: AppLocalizations.of(context)!.sessions,
              //   description: AppLocalizations.of(context)!.sessionsDescription,
              // ),
              SectionLabel(label: AppLocalizations.of(context)!.tools),
              // CustomListTile(
              //   leadingIcon: Icons.manage_search_rounded,
              //   label: AppLocalizations.of(context)!.searchAdlistsTitle,
              //   description:
              //       AppLocalizations.of(context)!.searchAdlistsDescription,
              // ),
              CustomListTile(
                leadingIcon: Icons.wifi_rounded,
                label: AppLocalizations.of(context)!.interface,
                description: AppLocalizations.of(context)!.interfaceDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InterfaceScreen(),
                  ),
                ),
              ),
              // CustomListTile(
              //   leadingIcon: Icons.lan_rounded,
              //   label: AppLocalizations.of(context)!.network,
              //   description: AppLocalizations.of(context)!.networkDescription,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
