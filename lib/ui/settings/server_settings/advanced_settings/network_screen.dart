import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/network_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/network_list_view.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/viewmodel/network_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeDevice = Device(
  id: 0,
  hwaddr: '00:11:22:33:44:55',
  interface: 'eth0',
  firstSeen: DateTime(2025, 6, 28, 10),
  lastQuery: DateTime(2025, 6, 28, 12),
  numQueries: 100,
  ips: [
    DeviceIp(
      ip: '192.168.1.100',
      lastSeen: DateTime(2025, 6, 28, 12),
      nameUpdated: DateTime(2025, 6, 28, 11),
      name: 'Device1',
    ),
  ],
  macVendor: 'ExampleVendor',
);
final _fakeDevices = List.filled(5, _fakeDevice);

/// A screen that displays network devices from the selected server.
///
/// Loads device and client IP info, shows a device list, and supports
/// viewing and deleting devices. Handles loading, error, and empty states.
class NetworkScreen extends StatefulWidget {
  const NetworkScreen({required this.viewModel, super.key});

  final NetworkViewModel viewModel;

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  Future<void> _removeDevice(Device device) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context);
    process.open(locale.deleting);

    try {
      await widget.viewModel.deleteDevice.runAsync(device.id);
      if (!mounted) return;
      process.close();
      // TODO: migrate to context.pop() when detail screen uses go_router
      await Navigator.maybePop(context);

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.deviceDeleteSuccess,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.deviceDeleteFailed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final viewModel = widget.viewModel;
        final isLoading = viewModel.loadDevices.isRunning.value;
        final hasError = viewModel.loadDevices.errors.value != null;
        final networkData = viewModel.loadDevices.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.network),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadDevices.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadDevices.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return Skeletonizer(
                        effect: ShimmerEffect(
                          baseColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          highlightColor:
                              Theme.of(context).colorScheme.surface,
                        ),
                        child: NetworkListView(
                          devices: _fakeDevices,
                          currentClientIp: '',
                          onDeviceTap: (device) {},
                        ),
                      );
                    }

                    if (hasError) {
                      return ErrorMessage(message: locale.dataFetchFailed);
                    }

                    if (networkData.devices.isEmpty) {
                      return const EmptyDataScreen();
                    }

                    return NetworkListView(
                      devices: networkData.devices,
                      currentClientIp: networkData.currentClientIp,
                      onDeviceTap: (device) {
                        // TODO: migrate to go_router named route
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NetworkDetailScreen(
                              device: device,
                              onDelete: _removeDevice,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
