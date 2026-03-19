import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface/widgets/more_detail_screen.dart';

import '../../../../../../../testing/test_app.dart';

InterfaceStats _makeStats() => const InterfaceStats(
  rxBytes: ByteValue(value: 1024, unit: 'M'),
  txBytes: ByteValue(value: 512, unit: 'M'),
  bits: 64,
  rxPackets: 1000,
  txPackets: 900,
  rxErrors: 0,
  txErrors: 0,
  rxDropped: 0,
  txDropped: 0,
  multicast: 0,
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
);

NetInterface _makeInterface({
  bool carrier = true,
  int promiscuity = 0,
  int carrierChanges = 3,
  String state = 'up',
  String broadcast = 'ff:ff:ff:ff:ff:ff',
  int mtu = 1500,
  int minMtu = 68,
  int maxMtu = 9000,
  int txqlen = 1000,
  String? qdisc = 'mq',
  String? parentDevName,
  String? parentDevBusName,
}) => NetInterface(
  name: 'eth0',
  type: 'ether',
  flags: const ['up', 'broadcast'],
  state: state,
  protoDown: false,
  address: 'aa:bb:cc:dd:ee:ff',
  broadcast: broadcast,
  carrier: carrier,
  stats: _makeStats(),
  addresses: const [],
  carrierChanges: carrierChanges,
  promiscuity: promiscuity,
  mtu: mtu,
  minMtu: minMtu,
  maxMtu: maxMtu,
  txqlen: txqlen,
  qdisc: qdisc,
  parentDevName: parentDevName,
  parentDevBusName: parentDevBusName,
);

void main() async {
  await initTestApp();

  group('MoreDetailsScreen', () {
    testWidgets('renders app bar title', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(MoreDetailsScreen(interfaceData: _makeInterface())),
      );
      expect(find.text('More Details'), findsOneWidget);
    });

    testWidgets('shows Connected when carrier is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(carrier: true)),
        ),
      );
      expect(find.text('Connected'), findsOneWidget);
    });

    testWidgets('shows Disconnected when carrier is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(carrier: false)),
        ),
      );
      expect(find.text('Disconnected'), findsOneWidget);
    });

    testWidgets('shows carrier changes count', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(
            interfaceData: _makeInterface(carrierChanges: 7),
          ),
        ),
      );
      expect(find.text('7'), findsOneWidget);
    });

    testWidgets('shows state in uppercase', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(state: 'up')),
        ),
      );
      expect(find.text('UP'), findsOneWidget);
    });

    testWidgets('shows Disabled when promiscuity is 0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(promiscuity: 0)),
        ),
      );
      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('shows Enabled when promiscuity is non-zero', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(promiscuity: 1)),
        ),
      );
      expect(find.text('Enabled'), findsOneWidget);
    });

    testWidgets('shows MTU with min and max', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(
            interfaceData: _makeInterface(mtu: 1500, minMtu: 68, maxMtu: 9000),
          ),
        ),
      );
      expect(find.textContaining('1500'), findsOneWidget);
      expect(find.textContaining('68'), findsOneWidget);
      expect(find.textContaining('9000'), findsOneWidget);
    });

    testWidgets('shows broadcast address', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(
            interfaceData: _makeInterface(broadcast: 'ff:ff:ff:ff:ff:ff'),
          ),
        ),
      );
      // Item may be off-screen in ListView
      expect(find.text('ff:ff:ff:ff:ff:ff', skipOffstage: false), findsOneWidget);
    });

    testWidgets('shows qdisc value', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(qdisc: 'fq_codel')),
        ),
      );
      expect(find.text('fq_codel', skipOffstage: false), findsOneWidget);
    });

    testWidgets('shows Unknown when qdisc is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(interfaceData: _makeInterface(qdisc: null)),
        ),
      );
      expect(find.text('Unknown', skipOffstage: false), findsOneWidget);
    });

    testWidgets('shows N/A when parentDevName is null', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(
            interfaceData: _makeInterface(
              parentDevName: null,
              parentDevBusName: null,
            ),
          ),
        ),
      );
      expect(find.text('N/A'), findsOneWidget);
    });

    testWidgets('shows parentDevName and parentDevBusName when set', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          MoreDetailsScreen(
            interfaceData: _makeInterface(
              parentDevName: 'eth1',
              parentDevBusName: 'pci@0000:00:1f.6',
            ),
          ),
        ),
      );
      expect(find.textContaining('eth1'), findsOneWidget);
      expect(find.textContaining('pci@0000:00:1f.6'), findsOneWidget);
    });
  });
}
