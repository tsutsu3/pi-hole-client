import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/ui/modals/group_filter_modal.dart';

import '../../helpers.dart';

void main() async {
  await initializeApp();

  group('GroupFilterModal', () {
    late TestSetupHelper testSetup;

    setUp(() async {
      testSetup = TestSetupHelper();
      testSetup.initializeMock(useApiGatewayVersion: 'v6');
    });

    testWidgets('should display modal with groups', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      int? appliedGroupId;

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupFilterModal(
            groups: const {
              0: 'Default',
              1: 'Group A',
              2: 'Group B',
            },
            selectedGroupId: null,
            onApply: (groupId) {
              appliedGroupId = groupId;
            },
            window: false,
          ),
        ),
      );

      expect(find.byType(GroupFilterModal), findsOneWidget);
      expect(find.text('Groups'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Default'), findsOneWidget);
      expect(find.text('Group A'), findsOneWidget);
      expect(find.text('Group B'), findsOneWidget);
      expect(find.text('Reset'), findsOneWidget);
      expect(find.text('Close'), findsOneWidget);
      expect(find.text('Apply'), findsOneWidget);

      await tester.tap(find.text('Group A'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      expect(appliedGroupId, 1);
    });

    testWidgets('should display modal as dialog window',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupFilterModal(
            groups: const {
              0: 'Default',
              1: 'Group A',
            },
            selectedGroupId: 0,
            onApply: (_) {},
            window: true,
          ),
        ),
      );

      expect(find.byType(GroupFilterModal), findsOneWidget);
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text('Groups'), findsOneWidget);
    });

    testWidgets('should reset selection when Reset is tapped',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      int? appliedGroupId = 1;

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          GroupFilterModal(
            groups: const {
              0: 'Default',
              1: 'Group A',
            },
            selectedGroupId: 1,
            onApply: (groupId) {
              appliedGroupId = groupId;
            },
            window: false,
          ),
        ),
      );

      await tester.tap(find.text('Reset'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Apply'));
      await tester.pumpAndSettle();

      expect(appliedGroupId, null);
    });

    testWidgets('should show modal via showGroupFilterModal on mobile',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showGroupFilterModal(
                    context: context,
                    groups: const {0: 'Default', 1: 'Test Group'},
                    selectedGroupId: null,
                    onApply: (_) {},
                  );
                },
                child: const Text('Open Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open Modal'));
      await tester.pumpAndSettle();

      expect(find.byType(GroupFilterModal), findsOneWidget);
      expect(find.text('Groups'), findsOneWidget);
      expect(find.text('Test Group'), findsOneWidget);
    });

    testWidgets('should show dialog via showGroupFilterModal on desktop',
        (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        testSetup.buildTestWidget(
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showGroupFilterModal(
                    context: context,
                    groups: const {0: 'Default', 1: 'Desktop Group'},
                    selectedGroupId: null,
                    onApply: (_) {},
                  );
                },
                child: const Text('Open Modal'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open Modal'));
      await tester.pumpAndSettle();

      expect(find.byType(GroupFilterModal), findsOneWidget);
      expect(find.byType(Dialog), findsOneWidget);
      expect(find.text('Desktop Group'), findsOneWidget);
    });
  });
}
