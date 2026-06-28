import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/totp_input_modal.dart';

import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('TOTP input dialog', () {
    testWidgets('shows a dialog on wider layouts and returns the code', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      String? code;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                code = await showTotpInputModal(context);
              },
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(Dialog), findsOneWidget);
      expect(find.byIcon(Icons.password_rounded), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(6));

      await tester.enterText(find.byType(TextField).first, '123456');
      await tester.pump();
      await tester.tap(find.text('Confirm'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(code, '123456');
    });

    testWidgets('pastes digits from the clipboard', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (methodCall) async {
          if (methodCall.method == 'Clipboard.getData') {
            return <String, dynamic>{'text': 'code: 123456'};
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      String? code;

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                code = await showTotpInputModal(context);
              },
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      final pasteButton = find.byIcon(Icons.content_paste_rounded);
      await tester.ensureVisible(pasteButton);
      await tester.pump();
      await tester.tap(pasteButton);
      await tester.pumpAndSettle();

      // Pasting a complete 6-digit code auto-submits without tapping Confirm.
      expect(code, '123456');
    });

    testWidgets('shows a bottom sheet on mobile layouts', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showTotpInputModal(context),
              child: const Text('Open'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.byType(Dialog), findsNothing);
      expect(find.byType(BottomSheet), findsOneWidget);
      expect(find.byIcon(Icons.password_rounded), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(6));
    });
  });
}
