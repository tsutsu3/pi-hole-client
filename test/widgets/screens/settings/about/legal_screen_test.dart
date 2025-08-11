import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/about/legal_screen.dart';

import '../../../helpers.dart';

void main() async {
  await initializeApp();

  group('LegalScreen Tests', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('displays error UI when NOTICE file fails to load',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
        tester.binding.defaultBinaryMessenger
            .setMockMessageHandler('flutter/assets', null);
      });

      // Raise an error when NOTICE file is requested
      tester.binding.defaultBinaryMessenger.setMockMessageHandler(
        'flutter/assets',
        (ByteData? message) async {
          final key = const StringCodec().decodeMessage(message)!;
          if (key == 'NOTICE') {
            throw Exception('Simulated error loading NOTICE file');
          }
          return null;
        },
      );

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          const LegalScreen(),
        ),
      );

      expect(find.byType(LegalScreen), findsOneWidget);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.byIcon(Icons.error), findsOneWidget);
      expect(find.textContaining('ERROR'), findsOneWidget);
    });
  });
}
