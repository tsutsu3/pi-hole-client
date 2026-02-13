import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/viewmodel/interface_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/net_interface/net_interface_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
const _fakeInterfaceData = NetInterface(
  name: 'eth0',
  type: 'ether',
  flags: ['up', 'broadcast', 'running', 'multicast'],
  state: 'up',
  protoDown: false,
  address: 'e4:5f:01:ca:3f:d1',
  broadcast: 'ff:ff:ff:ff:ff:ff',
  carrier: true,
  stats: InterfaceStats(
    rxBytes: ByteValue(value: 1.25, unit: 'G'),
    txBytes: ByteValue(value: 980.6, unit: 'M'),
    bits: 64,
    rxPackets: 1234567,
    txPackets: 7654321,
    rxErrors: 0,
    txErrors: 0,
    rxDropped: 0,
    txDropped: 1,
    multicast: 3456,
    collisions: 0,
    rxLengthErrors: 0,
    rxOverErrors: 0,
    rxCrcErrors: 0,
    rxFrameErrors: 0,
    rxFifoErrors: 0,
    rxMissedErrors: 0,
    txAbortedErrors: 0,
    txCarrierErrors: 0,
    txFifoErrors: 0,
    txHeartbeatErrors: 0,
    txWindowErrors: 0,
    rxCompressed: 0,
    txCompressed: 0,
    rxNohandler: 0,
  ),
  addresses: [
    InterfaceAddress(
      address: '192.168.11.3',
      addressType: 'private',
      index: 2,
      family: RouteFamilyType.inet,
      scope: 'universe',
      flags: ['permanent'],
      prefixlen: 24,
      prefered: 4294967295,
      valid: 4294967295,
      cstamp: 1745897378.81,
      tstamp: 1745897378.81,
      label: 'eth0',
      local: '192.168.11.3',
      localType: 'private',
      broadcast: '192.168.11.255',
      broadcastType: 'private',
    ),
    InterfaceAddress(
      address: 'fe80::e65f:1ff:feca:3fd1',
      addressType: 'link-local',
      index: 2,
      family: RouteFamilyType.inet6,
      scope: 'link',
      flags: ['permanent'],
      prefixlen: 64,
      prefered: 4294967295,
      valid: 4294967295,
      cstamp: 1745897382.89,
      tstamp: 1745897382.89,
    ),
  ],
  index: 2,
  family: 'unspec',
  speed: 1000,
  permAddress: 'e4:5f:01:ca:3f:d1',
  ifname: 'eth0',
  txqlen: 1000,
  linkmode: 0,
  mtu: 1500,
  minMtu: 68,
  maxMtu: 1500,
  group: 0,
  promiscuity: 0,
  unknown: [61, 58, 63],
  numTxQueues: 5,
  numRxQueues: 5,
  gsoMaxSegs: 65535,
  gsoMaxSize: 65536,
  map: 0,
  carrierChanges: 5,
  carrierUpCount: 3,
  carrierDownCount: 2,
  linkKind: 'ethernet',
  qdisc: 'mq',
  parentDevName: 'fd580000.ethernet',
  parentDevBusName: 'platform',
);

class InterfaceScreen extends StatefulWidget {
  const InterfaceScreen({required this.viewModel, super.key});

  final InterfaceViewModel viewModel;

  @override
  State<InterfaceScreen> createState() => _InterfaceScreenState();
}

class _InterfaceScreenState extends State<InterfaceScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final viewModel = widget.viewModel;
        final isLoading = viewModel.loadInterfaces.isRunning.value;
        final hasError = viewModel.loadInterfaces.errors.value != null;
        final interfaces = viewModel.loadInterfaces.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.interface),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadInterfaces.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadInterfaces.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return _buildSkeletonLoading(context);
                    }

                    if (hasError) {
                      return ErrorMessage(message: locale.dataFetchFailed);
                    }

                    if (interfaces.isEmpty) {
                      return const EmptyDataScreen();
                    }

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            interfaces.map(NetInterfaceSection.new).toList(),
                      ),
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

  Widget _buildSkeletonLoading(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: Theme.of(context).colorScheme.secondaryContainer,
          highlightColor: Theme.of(context).colorScheme.surface,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetInterfaceSection(_fakeInterfaceData),
            NetInterfaceSection(_fakeInterfaceData),
          ],
        ),
      ),
    );
  }
}
