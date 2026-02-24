import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/ui/core/ui/modals/start_warning_modal.dart';
import 'package:pi_hole_client/ui/shell/base.dart';

import './helpers.dart';

void main() async {
  await initializeApp();

  group('Base Widget Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();

      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should show important info modal when first time access', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      when(testSetup.mockServersViewModel.selectedServer).thenReturn(null);
      when(testSetup.mockConfigProvider.importantInfoReaden).thenReturn(false);

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          const Base(child: SizedBox()),
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(StartInfoModal), findsOneWidget);
      expect(find.text('Getting Started'), findsOneWidget);
    });

    testWidgets('should render child widget', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      when(testSetup.mockServersViewModel.selectedServer).thenReturn(null);

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          const Base(child: Text('Test Child')),
        ),
      );

      expect(find.byType(Base), findsOneWidget);
      await tester.pump();
      expect(find.text('Test Child'), findsOneWidget);
    });
  });
}
