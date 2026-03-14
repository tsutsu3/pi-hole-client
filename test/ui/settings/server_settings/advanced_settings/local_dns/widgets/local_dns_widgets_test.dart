import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns/widgets/add_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns/widgets/edit_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns/widgets/local_dns_detail_screen.dart';

import '../../../../../../../testing/test_app.dart';

const _testDns = LocalDns(ip: '192.168.1.100', name: 'pi.hole');

final _testDevices = [
  const DeviceOption(
    ip: '192.168.1.1',
    hwaddr: 'AA:BB:CC:DD:EE:01',
    macVendor: 'Vendor A',
  ),
  const DeviceOption(
    ip: '192.168.1.100',
    hwaddr: 'AA:BB:CC:DD:EE:FF',
    macVendor: 'Raspberry Pi Foundation',
  ),
];

void main() async {
  await initTestApp();

  group('AddLocalDnsModal', () {
    testWidgets('renders as bottom sheet when window=false', (
      WidgetTester tester,
    ) async {
      var called = false;
      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) => called = true,
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      expect(find.text('Add Local DNS'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Add'), findsOneWidget);
      expect(called, false);
    });

    testWidgets('renders as dialog when window=true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) {},
            window: true,
            devices: _testDevices,
          ),
        ),
      );

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text('Add Local DNS'), findsOneWidget);
    });

    testWidgets('Add button is disabled initially', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) {},
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      // Add button should be disabled when no data is entered
      final addButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Add'),
      );
      expect(addButton.onPressed, isNull);
    });

    testWidgets('shows error for invalid hostname', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) {},
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      // Enter invalid hostname with special chars
      await tester.enterText(
        find.widgetWithText(TextField, 'Hostname'),
        'invalid hostname!',
      );
      await tester.pump();

      expect(find.textContaining('Invalid hostname'), findsOneWidget);
    });
  });

  group('EditLocalDnsModal (name)', () {
    testWidgets('renders with existing hostname pre-filled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          EditLocalDnsModal(
            localDns: _testDns,
            keyItem: 'name',
            title: 'Edit hostname',
            icon: Icons.computer_rounded,
            onConfirm: (_, _) {},
            window: false,
          ),
        ),
      );

      expect(find.text('Edit hostname'), findsOneWidget);
      expect(find.text('pi.hole'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
    });

    testWidgets('Edit button enabled when hostname changes', (
      WidgetTester tester,
    ) async {
      String? confirmedName;
      await tester.pumpWidget(
        buildTestApp(
          EditLocalDnsModal(
            localDns: _testDns,
            keyItem: 'name',
            title: 'Edit hostname',
            icon: Icons.computer_rounded,
            onConfirm: (dns, _) => confirmedName = dns.name,
            window: false,
          ),
        ),
      );

      await tester.enterText(
        find.widgetWithText(TextField, 'Hostname'),
        'new.hostname',
      );
      await tester.pump();

      final editButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Edit'),
      );
      expect(editButton.onPressed, isNotNull);

      await tester.tap(find.widgetWithText(TextButton, 'Edit'));
      await tester.pump();

      expect(confirmedName, 'new.hostname');
    });

    testWidgets('renders as dialog when window=true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          EditLocalDnsModal(
            localDns: _testDns,
            keyItem: 'name',
            title: 'Edit hostname',
            icon: Icons.computer_rounded,
            onConfirm: (_, _) {},
            window: true,
          ),
        ),
      );

      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('shows error for invalid hostname', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          EditLocalDnsModal(
            localDns: _testDns,
            keyItem: 'name',
            title: 'Edit hostname',
            icon: Icons.computer_rounded,
            onConfirm: (_, _) {},
            window: false,
          ),
        ),
      );

      await tester.enterText(
        find.widgetWithText(TextField, 'Hostname'),
        'invalid hostname!',
      );
      await tester.pump();

      expect(find.textContaining('Invalid hostname'), findsOneWidget);
    });
  });

  group('EditLocalDnsModal (ip)', () {
    testWidgets('renders with existing IP pre-filled', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          EditLocalDnsModal(
            localDns: _testDns,
            keyItem: 'ip',
            title: 'Edit IP',
            icon: Icons.location_on_rounded,
            onConfirm: (_, _) {},
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      expect(find.text('Edit IP'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
    });
  });

  group('LocalDnsDetailScreen', () {
    testWidgets('renders DNS entry details', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            devices: _testDevices,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      expect(find.text('Local DNS'), findsOneWidget);
      expect(find.text('Hostname'), findsOneWidget);
      expect(find.text('pi.hole'), findsOneWidget);
      expect(find.text('IP Address'), findsOneWidget);
      expect(find.text('192.168.1.100'), findsOneWidget);
    });

    testWidgets('shows vendor from device list when IP matches', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            devices: _testDevices,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      expect(find.text('Raspberry Pi Foundation'), findsOneWidget);
      expect(find.text('AA:BB:CC:DD:EE:FF'), findsOneWidget);
    });

    testWidgets('shows unknown when device not in list', (
      WidgetTester tester,
    ) async {
      const dnsWithUnknownDevice = LocalDns(
        ip: '10.0.0.1',
        name: 'unknown.host',
      );

      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: dnsWithUnknownDevice,
            devices: _testDevices,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      expect(find.text('Unknown'), findsAtLeastNWidgets(1));
    });

    testWidgets('shows delete button in app bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
    });

    testWidgets('opens delete dialog on delete button tap', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Delete Local DNS'), findsOneWidget);
    });
  });
}
