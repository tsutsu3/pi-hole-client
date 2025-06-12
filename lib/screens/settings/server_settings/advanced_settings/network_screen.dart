import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/devices.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/error_message_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/network_screen/network_detail_screen.dart';
import 'package:provider/provider.dart';

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

  Future<void> _loadDevice() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

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
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppColors>()!;

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

    /// Builds the status icon based on the device's last query timestamp.
    /// - Green check: active within 24h
    /// - Yellow warning: active within 24-48h
    /// - Red error: inactive >48h
    /// - Grey unknown: never active (lastQuery == UnixTime(0))
    Widget buildStatusIcon(DateTime lastQuery) {
      IconData iconData;
      Color iconColor;

      if (lastQuery == DateTime.fromMillisecondsSinceEpoch(0)) {
        iconData = Icons.question_mark_rounded;
        iconColor = theme.queryGrey ?? Colors.grey;
      } else {
        final now = DateTime.now();
        final hours = now.difference(lastQuery).inHours;

        if (hours < 24) {
          iconData = Icons.check_rounded;
          iconColor = theme.queryGreen ?? Colors.green;
        } else if (hours < 48) {
          iconData = Icons.access_time_rounded;
          iconColor = theme.queryOrange ?? Colors.orange;
        } else {
          iconData = Icons.hourglass_bottom;
          iconColor = theme.queryRed ?? Colors.red;
        }
      }

      return Icon(iconData, size: 24, color: iconColor);
    }

    Widget buildDeviceTitle(DeviceInfo device) {
      return Text(
        device.ips.isNotEmpty
            ? device.ips.map((ip) {
                final name = ip.name == null ? '' : ' (${ip.name})';
                return '${ip.ip}$name';
              }).join('\n')
            : AppLocalizations.of(context)!.unknown,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (isFetchError) {
                return ErrorMessageScreen(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              if (devicesInfo == null || devicesInfo!.devices.isEmpty) {
                return const EmptyDataScreen();
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 32),
                itemCount: devicesInfo!.devices.length,
                itemBuilder: (context, index) {
                  final device = devicesInfo!.devices[index];
                  return ListTile(
                    leading: buildStatusIcon(device.lastQuery),
                    title: buildDeviceTitle(device),
                    subtitle: Text(
                      device.lastQuery == DateTime.fromMillisecondsSinceEpoch(0)
                          ? AppLocalizations.of(context)!.never
                          : formatTimestamp(
                              device.lastQuery,
                              kUnifiedDateTimeLogFormat,
                            ),
                    ),
                    trailing: device.ips.any((ip) => ip.ip == currentClientIp)
                        ? Chip(
                            avatar: const Icon(Icons.star_rounded),
                            label: Text(AppLocalizations.of(context)!.inUse),
                          )
                        : null,
                    onTap: () {
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
              );
            },
          ),
        ),
      ),
    );
  }
}
