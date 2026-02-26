import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/edit_domain_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/fakes/repositories/api/fake_domain_repository.dart';
import '../../../testing/fakes/repositories/api/fake_group_repository.dart';
import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/test_app.dart';

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

final _now = DateTime(2025, 1, 1);

/// A configurable [FakeDomainRepository] that allows custom allow-exact lists.
class _ConfigurableFakeDomainRepository extends FakeDomainRepository {
  _ConfigurableFakeDomainRepository({this.customAllowExact});

  final List<Domain>? customAllowExact;

  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAllDomains failure'));
    }
    return Success(
      DomainLists(
        allowExact: customAllowExact ?? [
          Domain(
            id: 1,
            name: 'example.com',
            punyCode: 'example.com',
            type: DomainType.allow,
            kind: DomainKind.exact,
            comment: null,
            groups: [0],
            enabled: true,
            dateAdded: _now,
            dateModified: _now,
          ),
        ],
        allowRegex: [],
        denyExact: [],
        denyRegex: [],
      ),
    );
  }
}

/// Triggers [DomainsViewModel.loadDomains] and [GroupsViewModel.loadGroups]
/// then pumps the tester enough times to let the Command's internal
/// `Future.delayed(Duration.zero)` calls resolve inside the FakeAsync zone.
Future<void> _pumpAndLoad(
  WidgetTester tester,
  DomainsViewModel domainsViewModel,
  GroupsViewModel groupsViewModel,
) async {
  // ignore: unawaited_futures
  domainsViewModel.loadDomains.runAsync();
  // ignore: unawaited_futures
  groupsViewModel.loadGroups.runAsync();

  // Command uses Future.delayed(Duration.zero) at two points during execution.
  // In FakeAsync, zero-duration timers need a pump with a positive duration to
  // advance the fake clock past them.
  for (var i = 0; i < 4; i++) {
    await tester.pump(const Duration(milliseconds: 1));
  }
}

