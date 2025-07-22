import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/services/api/shared/models/config.dart';
import 'package:pi_hole_client/data/services/api/shared/models/gateways.dart';
import 'package:pi_hole_client/data/services/api/v6/models/config/config.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_server_options.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Advanced Server Settings Screen tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets(
      'should show sessions screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Sessions'));
        await tester.pumpAndSettle();
        expect(find.byType(SessionsScreen), findsOneWidget);

        expect(find.text('192.168.0.30'), findsOneWidget);
        expect(find.text('192.168.0.31'), findsOneWidget);
        expect(find.text('192.168.0.32'), findsOneWidget);
      },
    );

    testWidgets(
      'should show dhcp screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('DHCP'));
        await tester.pumpAndSettle();
        expect(find.byType(DhcpScreen), findsOneWidget);

        expect(find.text('192.168.1.51'), findsOneWidget);
      },
    );

    testWidgets(
      'should show interface screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Interface'));
        await tester.pumpAndSettle();
        expect(find.byType(InterfaceScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should show network screen with tap',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Network'));
        await tester.pumpAndSettle();
        expect(find.byType(NetworkScreen), findsOneWidget);
      },
    );

    testWidgets(
      'should success Disable query logging',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Disable query logging'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Disable'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Query logging has been disabled'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Enable query logging',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6
              .getConfiguration(element: anyNamed('element')),
        ).thenAnswer(
          (_) async => ConfigurationResponse(
            result: APiResponseType.success,
            data: ConfigInfo.fromV6(
              Config.fromJson({
                'config': {
                  'dns': {'queryLogging': false},
                },
                'took': 0.003,
              }),
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Enable query logging'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Enable'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Query logging has been enabled'), findsOneWidget);
      },
    );

    testWidgets(
      'should show failback information',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6
              .getConfiguration(element: anyNamed('element')),
        ).thenAnswer(
          (_) async => ConfigurationResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        expect(find.text('Please try again later.'), findsOneWidget);
      },
    );

    testWidgets(
      'should failed to Disable query logging',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6.patchDnsQueryLoggingConfig(any),
        ).thenAnswer(
          (_) async => ConfigurationResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Disable query logging'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Disable'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to disable query logging'), findsOneWidget);
      },
    );

    testWidgets(
      'should failed to Enable query logging',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6.patchDnsQueryLoggingConfig(any),
        ).thenAnswer(
          (_) async => ConfigurationResponse(
            result: APiResponseType.error,
          ),
        );

        when(
          testSetup.mockApiGatewayV6
              .getConfiguration(element: anyNamed('element')),
        ).thenAnswer(
          (_) async => ConfigurationResponse(
            result: APiResponseType.success,
            data: ConfigInfo.fromV6(
              Config.fromJson({
                'config': {
                  'dns': {'queryLogging': false},
                },
                'took': 0.003,
              }),
            ),
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Enable query logging'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Enable'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to enable query logging'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Restart DNS resolver',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Restart DNS resolver'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Restart'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('DNS server restarted.'), findsOneWidget);
      },
    );

    testWidgets(
      'should failed to Restart DNS resolver',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6.restartDns(),
        ).thenAnswer(
          (_) async => ActionResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Restart DNS resolver'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Restart'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to restart DNS server.'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Flush network table',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Flush network table'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Flush'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Network table cleared.'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Flush network table',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6.flushArp(),
        ).thenAnswer(
          (_) async => ActionResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Flush network table'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Flush'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to clear network table.'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Flush logs',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Flush logs (last 24 hours)'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Flush'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Logs flushed successfully.'), findsOneWidget);
      },
    );

    testWidgets(
      'should success Flush logs',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        when(
          testSetup.mockApiGatewayV6.flushLogs(),
        ).thenAnswer(
          (_) async => ActionResponse(
            result: APiResponseType.error,
          ),
        );

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          testSetup.buildTestWidget(
            const AdvancedServerOptions(),
          ),
        );

        expect(find.byType(AdvancedServerOptions), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Flush logs (last 24 hours)'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Flush'));
        await tester.pumpAndSettle();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed to flush logs.'), findsOneWidget);
      },
    );
  });
}
