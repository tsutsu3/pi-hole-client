import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/add_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_list_view.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
const _fakeLocalDnsInfo = [
  LocalDns(ip: '192.168.2.111', name: 'raspberrypi'),
  LocalDns(ip: '192.168.2.112', name: 'printer'),
  LocalDns(ip: '192.168.2.113', name: 'laptop'),
];

/// A screen that displays local DNS entries from the selected `ApiGateway`.
///
/// Loads local DNS info, shows a local DNS list, and supports
/// viewing and deleting local DNS entries. Handles loading, error, and empty states.
class LocalDnsScreen extends StatefulWidget {
  const LocalDnsScreen({super.key});

  @override
  State<LocalDnsScreen> createState() => _LocalDnsState();
}

class _LocalDnsState extends State<LocalDnsScreen> {
  late AppConfigProvider appConfigProvider;
  LocalDns? selectedLocalDns;
  List<LocalDns>? localDnsInfo;
  ApiGateway? apiGateway;
  ApiGateway? previousApiGateway;
  bool isLoading = true;
  bool isFetchError = false;
  List<DeviceInfo>? devices;
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentApiGateway = context
        .watch<ServersProvider>()
        .selectedApiGateway;
    appConfigProvider = context.watch<AppConfigProvider>();

    // Check if the selected API gateway has changed
    if (currentApiGateway != previousApiGateway) {
      previousApiGateway = currentApiGateway;
      apiGateway = currentApiGateway;

      if (apiGateway != null) {
        _loadLocalDns();
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    previousApiGateway = null;
    isLoading = false;
    isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    if (apiGateway == null) {
      return Scaffold(
        appBar: AppBar(title: Text(locale.localDns)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    Future<void> removeLocalDns(LocalDns localDns) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.deleteLocalDns(
        ip: localDns.ip,
        name: localDns.name,
      );
      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        await Navigator.maybePop(context);
        await _loadLocalDns();

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsRemoved,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsRemoveError,
        );
      }
    }

    Future<void> onAddLocalDns(Map<String, dynamic> value) async {
      final process = ProcessModal(context: context);
      process.open(locale.addingLocalDns);

      final result = await apiGateway?.addLocalDns(
        ip: value['ip'],
        name: value['name'],
      );

      process.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        // await domainsListProvider.fetchDomainsList();
        if (!context.mounted) return;

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.localDnsAdded,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: locale.cannotAddLocalDns,
        );
      }
    }

    void openModalAddLocalDnsToList() {
      final mediaQuery = MediaQuery.of(context);
      final isSmallLandscape =
          mediaQuery.size.width > mediaQuery.size.height &&
          mediaQuery.size.height < ResponsiveConstants.medium;

      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useSafeArea: !isSmallLandscape,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (ctx) =>
              AddLocalDnsModal(addLocalDns: onAddLocalDns, window: true),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) =>
              AddLocalDnsModal(addLocalDns: onAddLocalDns, window: false),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.localDns),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _loadLocalDns,
                tooltip: locale.refresh,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  if (isLoading) {
                    return Skeletonizer(
                      effect: ShimmerEffect(
                        baseColor: Theme.of(
                          context,
                        ).colorScheme.secondaryContainer,
                        highlightColor: Theme.of(context).colorScheme.surface,
                      ),
                      child: LocalDnsListView(
                        localDnsInfo: _fakeLocalDnsInfo,
                        devices: const [],
                        onDeviceTap: (localDns) {},
                      ),
                    );
                  }

                  if (isFetchError) {
                    return ErrorMessage(message: locale.dataFetchFailed);
                  }

                  return LocalDnsListView(
                    localDnsInfo: localDnsInfo!,
                    devices: devices,
                    onDeviceTap: (localDns) {
                      setState(() {
                        selectedLocalDns = localDns;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocalDnsDetailScreen(
                            localDns: localDns,
                            device: devices?.firstWhereOrNull(
                              (device) => device.ips.any(
                                (addr) => addr.ip == localDns.ip,
                              ),
                            ),
                            onDelete: removeLocalDns,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? appConfigProvider.showingSnackbar
                          ? 70
                          : 20
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openModalAddLocalDnsToList,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadLocalDns() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
      isFetchError = false;
    });

    try {
      final result = await Future.wait<BaseInfoResponse<dynamic>>([
        apiGateway!.getLocalDns(),
        apiGateway!.getDevices(),
      ]);
      if (!mounted) return;

      setState(() {
        if (result[0].result == APiResponseType.success &&
            result[1].result == APiResponseType.success) {
          localDnsInfo = result[0].data;
          devices = result[1].data.devices;
        } else {
          isFetchError = true;
          logger.e('Failed to load local DNS or client info');
        }
      });
    } catch (e) {
      logger.e('Failed to load local DNS or device info', error: e);

      if (mounted) {
        setState(() {
          isFetchError = true;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
