import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_details_modal.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  final baseLog = AppLog(
    type: 'error',
    dateTime: DateTime(2025, 1, 1, 12, 0),
    message: 'Something went wrong',
    statusCode: '500',
    resBody: '{"error":"internal"}',
  );

  group('AppLogDetailsModal', () {
    testWidgets('shows Log details title', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: baseLog)));
      expect(find.text('Log details'), findsOneWidget);
    });

    testWidgets('message tab is selected by default', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: baseLog)));
      expect(find.text('Something went wrong'), findsOneWidget);
    });

    testWidgets('switches to status code tab and shows status code', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: baseLog)));

      await tester.tap(find.text('Status code'));
      await tester.pumpAndSettle();

      expect(find.text('500'), findsOneWidget);
    });

    testWidgets('switches to body tab and shows response body', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: baseLog)));

      await tester.tap(find.text('Body'));
      await tester.pumpAndSettle();

      expect(find.text('{"error":"internal"}'), findsOneWidget);
    });

    testWidgets('shows [NO STAUS CODE] when statusCode is null', (
      WidgetTester tester,
    ) async {
      final log = AppLog(
        type: 'error',
        dateTime: DateTime(2025, 1, 1),
        message: 'msg',
        statusCode: null,
        resBody: null,
      );

      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: log)));

      await tester.tap(find.text('Status code'));
      await tester.pumpAndSettle();

      expect(find.text('[NO STAUS CODE]'), findsOneWidget);
    });

    testWidgets('shows [NO RESPONSE BODY] when resBody is null', (
      WidgetTester tester,
    ) async {
      final log = AppLog(
        type: 'error',
        dateTime: DateTime(2025, 1, 1),
        message: 'msg',
        statusCode: null,
        resBody: null,
      );

      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: log)));

      await tester.tap(find.text('Body'));
      await tester.pumpAndSettle();

      expect(find.text('[NO RESPONSE BODY]'), findsOneWidget);
    });

    testWidgets('Close button closes the dialog', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestApp(AppLogDetailsModal(log: baseLog)));

      expect(find.text('Close'), findsOneWidget);
      await tester.tap(find.text('Close'));
      await tester.pumpAndSettle();
    });
  });
}
