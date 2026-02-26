import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/view_models/dhcp_viewmodel.dart';

import '../../../../../../../testing/fakes/repositories/api/fake_dhcp_repository.dart';
import '../../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../../testing/models/v6/dhcp.dart';
import '../../../../../../../testing/models/v6/ftl.dart';

void main() {
  group('DhcpViewModel', () {
    late FakeDhcpRepository fakeDhcpRepository;
    late FakeFtlRepository fakeFtlRepository;
    late DhcpViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeDhcpRepository = FakeDhcpRepository();
      fakeFtlRepository = FakeFtlRepository();
      viewModel = DhcpViewModel(
        dhcpRepository: fakeDhcpRepository,
        ftlRepository: fakeFtlRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadLeases success populates leases and client IP', () async {
      await viewModel.loadLeases.runAsync();

      expect(viewModel.data.leases, equals(kRepoFetchDhcpLeases));
      expect(viewModel.data.leases.length, 1);
      expect(
        viewModel.data.currentClientIp,
        equals(kRepoFetchFtlClient.addr),
      );
    });

    test('loadLeases failure sets error', () async {
      fakeDhcpRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadLeases.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadLeases.run();
      await completer.future;

      expect(viewModel.loadLeases.errors.value, isNotNull);
    });

    test('deleteLease success removes lease locally', () async {
      await viewModel.loadLeases.runAsync();
      expect(fakeDhcpRepository.fetchDhcpLeasesCallCount, 1);

      await viewModel.deleteLease.runAsync('192.168.2.111');

      // No re-fetch — local state update only
      expect(fakeDhcpRepository.fetchDhcpLeasesCallCount, 1);
      expect(viewModel.data.leases, isEmpty);
      expect(viewModel.data.currentClientIp, equals(kRepoFetchFtlClient.addr));
    });

    test('deleteLease failure sets error', () async {
      await viewModel.loadLeases.runAsync();

      fakeDhcpRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.deleteLease.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.deleteLease.run('192.168.2.111');
      await completer.future;

      expect(viewModel.deleteLease.errors.value, isNotNull);
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadLeases.runAsync();

      expect(viewModel.loadLeases.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadLeases.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadLeases.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
