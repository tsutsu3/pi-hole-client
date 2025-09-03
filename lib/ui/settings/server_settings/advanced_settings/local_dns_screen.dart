import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/add_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_list_view.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
const _fakeLocalDnsInfo = [
  LocalDns(ip: '192.168.2.111', name: 'raspberrypi'),
  LocalDns(ip: '192.168.2.112', name: 'printer'),
  LocalDns(ip: '192.168.2.113', name: 'laptop'),
];

class LocalDnsScreen extends StatefulWidget {
  const LocalDnsScreen({super.key});

  @override
  State<LocalDnsScreen> createState() => _LocalDnsScreenState();
}

class _LocalDnsScreenState extends State<LocalDnsScreen> {
  late AppConfigProvider appConfigProvider;
  ServersProvider? _lastServersProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();

    final servers = context.watch<ServersProvider>();
    if (!identical(_lastServersProvider, servers)) {
      _lastServersProvider = servers;
      final store = context.read<LocalDnsProvider>();
      store.update(servers);

      Future.microtask(store.load);
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final servers = context.watch<ServersProvider>();
    final store = context.watch<LocalDnsProvider>();

    if (servers.selectedApiGateway == null) {
      return Scaffold(
        appBar: AppBar(title: Text(locale.localDns)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    Future<bool> onAddLocalDns(Map<String, dynamic> value) async {
      final process = ProcessModal(context: context)
        ..open(locale.addingLocalDns);
      final ok = await context.read<LocalDnsProvider>().addLocalDns(
        LocalDns(ip: value['ip'], name: value['name']),
      );
      process.close();
      if (!context.mounted) return false;
      if (ok) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsAdded,
        );
        return true;
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.cannotAddLocalDns,
        );
        return false;
      }
    }

    Future<bool> onUpdateLocalDns(LocalDns updated, String oldIp) async {
      final process = ProcessModal(context: context)
        ..open(locale.updatingAdlist);
      final ok = await context.read<LocalDnsProvider>().updateLoadDns(
        oldIp: oldIp,
        item: updated,
      );
      process.close();
      if (!context.mounted) return ok;
      if (ok) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsUpdated,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsUpdateFailed,
        );
      }
      return ok;
    }

    Future<bool> onRemoveLocalDns(LocalDns item) async {
      final process = ProcessModal(context: context)..open(locale.deleting);
      final ok = await context.read<LocalDnsProvider>().removeLocalDns(item);
      process.close();
      if (!context.mounted) return ok;
      if (ok) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsRemoved,
        );
        await Navigator.maybePop(context);
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsRemoveError,
        );
      }
      return ok;
    }

    void openAddModal() {
      final mediaQuery = MediaQuery.of(context);
      final isSmallLandscape =
          mediaQuery.size.width > mediaQuery.size.height &&
          mediaQuery.size.height < ResponsiveConstants.medium;

      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useSafeArea: !isSmallLandscape,
          useRootNavigator: false,
          builder: (ctx) => AddLocalDnsModal(
            addLocalDns: onAddLocalDns,
            window: true,
            devices: store.deviceOptions,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => AddLocalDnsModal(
            addLocalDns: onAddLocalDns,
            window: false,
            devices: store.deviceOptions,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(title: Text(locale.localDns)),
        body: SafeArea(
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  switch (store.loadingStatus) {
                    case LoadStatus.loading:
                      return Skeletonizer(
                        effect: ShimmerEffect(
                          baseColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          highlightColor: Theme.of(context).colorScheme.surface,
                        ),
                        child: LocalDnsListView(
                          localDnsInfo: _fakeLocalDnsInfo,
                          onDeviceTap: (_) {},
                        ),
                      );
                    case LoadStatus.error:
                      return ErrorMessage(message: locale.dataFetchFailed);
                    case LoadStatus.loaded:
                      return LocalDnsListView(
                        localDnsInfo: store.localDns,
                        onDeviceTap: (localDns) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LocalDnsDetailScreen(
                                localDns: localDns,
                                devices: store.deviceOptions,
                                onDelete: (ld) async => onRemoveLocalDns(ld),
                                onUpdate: onUpdateLocalDns,
                              ),
                            ),
                          );
                        },
                      );
                  }
                },
              ),

              Selector<AppConfigProvider, bool>(
                selector: (_, a) => a.showingSnackbar,
                builder: (_, showingSnackbar, _) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    bottom: showingSnackbar ? 70 : 20,
                    right: 20,
                    child: FloatingActionButton(
                      onPressed: openAddModal,
                      child: const Icon(Icons.add),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
