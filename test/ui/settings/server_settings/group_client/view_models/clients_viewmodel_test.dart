import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/clients_viewmodel.dart';

import '../../../../../../testing/fakes/repositories/api/fake_client_repository.dart';
import '../../../../../../testing/fakes/repositories/api/fake_network_repository.dart';

void main() {
  group('ClientsViewModel', () {
    late bool listenerCalled;
    late ClientsViewModel viewModel;
    late FakeClientRepository fakeClientRepository;
    late FakeNetworkRepository fakeNetworkRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeClientRepository = FakeClientRepository();
      fakeNetworkRepository = FakeNetworkRepository();
      viewModel = ClientsViewModel(
        clientRepository: fakeClientRepository,
        networkRepository: fakeNetworkRepository,
      );
      listenerCalled = false;
      viewModel.addListener(() {
        listenerCalled = true;
      });
    });

    tearDown(() {
      viewModel.dispose();
      Command.globalExceptionHandler = null;
    });

    test('initial values are correct', () {
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(viewModel.clients, []);
      expect(viewModel.filteredClients, []);
      expect(viewModel.searchTerm, '');
      expect(viewModel.searchMode, false);
      expect(viewModel.deviceOptions, []);
      expect(viewModel.ipToMac, <String, String>{});
      expect(viewModel.ipToHostname, <String, String>{});
      expect(viewModel.macToIp, <String, String>{});
      expect(listenerCalled, false);
    });

    test('loadDevices fills device options and lookups', () async {
      await viewModel.loadDevices.runAsync();

      expect(fakeNetworkRepository.fetchDevicesCallCount, 1);
      expect(viewModel.deviceOptions.map((o) => o.ip), [
        '192.168.1.51',
        '192.168.1.52',
        '192.168.1.62',
      ]);
      expect(viewModel.ipToMac['192.168.1.51'], '00:11:22:33:44:55');
      expect(viewModel.ipToHostname['192.168.1.52'], 'ubuntu-server');
      expect(viewModel.macToIp['00:11:22:33:44:xx'], '192.168.1.52');
      expect(listenerCalled, true);
    });

    test('loadDevices failure sets error and keeps clients', () async {
      await viewModel.loadClients.runAsync();
      fakeNetworkRepository.shouldFail = true;

      try {
        await viewModel.loadDevices.runAsync();
      } catch (_) {}

      expect(viewModel.loadDevices.errors.value, isNotNull);
      expect(viewModel.deviceOptions, []);
      expect(viewModel.clients.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('setSearchMode updates search mode', () {
      viewModel.setSearchMode(true);
      expect(viewModel.searchMode, true);
      expect(listenerCalled, true);
    });

    test('loadClients fetches clients', () async {
      await viewModel.loadClients.runAsync();
      expect(viewModel.clients.length, 2);
      expect(viewModel.filteredClients.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('loadClients sets error on failure', () async {
      fakeClientRepository.shouldFail = true;
      try {
        await viewModel.loadClients.runAsync();
      } catch (_) {}
      expect(viewModel.loadingStatus, LoadStatus.error);
      expect(listenerCalled, true);
    });

    test('onSearch filters clients by client id', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      viewModel.onSearch('192.168');
      expect(viewModel.filteredClients.length, 1);
      expect(viewModel.filteredClients.first.client, '192.168.1.100');
      expect(listenerCalled, true);
    });

    test('onSearch filters clients by name', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      viewModel.onSearch('laptop');
      expect(viewModel.filteredClients.length, 1);
      expect(viewModel.filteredClients.first.name, 'laptop');
      expect(listenerCalled, true);
    });

    test('onSearch filters clients by comment', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      viewModel.onSearch('Main desktop');
      expect(viewModel.filteredClients.length, 1);
      expect(viewModel.filteredClients.first.id, 1);
      expect(listenerCalled, true);
    });

    test('onSearch is case-insensitive', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      viewModel.onSearch('DESKTOP');
      expect(viewModel.filteredClients.length, 1);
      expect(listenerCalled, true);
    });

    test(
      'onSearch filters clients by MAC address via ipToMac lookup',
      () async {
        fakeNetworkRepository.devices = [
          Device(
            id: 1,
            hwaddr: 'aa:bb:cc:dd:ee:ff',
            interface: 'eth0',
            firstSeen: DateTime(2024),
            lastQuery: DateTime(2024),
            numQueries: 1,
            ips: [
              DeviceIp(
                ip: '192.168.1.100',
                lastSeen: DateTime(2024),
                nameUpdated: DateTime(2024),
              ),
            ],
          ),
        ];
        await viewModel.loadClients.runAsync();
        await viewModel.loadDevices.runAsync();
        listenerCalled = false;

        viewModel.onSearch('aa:bb:cc');
        expect(viewModel.filteredClients.length, 1);
        expect(viewModel.filteredClients.first.client, '192.168.1.100');
        expect(listenerCalled, true);
      },
    );

    test(
      'onSearch filters clients by group name via groupNames lookup',
      () async {
        await viewModel.loadClients.runAsync();
        viewModel.updateGroupLookup({0: 'Default', 5: 'test'});
        listenerCalled = false;

        viewModel.onSearch('test');
        // Both clients match: client 1 has name 'desktop' (no match) but
        // client 2 has group 5 => 'test' (matches)
        // client 2 also has name 'laptop' (no match on 'test')
        // Actually, client 2 has groups [0, 5], group 5 name = 'test'
        expect(viewModel.filteredClients.length, 1);
        expect(viewModel.filteredClients.first.id, 2);
        expect(listenerCalled, true);
      },
    );

    test('deleteClient removes client from the list', () async {
      await viewModel.loadClients.runAsync();
      final client = viewModel.clients.first;
      listenerCalled = false;

      await viewModel.deleteClient.runAsync(client);
      expect(viewModel.clients.where((c) => c.id == client.id), isEmpty);
      expect(listenerCalled, true);
    });

    test('addClient appends client to list without reloading', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      await viewModel.addClient.runAsync((
        client: '10.0.0.1',
        comment: 'new client',
        groups: [0],
      ));

      expect(viewModel.clients.length, 3);
      expect(viewModel.clients.any((c) => c.client == '10.0.0.1'), isTrue);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('updateClient updates client in list without reloading', () async {
      await viewModel.loadClients.runAsync();
      listenerCalled = false;

      await viewModel.updateClient.runAsync((
        client: '192.168.1.100',
        comment: 'updated comment',
        groups: [0, 5],
      ));

      // FakeClientRepository.updateClient returns id:1 with the new values
      final updated = viewModel.clients.firstWhere((c) => c.id == 1);
      expect(updated.comment, 'updated comment');
      expect(updated.groups, [0, 5]);
      expect(viewModel.clients.length, 2);
      expect(viewModel.loadingStatus, LoadStatus.loaded);
      expect(listenerCalled, true);
    });

    test('deleteClient sets error on failure', () async {
      await viewModel.loadClients.runAsync();
      final client = viewModel.clients.first;

      fakeClientRepository.shouldFail = true;
      listenerCalled = false;
      try {
        await viewModel.deleteClient.runAsync(client);
      } catch (_) {}

      expect(viewModel.deleteClient.errors.value, isNotNull);
      expect(listenerCalled, true);
    });

    test('updateGroupLookup does not notify when unchanged', () async {
      await viewModel.loadClients.runAsync();
      viewModel.updateGroupLookup({0: 'Default'});
      listenerCalled = false;

      viewModel.updateGroupLookup({0: 'Default'});
      expect(listenerCalled, false);
    });
  });
}
