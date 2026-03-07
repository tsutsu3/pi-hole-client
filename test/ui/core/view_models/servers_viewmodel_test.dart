import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/query_types.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';

import '../../../../testing/fakes/repositories/local/fake_server_repository.dart';

void main() async {
  await dotenv.load();

  group('ServersViewModel', () {
    late ServersViewModel serversViewModel;
    late FakeServerRepository repository;
    late bool listenerCalled;

    const server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    setUp(() {
      repository = FakeServerRepository();
      serversViewModel = ServersViewModel(repository);

      listenerCalled = false;
      serversViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(serversViewModel.getServersList, []);
      expect(serversViewModel.selectedServer, null);
      expect(serversViewModel.numShown, 0);
      expect(serversViewModel.queryStatuses, []);
      expect(serversViewModel.connectingServer, null);
      expect(listenerCalled, false);
    });

    test('update stores the onServerSelected callback', () {
      var callbackCalled = false;
      serversViewModel.update(() {
        callbackCalled = true;
      });
      expect(listenerCalled, false);
      serversViewModel.setselectedServer(server: server, toHomeTab: true);
      expect(callbackCalled, true);
    });

    test('getQueryStatuses returns the correct query statuses', () {
      serversViewModel.addServer(server);
      serversViewModel.setselectedServer(server: server);

      final result = serversViewModel.getQueryStatus('2');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    test('findQueryStatus returns the correct query statuses', () {
      serversViewModel.addServer(server);
      serversViewModel.setselectedServer(server: server);

      final result = serversViewModel.findQueryStatus('GRAVITY');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    test('addServer adds a server and notifies listeners', () async {
      final result = await serversViewModel.addServer(server);

      expect(result, true);
      expect(serversViewModel.getServersList.contains(server), true);
      expect(listenerCalled, true);
    });

    test(
      'addServer adds a server (defaultServer: on) option and notifies listeners',
      () async {
        const server2 = Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: true,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );
        final result = await serversViewModel.addServer(server2);

        expect(result, true);
        expect(serversViewModel.getServersList.contains(server2), true);
        expect(listenerCalled, true);
      },
    );

    test('editServer edits a server and notifies listeners', () async {
      await serversViewModel.addServer(server);
      final updatedServer = server.copyWith(alias: 'Updated Server');

      final result = await serversViewModel.editServer(updatedServer);

      expect(result, true);
      expect(serversViewModel.getServersList.contains(updatedServer), true);
      expect(listenerCalled, true);
    });

    test('removeServer removes a server and notifies listeners', () async {
      serversViewModel.getServersList.add(server);

      final result = await serversViewModel.removeServer(server.address);

      expect(result, true);
      expect(serversViewModel.getServersList.contains(server), false);
      expect(listenerCalled, true);
    });

    test(
      'setDefaultServer sets a default server and notifies listeners',
      () async {
        serversViewModel.getServersList.add(server);

        final result = await serversViewModel.setDefaultServer(server);

        expect(result, true);
        expect(serversViewModel.getServersList[0].defaultServer, true);
        expect(listenerCalled, true);
      },
    );

    test('saveFromDb saves the servers from the database', () async {
      final servers = [
        Server(
          address: server.address,
          alias: server.alias,
          defaultServer: true,
          apiVersion: server.apiVersion,
          allowSelfSignedCert: server.allowSelfSignedCert,
          ignoreCertificateErrors: server.ignoreCertificateErrors,
          pinnedCertificateSha256: null,
        ),
      ];

      await serversViewModel.saveFromDb(servers);

      expect(serversViewModel.getServersList.length, 1);
      expect(serversViewModel.getServersList[0].alias, server.alias);
      expect(serversViewModel.selectedServer!.alias, server.alias);
      expect(listenerCalled, true);
    });

    test('checkUrlExists returns the correct result', () async {
      await serversViewModel.addServer(server);

      final result = await serversViewModel.checkUrlExists(server.address);

      expect(result, {'result': 'success', 'exists': true});
      expect(listenerCalled, true);
    });

    test('updateselectedServerStatus updates the selected server', () {
      serversViewModel.addServer(server);
      serversViewModel.setselectedServer(server: server);

      serversViewModel.updateselectedServerStatus(true);

      expect(serversViewModel.selectedServerEnabled, true);
      expect(listenerCalled, true);
    });

    test('deleteDbData deletes the servers data', () async {
      await serversViewModel.addServer(server);
      serversViewModel.setselectedServer(server: server);

      final result = await serversViewModel.deleteDbData();

      expect(result, true);
      expect(serversViewModel.getServersList, []);
      expect(serversViewModel.selectedServer, null);
      expect(listenerCalled, true);
    });

    test(
      'resetSelectedServer resets the selected server and notifies listeners',
      () async {
        serversViewModel.setselectedServer(server: server);

        final result = await serversViewModel.resetSelectedServer();

        expect(result, true);
        expect(serversViewModel.selectedServer, null);
        expect(listenerCalled, true);
      },
    );

    test('setConnectingServer sets the connecting server', () async {
      serversViewModel.setConnectingServer(server);

      expect(serversViewModel.connectingServer, server);
      expect(listenerCalled, false);
    });

    test('clearConnectingServer clears the connecting server', () {
      serversViewModel.setConnectingServer(server);
      serversViewModel.clearConnectingServer();

      expect(serversViewModel.connectingServer, null);
      expect(listenerCalled, false);
    });
  });
}
