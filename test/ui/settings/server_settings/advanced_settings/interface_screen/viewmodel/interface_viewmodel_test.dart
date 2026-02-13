import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface_screen/viewmodel/interface_viewmodel.dart';

import '../../../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../../../../../testing/models/v6/network.dart';

void main() {
  group('InterfaceViewModel', () {
    late FakeNetworkRepository fakeNetworkRepository;
    late InterfaceViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeNetworkRepository = FakeNetworkRepository();
      viewModel = InterfaceViewModel(
        networkRepository: fakeNetworkRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadInterfaces success populates interfaces', () async {
      await viewModel.loadInterfaces.runAsync();

      expect(
        viewModel.loadInterfaces.value,
        equals(kRepoFetchGatewaysDetailed.interfaces),
      );
      expect(viewModel.loadInterfaces.value.length, 1);
      expect(viewModel.loadInterfaces.value.first.name, 'eth0');
    });

    test('loadInterfaces failure sets error', () async {
      fakeNetworkRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadInterfaces.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadInterfaces.run();
      await completer.future;

      expect(viewModel.loadInterfaces.errors.value, isNotNull);
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadInterfaces.runAsync();

      expect(viewModel.loadInterfaces.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadInterfaces.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadInterfaces.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
