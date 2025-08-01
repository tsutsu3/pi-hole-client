import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group(
    'Settings Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show V6 server settings screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2560, 1600);
          tester.view.devicePixelRatio = 1.6;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          await tester.pump();

          expect(find.text('Connecting Server'), findsOneWidget);
          expect(find.text('test v6'), findsOneWidget);
          expect(find.text('http://localhost:8081'), findsOneWidget);

          expect(find.text('Host'), findsNWidgets(2));
          expect(find.text('raspberrypi'), findsOneWidget);
          expect(find.text('Model'), findsOneWidget);
          expect(find.text('Raspberry Pi Model 4B'), findsOneWidget);

          await tester.tap(find.text('More Details').first);
          await tester.pumpAndSettle();

          expect(find.text('System'), findsOneWidget);
          expect(find.text('Linux'), findsOneWidget);
          expect(find.text('Architecture'), findsOneWidget);
          expect(find.text('x86_64'), findsOneWidget);
          expect(find.text('Release'), findsOneWidget);
          expect(find.text('5.15.0-52-generic'), findsOneWidget);
          expect(find.text('Version'), findsOneWidget);
          expect(
            find.text('#58-Ubuntu SMP Thu Oct 13 08:03:55 UTC 2022'),
            findsOneWidget,
          );

          expect(find.text('Performance'), findsOneWidget);
          expect(find.text('CPU Usage'), findsOneWidget);
          expect(find.text('5.29%'), findsOneWidget);
          expect(find.text('Memory Usage'), findsOneWidget);
          expect(find.text('26.85%'), findsOneWidget);

          await tester.tap(find.text('More Details').last);
          await tester.pumpAndSettle();

          expect(find.text('Uptime'), findsOneWidget);
          expect(find.text('0 d 18 h 51 m'), findsOneWidget);
          expect(find.text('CPU Temperature'), findsOneWidget);
          expect(find.text('48.00 ℃'), findsOneWidget);

          expect(find.text('Pi-hole Versions'), findsOneWidget);
          expect(find.text('Core'), findsOneWidget);
          expect(find.text('v6.0.5'), findsOneWidget);
          expect(find.text('FTL'), findsOneWidget);
          expect(find.text('v6.0.4'), findsOneWidget);
          expect(find.text('Web'), findsOneWidget);
          expect(find.text('v6.0.2'), findsOneWidget);
          expect(find.text('Docker'), findsOneWidget);
          expect(find.text('-'), findsOneWidget);
          expect(find.text('master'), findsNWidgets(3));
        },
      );

      testWidgets(
        'should show empty data screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockServersProvider.selectedServer).thenReturn(null);
          when(testSetup.mockServersProvider.selectedApiGateway)
              .thenReturn(null);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          await tester.pump();

          expect(find.byIcon(Icons.inbox_rounded), findsOneWidget);
          expect(find.text('No data'), findsOneWidget);
          expect(
            find.text('Select a server and then access again.'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show error message screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockApiGatewayV6.fetchAllServerInfo())
              .thenAnswer((_) => Future.error(Exception('error')));

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          await tester.pump();

          expect(find.byIcon(Icons.error), findsOneWidget);
          expect(find.text('ERROR'), findsOneWidget);
          expect(find.text('Failed to fetch data.'), findsOneWidget);
        },
      );

      testWidgets(
        'should show skelton when Future is not complete',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          final completer = Completer<PiHoleServerInfoResponse>();
          when(testSetup.mockApiGatewayV6.fetchAllServerInfo())
              .thenAnswer((_) => completer.future);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          expect(find.text('raspberrypi'), findsNothing);
        },
      );

      testWidgets(
        'should show error when fetch fails',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockApiGatewayV6.fetchAllServerInfo()).thenAnswer(
            (_) async => PiHoleServerInfoResponse(
              result: APiResponseType.error,
            ),
          );

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          await tester.pump();

          expect(find.byIcon(Icons.error), findsOneWidget);
          expect(find.text('ERROR'), findsOneWidget);
          expect(find.text('Failed to fetch data.'), findsOneWidget);
        },
      );
    },
  );

  group(
    'Settings Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock();
      });

      testWidgets(
        'should show V5 server settings screen',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const ServerInfoScreen(),
            ),
          );

          expect(find.byType(ServerInfoScreen), findsOneWidget);
          await tester.pump();

          expect(find.text('Connecting Server'), findsOneWidget);
          expect(find.text('test v5'), findsOneWidget);
          expect(find.text('http://localhost:8080'), findsOneWidget);

          expect(find.text('Pi-hole Versions'), findsOneWidget);
          expect(find.text('Core'), findsOneWidget);
          expect(find.text('v5.18.3'), findsOneWidget);
          expect(find.text('FTL'), findsOneWidget);
          expect(find.text('v5.25.2'), findsOneWidget);
          expect(find.text('Web'), findsOneWidget);
          expect(find.text('v5.21'), findsOneWidget);
          expect(find.text('Docker'), findsOneWidget);
          expect(find.text('-'), findsOneWidget);
          expect(find.text('master'), findsNWidgets(3));
        },
      );
    },
  );
}
