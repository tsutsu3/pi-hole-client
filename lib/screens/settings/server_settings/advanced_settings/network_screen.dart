import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/devices.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen/network_detail_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen/network_list_view.dart';
import 'package:pi_hole_client/widgets/error_message.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeDeviceInfo = DeviceInfo(
  id: 0,
  hwaddr: '00:11:22:33:44:55',
  interface: 'eth0',
  firstSeen: DateTime(2025, 6, 28, 10),
  lastQuery: DateTime(2025, 6, 28, 12),
  numQueries: 100,
  ips: [
    DeviceAddress(
      ip: '192.168.1.100',
      lastSeen: DateTime(2025, 6, 28, 12),
      nameUpdated: DateTime(2025, 6, 28, 11),
      name: 'Device1',
    ),
  ],
  macVendor: 'ExampleVendor',
);
final _fakeDevicesInfo = DevicesInfo(devices: List.filled(5, _fakeDeviceInfo));

/// A screen that displays network devices from the selected `ApiGateway`.
///
/// Loads device and client IP info, shows a device list, and supports
/// viewing and deleting devices. Handles loading, error, and empty states.
class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkState();
}

class _NetworkState extends State<NetworkScreen> {
  late AppConfigProvider appConfigProvider;
  DeviceInfo? selectedDevice;
  DevicesInfo? devicesInfo;
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
        _loadDevice();
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
          title: Text(AppLocalizations.of(context)!.network),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    Future<void> removeDevice(DeviceInfo device) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.deleteDevice(device.id);
      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        await Navigator.maybePop(context);
        await _loadDevice();

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.deviceRemoved,
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
          title: Text(AppLocalizations.of(context)!.network),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _loadDevice,
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
                  child: NetworkListView(
                    devicesInfo: _fakeDevicesInfo,
                    currentClientIp: currentClientIp ?? '',
                    onDeviceTap: (session) {},
                  ),
                );
              }

              if (isFetchError) {
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              if (devicesInfo == null || devicesInfo!.devices.isEmpty) {
                return const EmptyDataScreen();
              }

              return NetworkListView(
                devicesInfo: devicesInfo!,
                currentClientIp: currentClientIp ?? '',
                onDeviceTap: (device) {
                  setState(() {
                    selectedDevice = device;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NetworkDetailScreen(
                        device: device,
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

  Future<void> _loadDevice() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
      isFetchError = false;
    });

    try {
      final result = await Future.wait<BaseInfoResponse<dynamic>>(
        [apiGateway!.getDevices(), apiGateway!.getClient()],
      );
      if (!mounted) return;

      setState(() {
        if (result[0].result == APiResponseType.success &&
            result[1].result == APiResponseType.success) {
          devicesInfo = result[0].data;
          currentClientIp = result[1].data?.addr;
        } else {
          isFetchError = true;
          logger.e('Failed to load network devices or client info');
        }
      });
    } catch (e) {
      logger.e('Failed to load network devices or client info', error: e);

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
