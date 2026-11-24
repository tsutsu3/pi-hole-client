import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_details_screen.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  final fullLog = AppLog(
    type: 'auth',
    dateTime: DateTime(2025, 1, 22, 10, 50, 31),
    message: 'Failed to connect',
    serverAddress: 'http://pi.hole',
    details: '{"error": "unauthorized"}',
    statusCode: '401',
  );
  final minimalLog = AppLog(
    type: 'storage',
    dateTime: DateTime(2025, 1, 22, 10, 50, 31),
    message: 'Failed to save the credentials',
  );

  Future<void> pumpScreen(WidgetTester tester, AppLog log) async {
    await tester.pumpWidget(
      buildTestApp(AppLogDetailsScreen(log: log), useScaffold: false),
    );
  }

  group('AppLogDetailsScreen', () {
    testWidgets('shows all the fields of the log', (tester) async {
      await pumpScreen(tester, fullLog);

      expect(find.text('Log details'), findsOneWidget);
      expect(find.text('Overview'), findsOneWidget);
      expect(find.text('Failed to connect'), findsOneWidget);
      expect(find.text('auth'), findsOneWidget);
      expect(find.byIcon(Icons.lock_rounded), findsOneWidget);
      expect(find.text('2025-01-22 10:50:31'), findsOneWidget);
      expect(find.text('http://pi.hole'), findsOneWidget);
      expect(find.text('401'), findsOneWidget);
      expect(find.text('Details'), findsOneWidget);
      expect(find.text('{"error": "unauthorized"}'), findsOneWidget);
    });

    testWidgets('hides the server, status code and details when null', (
      tester,
    ) async {
      await pumpScreen(tester, minimalLog);

      expect(find.text('Failed to save the credentials'), findsOneWidget);
      expect(find.text('Server address'), findsNothing);
      expect(find.text('Status code'), findsNothing);
      expect(find.text('Details'), findsNothing);
    });

    testWidgets('copies the log as text and shows a snackbar', (tester) async {
      final calls = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (call) async {
            if (call.method == 'Clipboard.setData') calls.add(call);
            return null;
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(SystemChannels.platform, null),
      );

      await pumpScreen(tester, fullLog);
      await tester.tap(find.byIcon(Icons.copy_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Log copied to clipboard'), findsOneWidget);
      expect(
        (calls.single.arguments as Map)['text'],
        'Summary: Failed to connect\n'
        'Type: auth\n'
        'Time: 2025-01-22 10:50:31\n'
        'Server address: http://pi.hole\n'
        'Status code: 401\n'
        'Details: {"error": "unauthorized"}',
      );
    });
  });

  group('appLogToText', () {
    test('leaves out the fields that are null', () {
      expect(
        appLogToText(minimalLog, dateTime: '2025-01-22 10:50:31'),
        'Summary: Failed to save the credentials\n'
        'Type: storage\n'
        'Time: 2025-01-22 10:50:31',
      );
    });
  });
}
