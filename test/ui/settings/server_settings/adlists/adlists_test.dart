import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/add_adlist_modal.dart'
    hide ListType;
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/adlist_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/widgets/edit_adlist_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../testing/fakes/repositories/api/fake_adlist_repository.dart';
import '../../../../../testing/fakes/repositories/api/fake_group_repository.dart';
import '../../../../../testing/fakes/viewmodels/fake_gravity_update_viewmodel.dart';
import '../../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../../testing/test_app.dart';

// ---------------------------------------------------------------------------
// Test-specific fake adlist repository that returns data matching the old
// mock expectations used by the widget tests.
// ---------------------------------------------------------------------------
class _TestAdlistRepository extends FakeAdlistRepository {
  final _now = DateTime.fromMillisecondsSinceEpoch(1742739018 * 1000);
  final _nowMod = DateTime.fromMillisecondsSinceEpoch(1742739030 * 1000);

  @override
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAdlists failure'));
    }
    return Success([
      Adlist(
        address: 'https://hosts-file.net/ad_servers.txt',
        comment: 'Some comment for this list',
        groups: [0],
        enabled: true,
        id: 106,
        type: ListType.block,
        dateAdded: _now,
        dateModified: _nowMod,
        dateUpdated: DateTime.fromMillisecondsSinceEpoch(0),
        number: 0,
        invalidDomains: 0,
        abpEntries: 0,
        status: ListsStatus.unknown,
      ),
    ]);
  }
}

// ---------------------------------------------------------------------------
// Test-specific fake group repository that returns data matching the old
// mock expectations.
// ---------------------------------------------------------------------------
class _TestGroupRepository extends FakeGroupRepository {
  @override
  Future<Result<List<Group>>> fetchGroups() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchGroups failure'));
    }
    return Success([
      Group(
        id: 0,
        name: 'Default',
        comment: 'The default group',
        enabled: true,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(1594670974 * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(1611157897 * 1000),
      ),
      Group(
        id: 5,
        name: 'group1',
        enabled: true,
        dateAdded: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
        dateModified: DateTime.fromMillisecondsSinceEpoch(1604871899 * 1000),
      ),
    ]);
  }
}

// ---------------------------------------------------------------------------
// A fake adlist repository whose fetchAdlists never completes, keeping the
// ViewModel in the "loading" state.
// ---------------------------------------------------------------------------
class _NeverCompleteAdlistRepository extends FakeAdlistRepository {
  @override
  Future<Result<List<Adlist>>> fetchAdlists({String? adlist, ListType? type}) {
    return Completer<Result<List<Adlist>>>().future;
  }
}

