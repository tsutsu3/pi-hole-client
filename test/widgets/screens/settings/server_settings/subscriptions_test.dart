import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/format.dart';
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
            find.text('Choose an adlist to see its details'),
            findsWidgets,
          );
        },
      );

      testWidgets(
        'should shows initial gravity status on first tap',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.logs).thenReturn([]);
          when(testSetup.mockGravityUpdateProvider.messages).thenReturn([]);

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();

          expect(
            find.text('Gravity update has not run yet'),
            findsOneWidget,
          );
          expect(find.text('Not yet executed'), findsOneWidget);

          expect(find.text('No messages'), findsOneWidget);
          expect(find.text('No issues were reported.'), findsOneWidget);

          expect(find.text('No logs.'), findsOneWidget);
        },
      );

      testWidgets(
        'should shows running status during gravity update',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.status)
              .thenReturn(GravityStatus.running);

          when(testSetup.mockGravityUpdateProvider.logs)
              .thenReturn(['Log1', 'Log2']);

          when(testSetup.mockGravityUpdateProvider.isLoaded).thenReturn(true);

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();
          expect(
            find.text('Gravity is running...'),
            findsOneWidget,
          );
          expect(
            find.text(
              'Updating... this may take a while. Please keep the app open.',
            ),
            findsOneWidget,
          );

          expect(find.text('Running...'), findsOneWidget);
          expect(
            find.text(
              'This section will show the result once the task is complete.',
            ),
            findsOneWidget,
          );

          expect(find.text('Log2'), findsOneWidget);
        },
      );

      testWidgets(
        'should shows failure message when gravity update fails (e.g. app force stop)',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.messages).thenReturn([]);

          when(testSetup.mockGravityUpdateProvider.logs)
              .thenReturn(['Log1', 'Log2']);

          when(testSetup.mockGravityUpdateProvider.status)
              .thenReturn(GravityStatus.error);

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();
          expect(
            find.text('Gravity update failed'),
            findsOneWidget,
          );
          // expect(
          //   find.text('2024-12-06 15:15 (0.0 seconds)'),
          //   findsOneWidget,
          // );
          expect(
            find.text(
              formatWithDuration(
                testSetup.mockGravityUpdateProvider.startedAtTime,
                testSetup.mockGravityUpdateProvider.completedAtTime,
              ),
            ),
            findsOneWidget,
          );

          expect(find.text('No messages'), findsOneWidget);
          expect(find.text('No issues were reported.'), findsOneWidget);

          expect(find.text('Log2'), findsOneWidget);
        },
      );

      testWidgets(
        'should shows success message after gravity update completes',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.logs)
              .thenReturn(['Log1', 'Log2', 'Done']);

          when(testSetup.mockGravityUpdateProvider.status)
              .thenReturn(GravityStatus.success);

          when(testSetup.mockGravityUpdateProvider.isLoaded).thenReturn(true);

          when(testSetup.mockGravityUpdateProvider.completedAtTime).thenReturn(
            DateTime.fromMillisecondsSinceEpoch(1733465701 * 1000),
          );

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();
          expect(
            find.text('Gravity update completed'),
            findsOneWidget,
          );
          // expect(
          //   find.text('2024-12-06 15:15 (1.0 seconds)'),
          //   findsOneWidget,
          // );
          expect(
            find.text(
              formatWithDuration(
                testSetup.mockGravityUpdateProvider.startedAtTime,
                testSetup.mockGravityUpdateProvider.completedAtTime,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              'List with ID 10 was inaccessible during last gravity run',
            ),
            findsOneWidget,
          );
          expect(find.text('http://localhost:8989/test.txt'), findsOneWidget);

          expect(find.text('Done'), findsOneWidget);
        },
      );

      testWidgets(
        'should expand logs area when tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.logs)
              .thenReturn(['Log1', 'Log2', 'Done']);

          when(testSetup.mockGravityUpdateProvider.status)
              .thenReturn(GravityStatus.success);

          when(testSetup.mockGravityUpdateProvider.isLoaded).thenReturn(true);

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();

          expect(find.text('Log1'), findsNothing);
          expect(find.text('Log2'), findsNothing);
          expect(find.text('Done'), findsOneWidget);

          await tester.tap(find.text('Done').first);
          await tester.pumpAndSettle();

          expect(find.text('Log1'), findsOneWidget);
          expect(find.text('Log2'), findsOneWidget);
          expect(find.text('Done'), findsNWidgets(2));
        },
      );

      testWidgets(
        'should start update gravity when update button is tapped',
        (WidgetTester tester) async {
          tester.view.physicalSize = const Size(1080, 2400);
          tester.view.devicePixelRatio = 2.0;

          when(testSetup.mockGravityUpdateProvider.status)
              .thenReturn(GravityStatus.idle);

          when(testSetup.mockGravityUpdateProvider.logs).thenReturn([]);
          when(testSetup.mockGravityUpdateProvider.messages).thenReturn([]);
          when(testSetup.mockGravityUpdateProvider.isLoaded).thenReturn(true);

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

          await tester.tap(find.text('Update Gravity'));
          await tester.pumpAndSettle();

          // Tap FAB to start update
          await tester.tap(find.byIcon(Icons.rocket_launch_rounded).first);
          await tester.pumpAndSettle();

          verify(testSetup.mockGravityUpdateProvider.start()).called(1);
        },
      );
    },
  );
}
