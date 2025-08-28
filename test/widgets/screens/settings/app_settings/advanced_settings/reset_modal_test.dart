import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/app_settings/advanced_settings/advanced_options.dart';

import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Erase App Data Screen Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should cancel the reset application action', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(const AdvancedOptions()),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      expect(find.text('Reset application'), findsOneWidget);

      await tester.tap(find.text('Reset application'));
      await tester.pumpAndSettle();
      expect(find.text('Erase app data'), findsNWidgets(2));
      expect(find.text('Cancel'), findsOneWidget);
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(find.text('Erase app data'), findsNothing);
    });

    testWidgets('should erase all app data', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(Phoenix(child: const AdvancedOptions())),
      );

      expect(find.byType(AdvancedOptions), findsOneWidget);
      expect(find.text('Reset application'), findsOneWidget);

      await tester.tap(find.text('Reset application'));
      await tester.pumpAndSettle();
      expect(find.text('Erase app data'), findsNWidgets(2));
      expect(find.text('ERASE ALL (5)'), findsOneWidget);
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 6));
      await tester.tap(find.text('ERASE ALL'));
      await tester.pumpAndSettle();
      expect(find.text('Erase app data'), findsNothing);
    });
  });
}
