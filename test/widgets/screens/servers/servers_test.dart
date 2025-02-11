import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/screens/servers/delete_modal.dart';
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
      'should set default server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 1.0;

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
        tester.view.physicalSize = const Size(1080, 2400); // timed out
        // tester.view.physicalSize = const Size(2176, 1600); //overflow
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
        // await tester.tap(find.text('Edit')); // TODO
        // await tester.pump();
        // await tester.pumpAndSettle();
        // expect(find.byType(AddServerFullscreen), findsOneWidget);
      },
    );

    testWidgets(
      'should delete server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400); // timed out
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
        expect(find.byType(DeleteModal), findsOneWidget);
        expect(find.text('Remove'), findsWidgets);
        await tester.tap(find.text('Remove').first);
        await tester.pumpAndSettle();
      },
    );
  });
}
