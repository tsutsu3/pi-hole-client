import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/viewmodel/sessions_viewmodel.dart';

import '../../../../../../testing/fakes/repositories/api/fake_auth_repository.dart';
import '../../../../helpers.dart';

void main() async {
  await initializeApp();

  group('Sessions Screen tests', () {
    late TestSetupHelper testSetup;
    late FakeAuthRepository fakeAuthRepository;
    late SessionsViewModel viewModel;

    setUp(() async {
      // ignore: unnecessary_underscores
Command.globalExceptionHandler = (_, __) {};
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
      fakeAuthRepository = FakeAuthRepository();
      viewModel = SessionsViewModel(authRepository: fakeAuthRepository);
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildSessionsWidget() {
      return testSetup.buildTestWidget(
        SessionsScreen(viewModel: viewModel..loadSessions.run()),
      );
    }

    testWidgets('should show error screen when fetching sessions fails', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeAuthRepository.shouldFail = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Complete the failing command before building the widget to avoid
      // Skeletonizer's ShimmerEffect infinite animation during loading.
      await tester.runAsync(() async {
        viewModel.loadSessions.run();
        await Future<void>.delayed(const Duration(milliseconds: 500));
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          SessionsScreen(viewModel: viewModel),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(SessionsScreen), findsOneWidget);
      expect(find.byType(ErrorMessage), findsOneWidget);
    });

    testWidgets('should show detail screen with tap (in use)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildSessionsWidget());
      await tester.pumpAndSettle();

      expect(find.byType(SessionsScreen), findsOneWidget);

      await tester.tap(find.text('192.168.0.31'));
      await tester.pumpAndSettle();

      expect(find.byType(SessionDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsNothing);
    });

    testWidgets('should refresh sessions on tap', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildSessionsWidget());
      await tester.pumpAndSettle();

      expect(find.byType(SessionsScreen), findsOneWidget);
      expect(find.byIcon(Icons.refresh_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.refresh_rounded));
      await tester.pumpAndSettle();
    });

    testWidgets('should show delete session button with tap (not in use)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildSessionsWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.text('192.168.0.30'));
      await tester.pumpAndSettle();

      expect(find.byType(SessionDetailScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete Session'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Session removed successfully'), findsWidgets);
    });
  });
}
