import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/dhcp.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/dhcp_screen/dhcp_detail_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/dhcp_screen/dhcp_list_view.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/error_message.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeDhcpInfo = DhcpInfo(
  expires: DateTime(2025, 6, 28, 10),
  name: 'raspberrypi',
  hwaddr: '00:00:00:00:00:00',
  ip: '192.168.2.111',
  clientid: '00:00:00:00:00:00',
);
final _fakeDhcpsInfo = DhcpsInfo(leases: List.filled(5, _fakeDhcpInfo));

/// A screen that displays dhpc dhcps from the selected `ApiGateway`.
///
/// Loads dhcp and client IP info, shows a dhcp list, and supports
/// viewing and deleting dhcps. Handles loading, error, and empty states.
class DhcpScreen extends StatefulWidget {
  const DhcpScreen({super.key});

  @override
  State<DhcpScreen> createState() => _DhcpState();
}

class _DhcpState extends State<DhcpScreen> {
  late AppConfigProvider appConfigProvider;
  DhcpInfo? selectedDhcp;
  DhcpsInfo? dhcpsInfo;
  ApiGateway? apiGateway;
  ApiGateway? previousApiGateway;
  bool isLoading = true;
  bool isFetchError = false;
  String? currentClientIp;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentApiGateway =
        context.watch<ServersProvider>().selectedApiGateway;
    appConfigProvider = context.watch<AppConfigProvider>();

    // Check if the selected API gateway has changed
    if (currentApiGateway != previousApiGateway) {
      previousApiGateway = currentApiGateway;
      apiGateway = currentApiGateway;

      if (apiGateway != null) {
        _loadDhcps();
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
  }

  @override
  Widget build(BuildContext context) {
    if (apiGateway == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.dhcp),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    Future<void> removeDevice(DhcpInfo dhcp) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.deleteDhcp(dhcp.ip);
      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        await Navigator.maybePop(context);
        await _loadDhcps();

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.dhcpRemoved,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingDevice,
        );
      }
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.dhcp),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _loadDhcps,
                tooltip: AppLocalizations.of(context)!.refresh,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              if (isLoading) {
                return Skeletonizer(
                  effect: ShimmerEffect(
                    baseColor: Theme.of(context).colorScheme.secondaryContainer,
                    highlightColor: Theme.of(context).colorScheme.surface,
                  ),
                  child: DhcpListView(
                    dhcpsInfo: _fakeDhcpsInfo,
                    currentClientIp: currentClientIp ?? '',
                    onDeviceTap: (dhcp) {},
                  ),
                );
              }

              if (isFetchError) {
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              if (dhcpsInfo == null || dhcpsInfo!.leases.isEmpty) {
                return const EmptyDataScreen();
              }

              return DhcpListView(
                dhcpsInfo: dhcpsInfo!,
                currentClientIp: currentClientIp ?? '',
                onDeviceTap: (dhcp) {
                  setState(() {
                    selectedDhcp = dhcp;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DhcpDetailScreen(
                        dhcp: dhcp,
                        onDelete: removeDevice,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _loadDhcps() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
      isFetchError = false;
    });

    try {
      final result = await Future.wait<BaseInfoResponse<dynamic>>(
        [apiGateway!.getDhcps(), apiGateway!.getClient()],
      );
      if (!mounted) return;

      setState(() {
        if (result[0].result == APiResponseType.success &&
            result[1].result == APiResponseType.success) {
          dhcpsInfo = result[0].data;
          currentClientIp = result[1].data?.addr;
        } else {
          isFetchError = true;
          logger.e('Failed to load dhpc dhcps or client info');
        }
      });
    } catch (e) {
      logger.e('Failed to load dhpc dhcps or client info', error: e);

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
