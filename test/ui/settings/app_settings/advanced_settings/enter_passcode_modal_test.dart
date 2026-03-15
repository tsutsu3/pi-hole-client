import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/widgets/enter_passcode_modal.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('EnterPasscodeModal', () {
    late AppConfigViewModel appConfigViewModel;

    setUp(() async {
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      await appConfigViewModel.setPassCode('1234');
    });

    Widget buildModal({bool window = false}) {
      return buildTestApp(
        EnterPasscodeModal(onConfirm: () {}, window: window),
        appConfigViewModel: appConfigViewModel,
      );
    }

    testWidgets('renders as Scaffold when window=false', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildModal(window: false));
      await tester.pump();

      expect(find.text('Enter passcode'), findsOneWidget);
      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('renders as Dialog when window=true', (tester) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildModal(window: true));
      await tester.pump();

      expect(find.text('Enter passcode'), findsOneWidget);
      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('Confirm button is disabled initially', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildModal(window: false));
      await tester.pump();

      // Confirm button exists but is disabled (onPressed is null)
      final confirmButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Confirm'),
      );
      expect(confirmButton.onPressed, isNull);
    });

    testWidgets('Confirm button enabled after 4 digits entered', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildModal(window: false));
      await tester.pump();

      // Tap 1, 2, 3, 4 to enter code
      await tester.tap(find.widgetWithText(ElevatedButton, '1'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '2'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '3'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '4'));
      await tester.pump();

      final confirmButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Confirm'),
      );
      expect(confirmButton.onPressed, isNotNull);
    });

    testWidgets('onConfirm called when correct passcode entered', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      var confirmed = false;

      await tester.pumpWidget(
        buildTestApp(
          EnterPasscodeModal(onConfirm: () => confirmed = true, window: false),
          appConfigViewModel: appConfigViewModel,
        ),
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, '1'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '2'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '3'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '4'));
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, 'Confirm'));
      await tester.pump();

      expect(confirmed, isTrue);
    });

    testWidgets('wrong passcode resets code without calling onConfirm', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      var confirmed = false;

      await tester.pumpWidget(
        buildTestApp(
          EnterPasscodeModal(onConfirm: () => confirmed = true, window: false),
          appConfigViewModel: appConfigViewModel,
        ),
      );
      await tester.pump();

      // Enter wrong code: 9999
      await tester.tap(find.widgetWithText(ElevatedButton, '9'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '9'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '9'));
      await tester.pump();
      await tester.tap(find.widgetWithText(ElevatedButton, '9'));
      await tester.pump();

      await tester.tap(find.widgetWithText(TextButton, 'Confirm'));
      await tester.pumpAndSettle();

      expect(confirmed, isFalse);
      // Confirm is disabled again (code was reset)
      final confirmButton = tester.widget<TextButton>(
        find.widgetWithText(TextButton, 'Confirm'),
      );
      expect(confirmButton.onPressed, isNull);
    });

    testWidgets('window=true dialog renders close and confirm buttons', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildModal(window: true));
      await tester.pump();

      expect(find.byIcon(Icons.clear_rounded), findsOneWidget);
      expect(find.widgetWithText(TextButton, 'Confirm'), findsOneWidget);
    });
  });
}
