import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network_screen/viewmodel/network_viewmodel.dart';

import '../../../../../../../testing/fakes/repositories/api/fake_ftl_repository.dart';
import '../../../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../../../../../testing/models/v6/ftl.dart';
import '../../../../../../../testing/models/v6/network.dart';

void main() {
  group('NetworkViewModel', () {
    late FakeNetworkRepository fakeNetworkRepository;
    late FakeFtlRepository fakeFtlRepository;
    late NetworkViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeNetworkRepository = FakeNetworkRepository();
      fakeFtlRepository = FakeFtlRepository();
      viewModel = NetworkViewModel(
        networkRepository: fakeNetworkRepository,
        ftlRepository: fakeFtlRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadDevices success populates devices and client IP', () async {
      await viewModel.loadDevices.runAsync();

      expect(viewModel.loadDevices.value.devices, equals(kRepoFetchDevices));
      expect(viewModel.loadDevices.value.devices.length, 2);
      expect(
        viewModel.loadDevices.value.currentClientIp,
        equals(kRepoFetchFtlClient.addr),
      );
    });

    test('loadDevices failure sets error', () async {
      fakeNetworkRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadDevices.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadDevices.run();
      await completer.future;

      expect(viewModel.loadDevices.errors.value, isNotNull);
    });

    test('deleteDevice success reloads devices', () async {
      await viewModel.loadDevices.runAsync();
      expect(fakeNetworkRepository.fetchDevicesCallCount, 1);

      await viewModel.deleteDevice.runAsync(1);

      // fetchDevices called again by _deleteDevice's reload
      expect(fakeNetworkRepository.fetchDevicesCallCount, 2);
      expect(viewModel.loadDevices.value.devices, equals(kRepoFetchDevices));
    });

    test('deleteDevice failure sets error', () async {
      await viewModel.loadDevices.runAsync();

      fakeNetworkRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.deleteDevice.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.deleteDevice.run(1);
      await completer.future;

      expect(viewModel.deleteDevice.errors.value, isNotNull);
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadDevices.runAsync();

      expect(viewModel.loadDevices.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadDevices.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadDevices.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
