import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/routing/routes.dart';
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
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdvancedServerOptions extends StatefulWidget {
  const AdvancedServerOptions({super.key});

  @override
  State<AdvancedServerOptions> createState() => _AdvancedServerOptionsState();
}

class _AdvancedServerOptionsState extends State<AdvancedServerOptions> {
  RepositoryBundle? _bundle;
  RepositoryBundle? _previousBundle;
  bool? isLoggingEnabled;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentBundle = context.watch<RepositoryBundle?>();

    if (currentBundle != _previousBundle) {
      _previousBundle = currentBundle;
      _bundle = currentBundle;

      if (_bundle != null) {
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
    if (!mounted || _bundle == null) return;

    setState(() {
      isLoading = true;
      isLoggingEnabled = null;
    });

    final result = await _bundle!.config.fetchDnsQueryLogging();
    if (!mounted) return;

    setState(() {
      result.fold(
        (config) {
          isLoggingEnabled = config.dns?.queryLogging;
        },
        (_) {
          isLoggingEnabled = null;
          logger.i('Failed to fetch query logging status');
        },
      );
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.watch<AppConfigProvider>();
    final serversProvider = context.watch<ServersProvider>();
    final bundle = context.watch<RepositoryBundle?>();
    final theme = Theme.of(context).extension<AppColors>()!;

    if (bundle == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.advancedSetup),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (serversProvider.selectedServer?.apiVersion == 'v5') {
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

      final result = await bundle.config.setDnsQueryLogging(
        isLoggingEnabled != true,
      );
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      result.fold(
        (config) {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: isCurrentlyEnabled == true
                ? AppLocalizations.of(context)!.disableQueryLogSuccess
                : AppLocalizations.of(context)!.enableQueryLogSuccess,
          );

          setState(() {
            isLoggingEnabled = config.dns?.queryLogging;
          });
        },
        (_) {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: isLoggingEnabled == true
                ? AppLocalizations.of(context)!.disableQueryLogFailure
                : AppLocalizations.of(context)!.enableQueryLogFailure,
          );
        },
      );
    }

    Future<void> onRestartDns() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.restartingDnsResolver);

      final result = await bundle.actions.restartDns();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      result.fold(
        (_) {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.dnsRestartSuccess,
          );
        },
        (_) {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.dnsRestartFailure,
          );
        },
      );
    }

    Future<void> onFlushArp() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.flushingNetworkTable);

      final result = await bundle.actions.flushArp();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      result.fold(
        (_) {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.flushedNetworkTableSuccess,
          );
        },
        (_) {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.flushedNetworkTableFailure,
          );
        },
      );
    }

    Future<void> onFlushLogs() async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.flushingLogs);

      final result = await bundle.actions.flushLogs();
      if (!context.mounted) return;

      process.close();

      await Navigator.maybePop(context);
      if (!context.mounted) return;

      result.fold(
        (_) {
          showSuccessSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.flushLogsSuccess,
          );
        },
        (_) {
          showErrorSnackBar(
            context: context,
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.flushLogsFailure,
          );
        },
      );
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
                onTap: () => context.pushNamed(
                  Routes.settingsServerAdvancedSessions,
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.settings_ethernet_rounded,
                label: AppLocalizations.of(context)!.dhcp,
                description: AppLocalizations.of(context)!.dhcpDescription,
                onTap: () => context.pushNamed(
                  Routes.settingsServerAdvancedDhcp,
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.dns_rounded,
                label: AppLocalizations.of(context)!.localDns,
                description: AppLocalizations.of(context)!.localDnsDescription,
                onTap: () => context.pushNamed(
                  Routes.settingsServerAdvancedLocalDns,
                ),
              ),
              SectionLabel(label: AppLocalizations.of(context)!.tools),
              CustomListTile(
                leadingIcon: Icons.manage_search_rounded,
                label: AppLocalizations.of(context)!.findDomainsInLists,
                description: AppLocalizations.of(
                  context,
                )!.findDomainsInListsDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FindDomainsInListsScreen(),
                  ),
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.wifi_rounded,
                label: AppLocalizations.of(context)!.interface,
                description: AppLocalizations.of(context)!.interfaceDescription,
                onTap: () => context.pushNamed(
                  Routes.settingsServerAdvancedInterface,
                ),
              ),
              CustomListTile(
                leadingIcon: Icons.lan_rounded,
                label: AppLocalizations.of(context)!.network,
                description: AppLocalizations.of(context)!.networkDescription,
                onTap: () => context.pushNamed(
                  Routes.settingsServerAdvancedNetwork,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