// ---------------------------------------------------------------------------
// Shared test fixtures
// ---------------------------------------------------------------------------
const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV5 = Server(
  address: 'http://localhost:8080',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('Adlists Screen Widget Tests', () {
    late _TestAdlistRepository fakeAdlistRepository;
    late _TestGroupRepository fakeGroupRepository;
    late FakeServersViewModel fakeServersViewModel;
    late AdlistsViewModel adlistsViewModel;
    late GroupsViewModel groupsViewModel;
    late FakeGravityUpdateViewModel fakeGravityUpdateViewModel;

    setUp(() async {
      Command.globalExceptionHandler = (_, _) {};

      fakeAdlistRepository = _TestAdlistRepository();
      fakeGroupRepository = _TestGroupRepository();

      fakeServersViewModel = FakeServersViewModel()..selectedServer = _serverV6;
      adlistsViewModel = AdlistsViewModel(
        adListRepository: fakeAdlistRepository,
      );
      groupsViewModel = GroupsViewModel(groupRepository: fakeGroupRepository);
      fakeGravityUpdateViewModel = FakeGravityUpdateViewModel()
        ..logs = ['log1', 'log2']
        ..messages = [
          FtlMessage(
            id: 5,
            timestamp: DateTime.fromMillisecondsSinceEpoch(1743936482 * 1000),
            message: 'List with ID 10 was inaccessible during last gravity run',
            url: 'http://localhost:8989/test.txt',
          ),
        ]
        ..startedAtTime = DateTime.fromMillisecondsSinceEpoch(1733465700 * 1000)
        ..completedAtTime = DateTime.fromMillisecondsSinceEpoch(
          1733465700 * 1000,
        );
    });

    tearDown(() {
      adlistsViewModel.dispose();
      groupsViewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    Widget buildAdlistWidget({
      FakeServersViewModel? serversOverride,
      AdlistsViewModel? adlistsOverride,
      GroupsViewModel? groupsOverride,
      FakeGravityUpdateViewModel? gravityOverride,
    }) {
      return buildTestApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ServersViewModel>.value(
              value: serversOverride ?? fakeServersViewModel,
            ),
            ChangeNotifierProvider<AdlistsViewModel>.value(
              value: adlistsOverride ?? adlistsViewModel,
            ),
            ChangeNotifierProvider<GroupsViewModel>.value(
              value: groupsOverride ?? groupsViewModel,
            ),
            ChangeNotifierProvider<GravityUpdateViewModel>.value(
              value: gravityOverride ?? fakeGravityUpdateViewModel,
            ),
          ],
          child: const AdlistScreen(),
        ),
      );
    }

    Widget buildAdlistWidgetWithRouter({
      FakeServersViewModel? serversOverride,
      AdlistsViewModel? adlistsOverride,
      GroupsViewModel? groupsOverride,
      FakeGravityUpdateViewModel? gravityOverride,
    }) {
      final effectiveServers = serversOverride ?? fakeServersViewModel;
      final effectiveAdlists = adlistsOverride ?? adlistsViewModel;
      final effectiveGroups = groupsOverride ?? groupsViewModel;
      final effectiveGravity = gravityOverride ?? fakeGravityUpdateViewModel;

      final router = GoRouter(
        initialLocation: '/adlists',
        routes: [
          GoRoute(
            path: '/adlists',
            builder: (context, state) => MultiProvider(
              providers: [
                ChangeNotifierProvider<ServersViewModel>.value(
                  value: effectiveServers,
                ),
                ChangeNotifierProvider<AdlistsViewModel>.value(
                  value: effectiveAdlists,
                ),
                ChangeNotifierProvider<GroupsViewModel>.value(
                  value: effectiveGroups,
                ),
                ChangeNotifierProvider<GravityUpdateViewModel>.value(
                  value: effectiveGravity,
                ),
              ],
              child: const AdlistScreen(),
            ),
            routes: [
              GoRoute(
                path: 'details',
                name: Routes.settingsServerAdlistsDetails,
                builder: (context, state) {
                  final extra =
                      state.extra!
                          as (
                            Adlist,
                            void Function(Adlist),
                            Map<int, String>,
                            AppColors?,
                            AdlistsViewModel,
                          );
                  return ChangeNotifierProvider.value(
                    value: extra.$5,
                    child: AdlistDetailsScreen(
                      adlist: extra.$1,
                      remove: extra.$2,
                      groups: extra.$3,
                      colors: extra.$4,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
      return buildTestApp(const SizedBox.shrink(), router: router);
    }

    testWidgets('should show screen with V6 server (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Allowlist'), findsOneWidget);
      expect(find.text('Blocklist'), findsOneWidget);
      expect(find.text('There are no adlists to show here.'), findsOneWidget);
      expect(find.text('Choose an adlist to see its details'), findsOneWidget);
    });

    testWidgets('should show not supported screen with V5 server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeServersViewModel.selectedServer = _serverV5;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Allowlist'), findsNothing);
      expect(find.text('Blocklist'), findsNothing);
    });

    testWidgets('should show empty data screen when no server selected', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeServersViewModel.selectedServer = null;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(EmptyDataScreen), findsOneWidget);
      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('Allowlist'), findsNothing);
      expect(find.text('Blocklist'), findsNothing);
    });

    testWidgets(
      'should show error message screen when loading status is error',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeAdlistRepository.shouldFail = true;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(buildAdlistWidget());

        expect(find.byType(AdlistScreen), findsOneWidget);
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

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        // Build the widget but use a never-completing repo to keep loading
        final slowVm = AdlistsViewModel(
          adListRepository: _NeverCompleteAdlistRepository(),
        );

        await tester.pumpWidget(buildAdlistWidget(adlistsOverride: slowVm));
        await tester.pump(const Duration(seconds: 1));

        expect(find.byType(AdlistScreen), findsOneWidget);
        expect(find.text('Adlists'), findsOneWidget);
        expect(find.text('Allowlist'), findsOneWidget);
        expect(find.text('Blocklist'), findsOneWidget);
        expect(find.text('Loading list...'), findsOneWidget);

        // Dispose the VM and pump to flush pending Command timers
        slowVm.dispose();
        await tester.pump(const Duration(milliseconds: 100));
      },
    );

    testWidgets('should show blocklist when tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      expect(
        find.text('https://hosts-file.net/ad_servers.txt'),
        findsOneWidget,
      );
    });

    testWidgets('should show details screen when adlist is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidgetWithRouter());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);
    });

    testWidgets('should filtered adlist when searchmode is on', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      adlistsViewModel.setSearchMode(true);
      adlistsViewModel.onSearch('xxx');

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Blocklist'));
      adlistsViewModel.setSearchMode(true);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    });

    testWidgets('should add adlist when add button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      expect(find.byIcon(Icons.add), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Show add modal
      expect(find.byType(AddAdlistModal), findsOneWidget);
      expect(find.text('Add Adlist'), findsOneWidget);

      // Add
      await tester.enterText(
        find.byType(TextField).at(0),
        'http://localhost/test.txt',
      );
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(1), 'test comment');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist added successfully'), findsWidgets);
    });

    testWidgets('should edit comment when edit button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidgetWithRouter());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);

      // Show edit modal
      expect(find.text('Comment'), findsOneWidget);
      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();
      expect(find.byType(EditAdlistModal), findsOneWidget);
      expect(find.text('Edit comment'), findsOneWidget);

      // Edit
      await tester.enterText(find.byType(TextField), 'test123');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist updated successfully'), findsWidgets);
    });

    testWidgets('should edit group when edit button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidgetWithRouter());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);

      // Show edit modal
      expect(find.text('Groups'), findsOneWidget);
      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();
      expect(find.byType(EditAdlistModal), findsOneWidget);
      expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
      expect(find.text('Edit groups'), findsOneWidget);

      // Edit
      await tester.tap(find.byType(CheckboxListTile).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist updated successfully'), findsWidgets);
    });

    testWidgets('should change status when status button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidgetWithRouter());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);

      expect(find.text('Status'), findsOneWidget);
      await tester.tap(find.text('Status'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist updated successfully'), findsWidgets);
    });

    testWidgets('should remove adlist when remove button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidgetWithRouter());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);

      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete Adlist'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist removed successfully'), findsWidgets);
    });

    testWidgets('should remove adlist when remove button is tapped on tablet', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Blocklist'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('https://hosts-file.net/ad_servers.txt'));
      await tester.pumpAndSettle();
      expect(find.byType(AdlistDetailsScreen), findsOneWidget);
      expect(find.text('Adlist Details'), findsOneWidget);

      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();

      // Show remove modal
      expect(find.byType(DeleteModal), findsOneWidget);
      expect(find.text('Delete Adlist'), findsOneWidget);
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Adlist removed successfully'), findsWidgets);
      expect(find.text('Choose an adlist to see its details'), findsWidgets);
    });

    testWidgets('should shows initial gravity status on first tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.logs = [];
      fakeGravityUpdateViewModel.messages = [];

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Update Gravity'));
      await tester.pumpAndSettle();

      expect(find.text('Gravity update has not run yet'), findsOneWidget);
      expect(find.text('Not yet executed'), findsOneWidget);

      expect(find.text('No messages'), findsOneWidget);
      expect(find.text('No issues were reported.'), findsOneWidget);

      expect(find.text('No logs.'), findsOneWidget);
    });

    testWidgets('should shows running status during gravity update', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.status = GravityStatus.running;
      fakeGravityUpdateViewModel.logs = ['Log1', 'Log2'];
      fakeGravityUpdateViewModel.isLoaded = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Update Gravity'));
      await tester.pumpAndSettle();
      expect(find.text('Gravity is running...'), findsOneWidget);
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
    });

    testWidgets(
      'should shows failure message when gravity update fails (e.g. app force stop)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeGravityUpdateViewModel.messages = [];
        fakeGravityUpdateViewModel.logs = ['Log1', 'Log2'];
        fakeGravityUpdateViewModel.status = GravityStatus.error;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(buildAdlistWidget());

        expect(find.byType(AdlistScreen), findsOneWidget);
        await tester.pump();

        await tester.tap(find.text('Update Gravity'));
        await tester.pumpAndSettle();
        expect(find.text('Gravity update failed'), findsOneWidget);
        expect(
          find.text(
            formatWithDuration(
              fakeGravityUpdateViewModel.startedAtTime,
              fakeGravityUpdateViewModel.completedAtTime,
            ),
          ),
          findsOneWidget,
        );

        expect(find.text('No messages'), findsOneWidget);
        expect(find.text('No issues were reported.'), findsOneWidget);

        expect(find.text('Log2'), findsOneWidget);
      },
    );

    testWidgets('should shows success message after gravity update completes', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.logs = ['Log1', 'Log2', 'Done'];
      fakeGravityUpdateViewModel.status = GravityStatus.success;
      fakeGravityUpdateViewModel.isLoaded = true;
      fakeGravityUpdateViewModel.completedAtTime =
          DateTime.fromMillisecondsSinceEpoch(1733465701 * 1000);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Update Gravity'));
      await tester.pumpAndSettle();
      expect(find.text('Gravity update completed'), findsOneWidget);
      expect(
        find.text(
          formatWithDuration(
            fakeGravityUpdateViewModel.startedAtTime,
            fakeGravityUpdateViewModel.completedAtTime,
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.text('List with ID 10 was inaccessible during last gravity run'),
        findsOneWidget,
      );
      expect(find.text('http://localhost:8989/test.txt'), findsOneWidget);

      expect(find.text('Done'), findsOneWidget);
    });

    testWidgets('should expand logs area when tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.logs = ['Log1', 'Log2', 'Done'];
      fakeGravityUpdateViewModel.status = GravityStatus.success;
      fakeGravityUpdateViewModel.isLoaded = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
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
    });

    testWidgets('should start update gravity when update button is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.status = GravityStatus.idle;
      fakeGravityUpdateViewModel.logs = [];
      fakeGravityUpdateViewModel.messages = [];
      fakeGravityUpdateViewModel.isLoaded = true;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Update Gravity'));
      await tester.pumpAndSettle();

      // Tap FAB to start update
      await tester.tap(find.byIcon(Icons.rocket_launch_rounded).first);
      await tester.pumpAndSettle();

      expect(fakeGravityUpdateViewModel.startCallCount, 1);
    });

    testWidgets('should delete message when swiped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      fakeGravityUpdateViewModel.logs = ['Log1', 'Log2', 'Done'];
      fakeGravityUpdateViewModel.status = GravityStatus.success;
      fakeGravityUpdateViewModel.isLoaded = true;
      fakeGravityUpdateViewModel.completedAtTime =
          DateTime.fromMillisecondsSinceEpoch(1733465701 * 1000);

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(buildAdlistWidget());

      expect(find.byType(AdlistScreen), findsOneWidget);
      await tester.pump();

      await tester.tap(find.text('Update Gravity'));
      await tester.pumpAndSettle();

      expect(
        find.text('List with ID 10 was inaccessible during last gravity run'),
        findsOneWidget,
      );
      expect(find.text('http://localhost:8989/test.txt'), findsOneWidget);

      await tester.drag(
        find.text('List with ID 10 was inaccessible during last gravity run'),
        const Offset(-500, 0),
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      expect(
        find.text('List with ID 10 was inaccessible during last gravity run'),
        findsNothing,
      );
      expect(find.text('http://localhost:8989/test.txt'), findsNothing);
    });
  });
}
