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

    testWidgets('shows error for invalid IP', (WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) {},
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      await tester.enterText(
        find.widgetWithText(TextField, 'IP Address'),
        'not-an-ip',
      );
      await tester.pump();

      expect(find.textContaining('Invalid IP Address'), findsOneWidget);
    });

    testWidgets('Add button submits with valid data', (
      WidgetTester tester,
    ) async {
      Map<String, dynamic>? submitted;

      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (data) => submitted = data,
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      await tester.enterText(
        find.widgetWithText(TextField, 'Hostname'),
        'myhost.local',
      );
      await tester.pump();
      await tester.enterText(
        find.widgetWithText(TextField, 'IP Address'),
        '192.168.1.50',
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, 'Add'));
      await tester.pump();

      expect(submitted, isNotNull);
      expect(submitted!['name'], 'myhost.local');
      expect(submitted!['ip'], '192.168.1.50');
    });

    testWidgets('Cancel button closes without submitting', (
      WidgetTester tester,
    ) async {
      var submitted = false;

      await tester.pumpWidget(
        buildTestApp(
          AddLocalDnsModal(
            addLocalDns: (_) => submitted = true,
            window: false,
            devices: _testDevices,
          ),
        ),
      );

      await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
      await tester.pump();

      expect(submitted, isFalse);
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

    testWidgets('confirms delete and calls onDelete', (
      WidgetTester tester,
    ) async {
      var deleted = false;

      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async {
              deleted = true;
              return true;
            },
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(deleted, isTrue);
    });

    testWidgets('opens edit hostname modal when hostname tile is tapped', (
      WidgetTester tester,
    ) async {
      // Use small screen so modalBottomSheet is shown (width < 700)
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
            devices: _testDevices,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap the Hostname ListTile to open edit modal
      await tester.tap(find.text('Hostname'));
      await tester.pumpAndSettle();

      expect(find.byType(EditLocalDnsModal), findsOneWidget);
    });

    testWidgets('updates DNS entry after editing hostname', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      var updated = false;

      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => true,
            onUpdate: (_, _) async {
              updated = true;
              return true;
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Hostname'));
      await tester.pumpAndSettle();

      await tester.enterText(
        find.widgetWithText(TextField, 'Hostname'),
        'new.hostname',
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, 'Edit'));
      await tester.pumpAndSettle();

      expect(updated, isTrue);
    });

    testWidgets('opens edit IP modal when IP tile is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => true,
            onUpdate: (_, _) async => true,
            devices: _testDevices,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('IP Address'));
      await tester.pumpAndSettle();

      expect(find.byType(EditLocalDnsModal), findsOneWidget);
    });

    testWidgets('delete failure does not navigate away', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        buildTestApp(
          LocalDnsDetailScreen(
            localDns: _testDns,
            onDelete: (_) async => false,
            onUpdate: (_, _) async => true,
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.text('pi.hole'), findsOneWidget);
    });
  });
}
