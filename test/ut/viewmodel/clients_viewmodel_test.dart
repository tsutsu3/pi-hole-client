import 'package:command_it/command_it.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';

import '../../../testing/fakes/repositories/api/fake_client_repository.dart';

void main() {
  group('ClientsViewModel', () {
    late bool listenerCalled;
    late ClientsViewModel viewModel;
    late FakeClientRepository fakeClientRepository;

    setUp(() {
      Command.globalExceptionHandler = (_, _) {};
      fakeClientRepository = FakeClientRepository();
      viewModel = ClientsViewModel();
      viewModel.update(fakeClientRepository);
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
      expect(listenerCalled, false);
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

    test('onSearch filters clients by MAC address via ipToMac lookup',
        () async {
      await viewModel.loadClients.runAsync();
      viewModel.updateMacLookup({'192.168.1.100': 'aa:bb:cc:dd:ee:ff'});
      listenerCalled = false;

      viewModel.onSearch('aa:bb:cc');
      expect(viewModel.filteredClients.length, 1);
      expect(viewModel.filteredClients.first.client, '192.168.1.100');
      expect(listenerCalled, true);
    });

    test('onSearch filters clients by group name via groupNames lookup',
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
    });

    test('deleteClient removes client from the list', () async {
      await viewModel.loadClients.runAsync();
      final client = viewModel.clients.first;
      listenerCalled = false;

      await viewModel.deleteClient.runAsync(client);
      expect(viewModel.clients.where((c) => c.id == client.id), isEmpty);
      expect(listenerCalled, true);
    });

    test('addClient reloads clients after adding', () async {
      await viewModel.loadClients.runAsync();

      await viewModel.addClient.runAsync((
        client: '10.0.0.1',
        comment: 'new client',
        groups: [0],
      ));

      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('updateClient reloads clients after updating', () async {
      await viewModel.loadClients.runAsync();

      await viewModel.updateClient.runAsync((
        client: '192.168.1.100',
        comment: 'updated comment',
        groups: [0, 5],
      ));

      expect(viewModel.loadingStatus, LoadStatus.loaded);
    });

    test('deleteClient sets error on failure', () async {
      await viewModel.loadClients.runAsync();
      final client = viewModel.clients.first;

      fakeClientRepository.shouldFail = true;
      try {
        await viewModel.deleteClient.runAsync(client);
      } catch (_) {}

      expect(viewModel.deleteClient.errors.value, isNotNull);
    });

    test('updateMacLookup does not notify when unchanged', () async {
      await viewModel.loadClients.runAsync();
      viewModel.updateMacLookup({'192.168.1.100': 'aa:bb:cc:dd:ee:ff'});
      listenerCalled = false;

      viewModel.updateMacLookup({'192.168.1.100': 'aa:bb:cc:dd:ee:ff'});
      expect(listenerCalled, false);
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
