import 'package:command_it/command_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
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
      Command.globalExceptionHandler = (_, _) {};
      repository = FakeServerRepository();
      serversViewModel = ServersViewModel(repository);

      listenerCalled = false;
      serversViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    tearDown(() {
      serversViewModel.dispose();
      Command.globalExceptionHandler = null;
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

    test('getQueryStatuses returns the correct query statuses', () async {
      await serversViewModel.addServer.runAsync(server);
      serversViewModel.setselectedServer(server: server);

      final result = serversViewModel.getQueryStatus('2');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    test('findQueryStatus returns the correct query statuses', () async {
      await serversViewModel.addServer.runAsync(server);
      serversViewModel.setselectedServer(server: server);

      final result = serversViewModel.findQueryStatus('GRAVITY');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    group('addServer Command', () {
      test('adds a server and notifies listeners', () async {
        await serversViewModel.addServer.runAsync(server);

        expect(serversViewModel.addServer.errors.value, isNull);
        expect(serversViewModel.getServersList.contains(server), true);
        expect(listenerCalled, true);
      });

      test(
        'adds a server (defaultServer: on) and notifies listeners',
        () async {
          const server2 = Server(
            address: 'http://localhost:8081',
            alias: 'test v6',
            defaultServer: true,
            apiVersion: 'v6',
            allowSelfSignedCert: true,
            ignoreCertificateErrors: false,
          );
          await serversViewModel.addServer.runAsync(server2);

          expect(serversViewModel.addServer.errors.value, isNull);
          expect(serversViewModel.getServersList.contains(server2), true);
          expect(listenerCalled, true);
        },
      );

      test('sets error on failure', () async {
        repository.shouldFailInsert = true;
        try {
          await serversViewModel.addServer.runAsync(server);
        } catch (_) {}

        expect(serversViewModel.addServer.errors.value, isNotNull);
        expect(listenerCalled, true);
      });
    });

    group('editServer Command', () {
      test('edits a server and notifies listeners', () async {
        await serversViewModel.addServer.runAsync(server);
        final updatedServer = server.copyWith(alias: 'Updated Server');

        await serversViewModel.editServer.runAsync(updatedServer);

        expect(serversViewModel.editServer.errors.value, isNull);
        expect(serversViewModel.getServersList.contains(updatedServer), true);
        expect(listenerCalled, true);
      });

      test('updates selectedServer when addresses match', () async {
        await serversViewModel.addServer.runAsync(server);
        serversViewModel.setselectedServer(server: server);

        final updatedServer = server.copyWith(alias: 'Updated Alias');
        await serversViewModel.editServer.runAsync(updatedServer);

        expect(serversViewModel.editServer.errors.value, isNull);
        expect(serversViewModel.selectedServer?.alias, 'Updated Alias');
      });

      test('with defaultServer=true sets default and notifies', () async {
        await serversViewModel.addServer.runAsync(server);
        serversViewModel.setselectedServer(server: server);

        final updatedServer = server.copyWith(defaultServer: true);
        await serversViewModel.editServer.runAsync(updatedServer);

        expect(serversViewModel.editServer.errors.value, isNull);
        expect(listenerCalled, true);
      });

      test('sets error on failure', () async {
        repository.shouldFailUpdate = true;
        try {
          await serversViewModel.editServer.runAsync(server);
        } catch (_) {}

        expect(serversViewModel.editServer.errors.value, isNotNull);
        expect(listenerCalled, true);
      });
    });

    group('removeServer Command', () {
      test('removes a server and notifies listeners', () async {
        await serversViewModel.addServer.runAsync(server);
        listenerCalled = false;

        await serversViewModel.removeServer.runAsync(server.address);

        expect(serversViewModel.removeServer.errors.value, isNull);
        expect(serversViewModel.getServersList.contains(server), false);
        expect(listenerCalled, true);
      });

      test('sets error on failure', () async {
        repository.shouldFailDelete = true;
        try {
          await serversViewModel.removeServer.runAsync(server.address);
        } catch (_) {}

        expect(serversViewModel.removeServer.errors.value, isNotNull);
        expect(listenerCalled, true);
      });
    });

    group('setDefaultServer Command', () {
      test('sets a default server and notifies listeners', () async {
        await serversViewModel.addServer.runAsync(server);
        listenerCalled = false;

        await serversViewModel.setDefaultServer.runAsync(server);

        expect(serversViewModel.setDefaultServer.errors.value, isNull);
        expect(serversViewModel.getServersList[0].defaultServer, true);
        expect(listenerCalled, true);
      });

      test('sets error on failure', () async {
        repository.shouldFailUpdateDefault = true;
        try {
          await serversViewModel.setDefaultServer.runAsync(server);
        } catch (_) {}

        expect(serversViewModel.setDefaultServer.errors.value, isNotNull);
        expect(listenerCalled, true);
      });
    });

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
      await serversViewModel.addServer.runAsync(server);

      final result = await serversViewModel.checkUrlExists(server.address);

      expect(result, {'result': 'success', 'exists': true});
      expect(listenerCalled, true);
    });

    test('updateselectedServerStatus updates the selected server', () async {
      await serversViewModel.addServer.runAsync(server);
      serversViewModel.setselectedServer(server: server);

      serversViewModel.updateselectedServerStatus(true);

      expect(serversViewModel.selectedServerEnabled, true);
      expect(listenerCalled, true);
    });

    test('deleteDbData deletes the servers data', () async {
      await serversViewModel.addServer.runAsync(server);
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

    test('setUnverifiedBannerDismissed updates and notifies listeners', () {
      serversViewModel.setUnverifiedBannerDismissed(true);

      expect(serversViewModel.unverifiedBannerDismissed, true);
      expect(listenerCalled, true);
    });

    test(
      'serversWithUnverifiedCertificates returns servers with self-signed',
      () async {
        const unverifiedServer = Server(
          address: 'https://pi.hole',
          alias: 'Unverified',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );
        await serversViewModel.addServer.runAsync(unverifiedServer);
        listenerCalled = false;

        final unverified = serversViewModel.serversWithUnverifiedCertificates;

        expect(
          unverified.any((s) => s.address == unverifiedServer.address),
          isTrue,
        );
      },
    );

    test('numShown returns non-negative value', () async {
      await serversViewModel.addServer.runAsync(server);

      expect(serversViewModel.numShown, greaterThanOrEqualTo(0));
    });

    test('addServer with default=true selects the server', () async {
      const defaultSrv = Server(
        address: 'http://localhost:9090',
        alias: 'default',
        defaultServer: true,
        apiVersion: 'v6',
        allowSelfSignedCert: false,
        ignoreCertificateErrors: false,
      );
      await serversViewModel.addServer.runAsync(defaultSrv);

      expect(
        serversViewModel.getServersList.any(
          (s) => s.address == defaultSrv.address,
        ),
        isTrue,
      );
    });

    test('update stores the onServerSelected callback (not yet invoked)', () {
      var callbackFired = false;
      serversViewModel.update(() => callbackFired = true);
      expect(callbackFired, false);
    });

    group('v5 server branches', () {
      const serverV5 = Server(
        address: 'http://localhost:9091',
        alias: 'test v5',
        defaultServer: false,
        apiVersion: 'v5',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
      );

      test('queryStatuses returns v5 list for v5 server', () async {
        await serversViewModel.addServer.runAsync(serverV5);
        serversViewModel.setselectedServer(server: serverV5);

        expect(serversViewModel.queryStatuses, queryStatusesV5);
      });

      test('numShown returns count for v5 server', () async {
        await serversViewModel.addServer.runAsync(serverV5);
        serversViewModel.setselectedServer(server: serverV5);

        expect(serversViewModel.numShown, greaterThanOrEqualTo(0));
      });

      test('getQueryStatus returns correct status for v5 server', () async {
        await serversViewModel.addServer.runAsync(serverV5);
        serversViewModel.setselectedServer(server: serverV5);

        final result = serversViewModel.getQueryStatus('1');
        expect(result?.key, queryStatusesV5[0].key);
      });

      test('findQueryStatus returns correct status for v5 server', () async {
        await serversViewModel.addServer.runAsync(serverV5);
        serversViewModel.setselectedServer(server: serverV5);

        final result = serversViewModel.findQueryStatus('1');
        expect(result?.key, queryStatusesV5[0].key);
      });
    });

    test('getQueryStatusByType returns correct status for v6 server', () async {
      await serversViewModel.addServer.runAsync(server);
      serversViewModel.setselectedServer(server: server);

      final result = serversViewModel.getQueryStatusByType(
        QueryStatusType.gravity,
      );
      expect(result, isNotNull);
    });

    test('serversWithUnverifiedCertificates includes server with empty '
        'pinnedCertificateSha256', () async {
      const serverWithEmptyPin = Server(
        address: 'https://pi.hole',
        alias: 'empty pin',
        defaultServer: false,
        apiVersion: 'v6',
        allowSelfSignedCert: true,
        ignoreCertificateErrors: false,
        pinnedCertificateSha256: '',
      );
      await serversViewModel.addServer.runAsync(serverWithEmptyPin);

      final unverified = serversViewModel.serversWithUnverifiedCertificates;
      expect(
        unverified.any((s) => s.address == serverWithEmptyPin.address),
        isTrue,
      );
    });
  });
}
