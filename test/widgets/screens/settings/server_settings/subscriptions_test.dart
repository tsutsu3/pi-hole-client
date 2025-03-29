import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/subscriptions.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/add_subscription_modal.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/delete_subscription_modal.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/edit_subscription_modal.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/subscription_details_screen.dart';
import 'package:pi_hole_client/widgets/labeled_multi_select_tile.dart';

import '../../../helpers.dart';
import '../../utils.dart';

void main() async {
  await initializeApp();

  group(
    'Adlists Screen Widget Tests',
    () {
      late TestSetupHelper testSetup;

      setUp(() async {
        testSetup = TestSetupHelper();
        testSetup.initializeMock(useApiGatewayVersion: 'v6');
      });

      testWidgets(
        'should show screen with V6 server (tablet)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2560, 1600);
          tester.view.devicePixelRatio = 1.6;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          expect(find.text('Adlists'), findsOneWidget);
          expect(find.text('Allowlist'), findsOneWidget);
          expect(find.text('Blocklist'), findsOneWidget);
          expect(
            find.text('There are no adlists to show here.'),
            findsOneWidget,
          );
          expect(
            find.text('Choose an adlist to see its details'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show not supported screen with V5 server',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          testSetup.initializeMock();

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
          expect(find.text('Adlists'), findsOneWidget);
          expect(find.text('Allowlist'), findsNothing);
          expect(find.text('Blocklist'), findsNothing);
        },
      );

      testWidgets(
        'should show empty data screen when no server selected',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockServersProvider.selectedServer).thenReturn(null);
          when(testSetup.mockServersProvider.selectedApiGateway)
              .thenReturn(null);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          expect(find.byType(EmptyDataScreen), findsOneWidget);
          expect(find.text('Adlists'), findsOneWidget);
          expect(find.text('Allowlist'), findsNothing);
          expect(find.text('Blocklist'), findsNothing);
        },
      );

      testWidgets(
        'should show error message screen when loading status is error',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockSubscriptionsListProvider.loadingStatus)
              .thenReturn(LoadStatus.error);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();
          await tester.pumpAndSettle(const Duration(seconds: 3));

          expect(find.text('Adlists'), findsOneWidget);
          expect(find.text('Allowlist'), findsOneWidget);
          expect(find.text('Blocklist'), findsOneWidget);
          expect(find.byIcon(Icons.error), findsOneWidget);
          expect(find.text("Adlists couldn't be loaded"), findsOneWidget);
        },
      );

      testWidgets(
        'should show progress indicator when loading status is loading',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockSubscriptionsListProvider.loadingStatus)
              .thenReturn(LoadStatus.loading);

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          expect(find.text('Adlists'), findsOneWidget);
          expect(find.text('Allowlist'), findsOneWidget);
          expect(find.text('Blocklist'), findsOneWidget);
          expect(find.text('Loading list...'), findsOneWidget);
          showText();
        },
      );

      testWidgets(
        'should show blocklist when tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          expect(
            find.text('https://hosts-file.net/ad_servers.txt'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show details screen when adlist is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);
        },
      );

      testWidgets(
        'should filtered adlist when searchmode is on',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          when(testSetup.mockSubscriptionsListProvider.searchMode)
              .thenReturn(true);

          when(testSetup.mockSubscriptionsListProvider.searchTerm)
              .thenReturn('xxx');

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          when(testSetup.mockSubscriptionsListProvider.searchMode)
              .thenReturn(true);
          await tester.pump();

          expect(find.byIcon(Icons.close_rounded), findsOneWidget);
        },
      );

      testWidgets(
        'should add adlist when add button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          expect(find.byIcon(Icons.add), findsOneWidget);
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle();

          // Show add modal
          expect(find.byType(AddSubscriptionModal), findsOneWidget);
          expect(find.text('Add adlist'), findsOneWidget);

          // Add
          await tester.enterText(
            find.byType(TextField).at(0),
            'http://localhost/test.txt',
          );
          await tester.pumpAndSettle();
          await tester.enterText(
            find.byType(TextField).at(1),
            'test comment',
          );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Add'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist added successfully'), findsWidgets);
        },
      );

      testWidgets(
        'should edit comment when edit button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);

          // Show edit modal
          expect(find.text('Comment'), findsOneWidget);
          await tester.tap(find.text('Comment'));
          await tester.pumpAndSettle();
          expect(find.byType(EditSubscriptionModal), findsOneWidget);
          expect(find.text('Edit comment'), findsOneWidget);

          // Edit
          await tester.enterText(find.byType(TextField), 'test123');
          await tester.pumpAndSettle();
          await tester.tap(find.text('Edit'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist updated successfully'), findsWidgets);
        },
      );

      testWidgets(
        'should edit group when edit button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);

          // Show edit modal
          expect(find.text('Groups'), findsOneWidget);
          await tester.tap(find.text('Groups'));
          await tester.pumpAndSettle();
          expect(find.byType(EditSubscriptionModal), findsOneWidget);
          expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
          expect(find.text('Edit groups'), findsOneWidget);

          // Edit
          await tester.tap(find.byType(CheckboxListTile).last);
          await tester.pumpAndSettle();
          await tester.tap(find.text('Edit'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist updated successfully'), findsWidgets);
        },
      );

      testWidgets(
        'should change status when status button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);

          expect(find.text('Status'), findsOneWidget);
          await tester.tap(find.text('Status'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist updated successfully'), findsWidgets);
        },
      );

      testWidgets(
        'should remove adlist when remove button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);

          expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
          await tester.tap(find.byIcon(Icons.delete_rounded));
          await tester.pumpAndSettle();

          // Show remove modal
          expect(find.byType(DeleteSubscriptionModal), findsOneWidget);
          expect(find.text('Delete adlist'), findsOneWidget);
          await tester.tap(find.text('Confirm'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist removed successfully'), findsWidgets);
        },
      );

      testWidgets(
        'should remove adlist when remove button is tapped on tablet',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(2560, 1600);
          tester.view.devicePixelRatio = 1.6;

          addTearDown(() {
            tester.view.resetPhysicalSize();
            tester.view.resetDevicePixelRatio();
          });

          await tester.pumpWidget(
            testSetup.buildTestWidget(
              const SubscriptionLists(),
            ),
          );

          expect(find.byType(SubscriptionLists), findsOneWidget);
          await tester.pump();

          await tester.tap(find.text('Blocklist'));
          await tester.pumpAndSettle();
          await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
          await tester.pumpAndSettle();
          expect(find.byType(SubscriptionDetailsScreen), findsOneWidget);
          expect(find.text('Adlist Details'), findsOneWidget);

          expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
          await tester.tap(find.byIcon(Icons.delete_rounded));
          await tester.pumpAndSettle();

          // Show remove modal
          expect(find.byType(DeleteSubscriptionModal), findsOneWidget);
          expect(find.text('Delete adlist'), findsOneWidget);
          await tester.tap(find.text('Confirm'));
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
          expect(find.text('Adlist removed successfully'), findsWidgets);
          expect(
              find.text('Choose an adlist to see its details'), findsWidgets);
        },
      );
    },
  );
}
