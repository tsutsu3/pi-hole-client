import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/screens/servers/delete_server_modal.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('Servers Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show servers page',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        // show default server
        expect(find.text('test v6'), findsOneWidget);
        expect(find.text('Connected'), findsOneWidget);
      },
    );

    testWidgets(
      'should show blank page',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.getServersList).thenReturn([]);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        expect(find.text('test v6'), findsNothing);
      },
    );

    testWidgets(
      'should connect to server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(testSetup.mockServersProvider.selectedServer).thenReturn(null);
        when(testSetup.mockServersProvider.resetSelectedServer())
            .thenAnswer((_) async => true);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);
        expect(find.text('Connect'), findsOneWidget);
        await tester.tap(find.text('Connect'));
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'should set default server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        await tester.tap(find.byType(PopupMenuButton));
        await tester.pumpAndSettle();

        expect(find.text('Set as default connection'), findsOneWidget);
        when(testSetup.mockServersProvider.setDefaultServer(any))
            .thenAnswer((_) async => true);
        await tester.tap(find.text('Set as default connection'));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text('Connection set as default successfully.'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show edit server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        await tester.tap(find.byType(PopupMenuButton));
        await tester.pumpAndSettle();

        expect(find.text('Edit'), findsOneWidget);
        await tester.tap(find.text('Edit'));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(AddServerFullscreen), findsOneWidget);
      },
    );

    testWidgets(
      'should delete server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        await tester.tap(find.byType(PopupMenuButton));
        await tester.pumpAndSettle();

        expect(find.text('Delete'), findsOneWidget);
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();
        expect(find.byType(DeleteServerModal), findsOneWidget);
        expect(find.text('Delete'), findsWidgets);
        await tester.tap(find.text('Delete').last);
        await tester.pumpAndSettle();
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Connection removed successfully'), findsOneWidget);
      },
    );

    testWidgets(
      'should show add server window',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const ServersPage(),
          ),
        );

        expect(find.byType(ServersPage), findsOneWidget);
        expect(find.text('Servers'), findsOneWidget);

        await tester.tap(find.byType(FloatingActionButton));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(AddServerFullscreen), findsOneWidget);
      },
    );
  });
}
