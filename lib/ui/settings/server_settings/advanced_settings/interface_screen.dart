import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_interface.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/common.dart';
import 'package:pi_hole_client/data/services/api/model/v6/network/interfaces.dart';
import 'package:pi_hole_client/domain/models_old/gateway.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/net_interface/net_interface_section.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
const fakeInterfaceData = InterfaceData(
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
      family: RouteFamily.inet,
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
      family: RouteFamily.inet6,
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

class InterfaceScreen extends StatelessWidget {
  const InterfaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );

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

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.interface),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: apiGateway.getGateway(isDetailed: true),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildSkeletonLoading(context, apiGateway);
              } else if (snapshot.hasError) {
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              } else if (!snapshot.hasData) {
                return const EmptyDataScreen();
              }

              final gatewayInfo = snapshot.data;

              if (gatewayInfo?.result != APiResponseType.success) {
                logger.e('Gateway Info fetch failed: ${gatewayInfo?.result}');
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              logger.d(
                'Interfaces: ${gatewayInfo?.data?.interfaces?.map((e) => e.name).join(', ')}',
              );

              return _buildgatewayInfoContent(
                apiGateway: apiGateway,
                data: gatewayInfo?.data,
              );
            },
          ),
        ),
      ),
    );
  }

  // Show a skeleton loading screen while fetching data
  Widget _buildSkeletonLoading(
    BuildContext context,
    ApiGateway? apiGateway,
  ) {
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
            NetInterfaceSection(
              fakeInterfaceData,
            ),
            NetInterfaceSection(
              fakeInterfaceData,
            ),
          ],
        ),
      ),
    );
  }

  // Show the server information content. After fetching the data, show the actual content
  Widget _buildgatewayInfoContent({
    required ApiGateway? apiGateway,
    required GatewayInfo? data,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data?.interfaces?.map(NetInterfaceSection.new).toList() ??
            [const EmptyDataScreen()],
      ),
    );
  }
}
