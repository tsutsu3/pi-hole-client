import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_button_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/confirmation_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvancedServerOptions extends StatefulWidget {
  const AdvancedServerOptions({super.key});

  @override
  State<AdvancedServerOptions> createState() => _AdvancedServerOptionsState();
}

class _AdvancedServerOptionsState extends State<AdvancedServerOptions> {
  late AppConfigProvider appConfigProvider;
  ApiGateway? apiGateway;
  ApiGateway? _previousApiGateway;
  bool? isLoggingEnabled;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentApiGateway = context
        .watch<ServersProvider>()
        .selectedApiGateway;
    appConfigProvider = context.watch<AppConfigProvider>();

    // Check if the selected API gateway has changed
    if (currentApiGateway != _previousApiGateway) {
      _previousApiGateway = currentApiGateway;
      apiGateway = currentApiGateway;

      if (apiGateway != null) {
        _loadQueryLoggingStatus();
      } else {
        setState(() {
          isLoading = false;
          isLoggingEnabled = null;
        });
      }
    }
  }

  @override
  void dispose() {
    isLoggingEnabled = null;
    isLoading = true;
    super.dispose();
  }

  Future<void> _loadQueryLoggingStatus() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
      isLoggingEnabled = null;
    });

    final result = await apiGateway?.getConfiguration(
      element: 'dns/queryLogging',
    );
    if (!mounted) return;

    setState(() {
      if (result?.result == APiResponseType.success) {
        isLoggingEnabled = result?.data?.dns?.queryLogging;
      } else {
        isLoggingEnabled = null;
        logger.i('Failed to fetch query logging status');
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
          title: Text(AppLocalizations.of(context)!.advancedSetup),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (apiGateway.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.advancedSetup),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    final loggingEnabled = isLoggingEnabled;

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
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: isLoggingEnabled == true
              ? AppLocalizations.of(context)!.disableQueryLogSuccess
              : AppLocalizations.of(context)!.enableQueryLogSuccess,
        );

        setState(() {
          isLoggingEnabled = isCurrentlyEnabled == null
              ? null
              : !isCurrentlyEnabled;
        });
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.advancedSetup)),
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
                                ? AppLocalizations.of(
                                    context,
                                  )!.disableQueryLogging
                                : AppLocalizations.of(
                                    context,
                                  )!.enableQueryLogging,
                            message: AppLocalizations.of(
                              context,
                            )!.queryLoggingSwitchWarning,
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
                    message: AppLocalizations.of(
                      context,
                    )!.flushNetworkTableWarning,
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
              SectionLabel(label: AppLocalizations.of(context)!.system),
              CustomListTile(
                leadingIcon: Icons.devices_rounded,
                label: AppLocalizations.of(context)!.sessions,
                description: AppLocalizations.of(context)!.sessionsDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SessionsScreen(),
                  ),
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.settings_ethernet_rounded,
                label: AppLocalizations.of(context)!.dhcp,
                description: AppLocalizations.of(context)!.dhcpDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DhcpScreen()),
                ),
              ),
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
              CustomListTile(
                leadingIcon: Icons.lan_rounded,
                label: AppLocalizations.of(context)!.network,
                description: AppLocalizations.of(context)!.networkDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NetworkScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
