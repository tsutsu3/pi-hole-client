import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';

void main() {
  Widget buildApp(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('ErrorMessage', () {
    testWidgets('shows the error icon and the message', (tester) async {
      await tester.pumpWidget(
        buildApp(const ErrorMessage(message: "Logs couldn't be loaded")),
      );

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.text("Logs couldn't be loaded"), findsOneWidget);
      expect(find.byType(CustomScrollView), findsNothing);
    });

    testWidgets('can be pulled to refresh when scrollable', (tester) async {
      var refreshCount = 0;

      await tester.pumpWidget(
        buildApp(
          RefreshIndicator(
            onRefresh: () async => refreshCount++,
            child: const ErrorMessage(message: 'error', scrollable: true),
          ),
        ),
      );

      await tester.fling(find.text('error'), const Offset(0, 300), 1000);
      await tester.pumpAndSettle();

      expect(refreshCount, 1);
    });
  });
}