void main() async {
  await initTestApp();

  group('DomainsScreen Widget Tests (v6)', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeServersViewModel serversViewModel;
    late DomainsViewModel domainsViewModel;
    late GroupsViewModel groupsViewModel;

    setUp(() async {
      final appConfigRepo = FakeAppConfigRepository()
        ..importantInfoReadenValue = 1;
      appConfigViewModel = AppConfigViewModel(appConfigRepo);
      appConfigViewModel.saveFromDb(appConfigRepo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV6
        ..selectedServerEnabled = true
        ..serversList = [_serverV6];
    });

    void createViewModels({
      FakeDomainRepository? domainRepository,
      FakeGroupRepository? groupRepository,
    }) {
      final domainRepo = domainRepository ?? FakeDomainRepository();
      final groupRepo = groupRepository ?? FakeGroupRepository();
      domainsViewModel = DomainsViewModel(domainRepository: domainRepo);
      groupsViewModel = GroupsViewModel(groupRepository: groupRepo);
    }

    Widget buildApp() {
      return buildTestApp(
        const DomainsScreen(),
        appConfigViewModel: appConfigViewModel,
        serversViewModel: serversViewModel,
        domainsViewModel: domainsViewModel,
        groupsViewModel: groupsViewModel,
      );
    }

    /// Pumps the widget, triggers data loading, and settles.
    Future<void> pumpAndLoad(WidgetTester tester) async {
      await tester.pumpWidget(buildApp());
      await _pumpAndLoad(tester, domainsViewModel, groupsViewModel);
      await tester.pumpAndSettle();
    }

    testWidgets(
      'should delete a domain from whitelist and show confirmation modal (tablet)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(2560, 1600);
        tester.view.devicePixelRatio = 1.6;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        createViewModels(
          domainRepository: _ConfigurableFakeDomainRepository(
            customAllowExact: [
              Domain(
                id: 1,
                name: 'white01.example.com',
                punyCode: 'white01.example.com',
                type: DomainType.allow,
                kind: DomainKind.exact,
                enabled: true,
                dateAdded: _now,
                dateModified: _now,
                comment: null,
                groups: [0],
              ),
              Domain(
                id: 2,
                name: 'white02.example.com',
                punyCode: 'white02.example.com',
                type: DomainType.allow,
                kind: DomainKind.exact,
                enabled: true,
                dateAdded: _now,
                dateModified: _now,
                comment: null,
                groups: [0],
              ),
            ],
          ),
        );

        await pumpAndLoad(tester);

        // Show whitelist domains screen
        expect(find.byType(DomainsScreen), findsOneWidget);
        expect(find.text('white01.example.com'), findsOneWidget);
        expect(find.text('white02.example.com'), findsOneWidget);
        expect(
          find.text('Choose a domain to see its details.'),
          findsOneWidget,
        );

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white01.example.com'));
        await tester.pumpAndSettle();
        expect(find.byType(DomainDetailsScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        // Tap delete button
        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();
        expect(
          find.text('Are you sure you want to delete this domain?'),
          findsOneWidget,
        );
        expect(find.text('Delete'), findsOneWidget);

        // Tap confirm button
        await tester.tap(find.text('Delete'));
        await tester.pumpAndSettle();

        // Show whitelist domains screen
        expect(find.byType(DomainsScreen), findsOneWidget);
      },
    );

    testWidgets('should delete a domain with mobile screen size', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels(
        domainRepository: _ConfigurableFakeDomainRepository(
          customAllowExact: [
            Domain(
              id: 1,
              name: 'white01.example.com',
              punyCode: 'white01.example.com',
              type: DomainType.allow,
              kind: DomainKind.exact,
              enabled: true,
              dateAdded: _now,
              dateModified: _now,
              comment: null,
              groups: [0],
            ),
            Domain(
              id: 2,
              name: 'white02.example.com',
              punyCode: 'white02.example.com',
              type: DomainType.allow,
              kind: DomainKind.exact,
              enabled: true,
              dateAdded: _now,
              dateModified: _now,
              comment: null,
              groups: [0],
            ),
          ],
        ),
      );

      await pumpAndLoad(tester);

      // Show whitelist domains screen
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('white01.example.com'), findsOneWidget);
      expect(find.text('white02.example.com'), findsOneWidget);
      expect(find.text('Choose a domain to see its details.'), findsNothing);

      // Tap whitelist domain to open domain detail screen
      await tester.tap(find.text('white01.example.com'));
      await tester.pumpAndSettle();
      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

      // Tap delete button
      await tester.tap(find.byIcon(Icons.delete_rounded));
      await tester.pumpAndSettle();
      expect(
        find.text('Are you sure you want to delete this domain?'),
        findsOneWidget,
      );
      expect(find.text('Delete'), findsOneWidget);

      // Tap confirm button
      await tester.tap(find.text('Delete'));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.text('Domain removed successfully'), findsWidgets);

      // Show whitelist domains screen
      expect(find.byType(DomainsScreen), findsOneWidget);
    });

    testWidgets('should filter domains list by search term', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      // Enable search mode on the VM
      domainsViewModel.setSearchMode(true);
      domainsViewModel.onSearch('example');
      await tester.pump();

      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.byIcon(Icons.close_rounded), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('should add a domain to whitelist', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      // Show whitelist domains screen
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('Domains'), findsOneWidget);

      // Tap add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('Add Domain'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'white03.example.com');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Show whitelist domains screen
      expect(find.text('Domain added successfully'), findsWidgets);
      expect(find.byType(DomainsScreen), findsOneWidget);
    });

    testWidgets('should add a top TLD domain', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      // Show whitelist domains screen
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('Domains'), findsOneWidget);

      // Tap add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('Add Domain'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'com');
      await tester.pumpAndSettle();
      // toggle Switch
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(find.text('Invalid domain'), findsNothing);
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Show whitelist domains screen
      expect(find.text('Domain added successfully'), findsWidgets);
      expect(find.byType(DomainsScreen), findsOneWidget);
    });

    testWidgets('should add a top TLD domain with leading dot', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      // Show whitelist domains screen
      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('Domains'), findsOneWidget);

      // Tap add button
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.text('Add Domain'), findsOneWidget);
      await tester.enterText(find.byType(TextField), '.com');
      await tester.pumpAndSettle();
      // toggle Switch
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(find.text('Invalid domain'), findsNothing);
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Show whitelist domains screen
      expect(find.text('Domain added successfully'), findsWidgets);
      expect(find.byType(DomainsScreen), findsOneWidget);
    });

    testWidgets('should show error loading domains list', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      Command.globalExceptionHandler = (_, _) {};

      addTearDown(() {
        Command.globalExceptionHandler = null;
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final domainRepo = FakeDomainRepository()..shouldFail = true;
      domainsViewModel = DomainsViewModel(domainRepository: domainRepo);
      groupsViewModel = GroupsViewModel(
        groupRepository: FakeGroupRepository(),
      );

      await tester.pumpWidget(buildApp());

      // Trigger loads using run() instead of runAsync() so the uncaught
      // Failure from the repository does not propagate as an unhandled
      // Future error in the test zone.
      domainsViewModel.loadDomains.run();
      groupsViewModel.loadGroups.run();

      for (var i = 0; i < 4; i++) {
        await tester.pump(const Duration(milliseconds: 1));
      }

      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text("Domains list couldn't be loaded"), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets('should show loading message', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Use a slow repository so we can observe the loading indicator.
      final domainRepo = _SlowFakeDomainRepository();
      domainsViewModel = DomainsViewModel(domainRepository: domainRepo);
      groupsViewModel = GroupsViewModel(
        groupRepository: FakeGroupRepository(),
      );

      await tester.pumpWidget(buildApp());

      // Trigger loads
      // ignore: unawaited_futures
      groupsViewModel.loadGroups.runAsync();
      // ignore: unawaited_futures
      domainsViewModel.loadDomains.runAsync();

      // Pump once with a small duration to let Command enter running state
      await tester.pump(const Duration(milliseconds: 1));

      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('Loading domains...'), findsOneWidget);

      // Let the delayed future complete (150ms delay in the slow repo)
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pump(const Duration(milliseconds: 1));
      await tester.pumpAndSettle();
    });

    testWidgets('should edit a domain status', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should edit a domain groups', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
      expect(find.text('Edit groups'), findsOneWidget);

      await tester.tap(find.byType(CheckboxListTile).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should edit a domain comment', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.text('Edit comment'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'test123');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should show error snack bar', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      Command.globalExceptionHandler = (_, _) {};

      addTearDown(() {
        Command.globalExceptionHandler = null;
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      // Use a repository that succeeds on load but will fail on update
      final domainRepo = FakeDomainRepository();
      createViewModels(domainRepository: domainRepo);
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      // Now make the repository fail before triggering the update
      domainRepo.shouldFail = true;

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Failed to update the Domain'), findsOneWidget);
    });

    testWidgets('should show edit domain groups modal (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Groups'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.byType(LabeledMultiSelectTile), findsOneWidget);
      expect(find.text('Edit groups'), findsOneWidget);

      await tester.tap(find.byType(CheckboxListTile).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });

    testWidgets('should show edit domain comment modal (tablet)', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(2560, 1600);
      tester.view.devicePixelRatio = 1.6;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      createViewModels();
      await pumpAndLoad(tester);

      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      await tester.tap(find.text('Comment'));
      await tester.pumpAndSettle();

      expect(find.byType(EditDomainModal), findsOneWidget);
      expect(find.text('Edit comment'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'test123');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Domain updated successfully'), findsOneWidget);
    });
  });

  group('DomainsScreen Widget Tests (v5)', () {
    late AppConfigViewModel appConfigViewModel;
    late FakeServersViewModel serversViewModel;
    late DomainsViewModel domainsViewModel;
    late GroupsViewModel groupsViewModel;

    setUp(() async {
      final appConfigRepo = FakeAppConfigRepository()
        ..importantInfoReadenValue = 1;
      appConfigViewModel = AppConfigViewModel(appConfigRepo);
      appConfigViewModel.saveFromDb(appConfigRepo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV5
        ..selectedServerEnabled = true
        ..serversList = [_serverV5];

      domainsViewModel = DomainsViewModel(
        domainRepository: FakeDomainRepository(),
      );
      groupsViewModel = GroupsViewModel(
        groupRepository: FakeGroupRepository(),
      );
    });

    testWidgets('should not be editable with v5', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildTestApp(
          const DomainsScreen(),
          appConfigViewModel: appConfigViewModel,
          serversViewModel: serversViewModel,
          domainsViewModel: domainsViewModel,
          groupsViewModel: groupsViewModel,
        ),
      );

      await _pumpAndLoad(tester, domainsViewModel, groupsViewModel);
      await tester.pumpAndSettle();

      expect(find.byType(DomainsScreen), findsOneWidget);
      expect(find.text('example.com'), findsOneWidget);
      await tester.tap(find.text('example.com'));
      await tester.pumpAndSettle();

      expect(find.byType(DomainDetailsScreen), findsOneWidget);
      expect(find.text('Groups'), findsNothing);
      expect(find.byType(Switch), findsNothing);
      expect(find.byIcon(Icons.edit_rounded), findsNothing);
    });
  });
}

/// A fake domain repository that introduces a delay, allowing tests
/// to observe the loading state.
class _SlowFakeDomainRepository extends FakeDomainRepository {
  @override
  Future<Result<DomainLists>> fetchAllDomains() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return super.fetchAllDomains();
  }
}
