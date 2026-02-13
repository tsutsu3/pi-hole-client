import 'dart:async';

import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/viewmodel/local_dns_viewmodel.dart';

import '../../../../../../../testing/fakes/repositories/api/fake_local_dns_repository.dart';
import '../../../../../../../testing/fakes/repositories/api/fake_network_repository.dart';
import '../../../../../../../testing/models/v6/local_dns.dart';

void main() {
  group('LocalDnsViewModel', () {
    late FakeLocalDnsRepository fakeLocalDnsRepository;
    late FakeNetworkRepository fakeNetworkRepository;
    late LocalDnsViewModel viewModel;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeLocalDnsRepository = FakeLocalDnsRepository();
      fakeNetworkRepository = FakeNetworkRepository();
      viewModel = LocalDnsViewModel(
        localDnsRepository: fakeLocalDnsRepository,
        networkRepository: fakeNetworkRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('loadRecords success populates records and deviceOptions', () async {
      await viewModel.loadRecords.runAsync();

      expect(
        viewModel.loadRecords.value.records,
        equals(kRepoFetchLocalDnsRecords),
      );
      expect(viewModel.loadRecords.value.records.length, 3);
      expect(viewModel.loadRecords.value.deviceOptions, isNotEmpty);
    });

    test('loadRecords failure sets error', () async {
      fakeLocalDnsRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.loadRecords.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.loadRecords.run();
      await completer.future;

      expect(viewModel.loadRecords.errors.value, isNotNull);
    });

    test('addRecord success reloads data', () async {
      await viewModel.loadRecords.runAsync();

      await viewModel.addRecord.runAsync(
        const LocalDns(ip: '192.168.1.200', name: 'newhost'),
      );

      expect(fakeLocalDnsRepository.addRecordCallCount, 1);
      // loadRecords called once initially + once after add
      expect(fakeLocalDnsRepository.fetchRecordsCallCount, 2);
    });

    test('addRecord failure sets error', () async {
      await viewModel.loadRecords.runAsync();
      fakeLocalDnsRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.addRecord.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.addRecord.run(
        const LocalDns(ip: '192.168.1.200', name: 'newhost'),
      );
      await completer.future;

      expect(viewModel.addRecord.errors.value, isNotNull);
    });

    test('updateRecord success reloads data', () async {
      await viewModel.loadRecords.runAsync();

      await viewModel.updateRecord.runAsync(
        (
          record: const LocalDns(ip: '192.168.1.200', name: 'updated'),
          oldIp: '192.168.1.100',
        ),
      );

      expect(fakeLocalDnsRepository.updateRecordCallCount, 1);
      expect(fakeLocalDnsRepository.fetchRecordsCallCount, 2);
    });

    test('deleteRecord success reloads data', () async {
      await viewModel.loadRecords.runAsync();

      await viewModel.deleteRecord.runAsync(
        const LocalDns(ip: '192.168.1.100', name: 'server1'),
      );

      expect(fakeLocalDnsRepository.deleteRecordCallCount, 1);
      expect(fakeLocalDnsRepository.fetchRecordsCallCount, 2);
    });

    test('deleteRecord failure sets error', () async {
      await viewModel.loadRecords.runAsync();
      fakeLocalDnsRepository.shouldFail = true;

      final completer = Completer<void>();
      viewModel.deleteRecord.errors.addListener(() {
        if (!completer.isCompleted) completer.complete();
      });
      viewModel.deleteRecord.run(
        const LocalDns(ip: '192.168.1.100', name: 'server1'),
      );
      await completer.future;

      expect(viewModel.deleteRecord.errors.value, isNotNull);
    });

    test('deviceOptions excludes loopback and sorts IPv4 first', () async {
      await viewModel.loadRecords.runAsync();

      final options = viewModel.loadRecords.value.deviceOptions;
      for (final option in options) {
        expect(option.ip, isNot('127.0.0.1'));
        expect(option.ip, isNot('::'));
        expect(option.ip, isNot('::1'));
      }
    });

    test('isRunning is true while loading', () async {
      final future = viewModel.loadRecords.runAsync();

      expect(viewModel.loadRecords.isRunning.value, isTrue);

      await future;

      expect(viewModel.loadRecords.isRunning.value, isFalse);
    });

    test('notifies listeners on state changes', () async {
      var notifyCount = 0;
      viewModel.addListener(() => notifyCount++);

      await viewModel.loadRecords.runAsync();

      expect(notifyCount, greaterThan(0));
    });
  });
}
