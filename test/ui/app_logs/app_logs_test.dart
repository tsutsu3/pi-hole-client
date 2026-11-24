import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/local/app_log_repository.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/domain/model/app/app_log_type.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/view_models/app_logs_viewmodel.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_details_screen.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_logs_screen.dart';
import 'package:provider/provider.dart';

import '../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('App Log Screen Widget Tests', () {
    late LocalAppLogRepository appLogRepository;

    setUp(() {
      appLogRepository = LocalAppLogRepository(
        now: () => DateTime(2025, 01, 22, 10, 50, 31),
      );
    });

    Widget buildScreen() {
      final router = GoRouter(
        initialLocation: '/app-logs',
        routes: [
          GoRoute(
            path: '/app-logs',
            name: Routes.settingsAppAdvancedAppLogs,
            builder: (_, _) => ChangeNotifierProvider(
              create: (_) => AppLogsViewModel(repository: appLogRepository),
              child: const AppLogsScreen(),
            ),
            routes: [
              GoRoute(
                path: 'details',
                name: Routes.settingsAppAdvancedAppLogsDetails,
                builder: (_, state) =>
                    AppLogDetailsScreen(log: state.extra! as AppLog),
              ),
            ],
          ),
        ],
      );

      return buildTestApp(
        const SizedBox.shrink(),
        appLogRepository: appLogRepository,
        router: router,
      );
    }

    testWidgets('should show AppLogsScreen screen with one log', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      // mock copy to clipboard
      final log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (
            MethodCall methodCall,
          ) async {
            if (methodCall.method == 'Clipboard.setData') {
              log.add(methodCall);
            }
            return null;
          });

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null);
      });

      appLogRepository.add(
        type: AppLogType.connection,
        message: 'message',
        statusCode: 200,
      );

      await tester.pumpWidget(buildScreen());

      expect(find.byType(AppLogsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Logs'), findsOneWidget);
      expect(find.byIcon(Icons.share), findsOneWidget);

      expect(find.text('connection'), findsOneWidget);
      expect(find.text('message'), findsOneWidget);
      expect(find.text('2025-01-22 10:50:31.000'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.share));
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Logs copied to clipboard'), findsOneWidget);
      expect(log.length, 1);
      expect(log.first.method, 'Clipboard.setData');

      await tester.tap(find.text('connection'));
      await tester.pumpAndSettle();
      expect(find.byType(AppLogDetailsScreen), findsOneWidget);
      expect(find.text('Log details'), findsOneWidget);
    });

    testWidgets('should show blank screen (no app logs)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // No logs added - logs list is empty by default

      await tester.pumpWidget(buildScreen());

      expect(find.byType(AppLogsScreen), findsOneWidget);
      await tester.pump();

      expect(find.text('Logs'), findsOneWidget);

      // check log message
      expect(find.text('connection'), findsNothing);

      // can't tap on share icon because there are no logs
      await tester.tap(find.byIcon(Icons.share));
      await tester.pumpAndSettle();
      expect(find.text('Logs copied to clipboard'), findsNothing);
    });
  });
}
