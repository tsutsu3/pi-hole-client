import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/fakes/repositories/local/fake_server_repository.dart';
import './servers_provider_test.mocks.dart';

@GenerateMocks([AppConfigProvider])
void main() async {
  await dotenv.load();

  group('ServersProvider', () {
    late ServersProvider serversProvider;
    late FakeServerRepository repository;
    late MockAppConfigProvider mockAppConfigProvider;
    late bool listenerCalled;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
      ignoreCertificateErrors: false,
    );

    setUp(() {
      repository = FakeServerRepository();
      serversProvider = ServersProvider(repository);

      mockAppConfigProvider = MockAppConfigProvider();
      when(mockAppConfigProvider.setSelectedTab(any)).thenReturn(null);

      listenerCalled = false;
      serversProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(serversProvider.getServersList, []);
      expect(serversProvider.selectedServer, null);
      expect(serversProvider.selectedApiGateway, null);
      expect(serversProvider.numShown, 0);
      expect(serversProvider.queryStatuses, []);
      expect(serversProvider.connectingServer, null);
      expect(listenerCalled, false);
    });

    test('update sets AppConfigProvider', () {
      serversProvider.update(mockAppConfigProvider);
      expect(serversProvider.appConfigProvider, mockAppConfigProvider);
      expect(listenerCalled, false);
    });

    test('createApiGateway creates the api gateways', () {
      final result = serversProvider.createApiGateway(server);
      expect(result?.server.alias, server.alias);
      expect(result?.server.address, server.address);
      expect(result?.server.apiVersion, server.apiVersion);
      expect(result?.server.allowSelfSignedCert, server.allowSelfSignedCert);
      expect(result?.server.defaultServer, server.defaultServer);
      expect(listenerCalled, false);
    });

    test('loadApiGateway loads the api gateways', () {
      final result = serversProvider.loadApiGateway(server);
      expect(result!.server, ApiGatewayV6(server).server);
      expect(listenerCalled, false);
    });

    test('getQueryStatuses returns the correct query statuses', () {
      serversProvider.addServer(server);
      serversProvider.setselectedServer(server: server);

      final result = serversProvider.getQueryStatus('2');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    test('findQueryStatus returns the correct query statuses', () {
      serversProvider.addServer(server);
      serversProvider.setselectedServer(server: server);

      final result = serversProvider.findQueryStatus('GRAVITY');
      expect(result!.key, queryStatusesV6[1].key);
      expect(listenerCalled, true);
    });

    test('addServer adds a server and notifies listeners', () async {
      final result = await serversProvider.addServer(server);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), true);
      expect(listenerCalled, true);
    });

    test(
      'addServer adds a server (defaultServer: on) option and notifies listeners',
      () async {
        final server2 = Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: true,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        );
        final result = await serversProvider.addServer(server2);

        expect(result, true);
        expect(serversProvider.getServersList.contains(server2), true);
        expect(listenerCalled, true);
      },
    );

    test('editServer edits a server and notifies listeners', () async {
      await serversProvider.addServer(server);
      final updatedServer = server.copyWith(alias: 'Updated Server');

      final result = await serversProvider.editServer(updatedServer);

      expect(result, true);
      expect(serversProvider.getServersList.contains(updatedServer), true);
      expect(listenerCalled, true);
    });

    test('removeServer removes a server and notifies listeners', () async {
      serversProvider.getServersList.add(server);

      final result = await serversProvider.removeServer(server.address);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), false);
      expect(listenerCalled, true);
    });

    test(
      'setDefaultServer sets a default server and notifies listeners',
      () async {
        serversProvider.getServersList.add(server);

        final result = await serversProvider.setDefaultServer(server);

        expect(result, true);
        expect(serversProvider.getServersList[0].defaultServer, true);
        expect(listenerCalled, true);
      },
    );

    test('saveFromDb saves the servers from the database', () async {
      final servers = [
        ServerDbData(
          address: server.address,
          alias: server.alias,
          token: await server.sm.token.getOrNull(),
          isDefaultServer: 1,
          apiVersion: server.apiVersion,
          sid: 'sid01',
          allowSelfSignedCert: server.allowSelfSignedCert,
          ignoreCertificateErrors: server.ignoreCertificateErrors,
          pinnedCertificateSha256: null,
        ),
      ];

      await serversProvider.saveFromDb(servers);

      expect(serversProvider.getServersList.length, 1);
      expect(serversProvider.getServersList[0].alias, server.alias);
      expect(serversProvider.selectedServer!.alias, server.alias);
      expect(listenerCalled, true);
    });

    test('checkUrlExists returns the correct result', () async {
      await serversProvider.addServer(server);

      final result = await serversProvider.checkUrlExists(server.address);

      expect(result, {'result': 'success', 'exists': true});
      expect(listenerCalled, true);
    });

    test('updateselectedServerStatus updates the selected server', () {
      serversProvider.addServer(server);
      serversProvider.setselectedServer(server: server);

      serversProvider.updateselectedServerStatus(true);

      expect(serversProvider.selectedServer!.enabled, true);
      expect(listenerCalled, true);
    });

    test('deleteDbData deletes the servers data', () async {
      await serversProvider.addServer(server);
      serversProvider.setselectedServer(server: server);

      final result = await serversProvider.deleteDbData();

      expect(result, true);
      expect(serversProvider.getServersList, []);
      expect(serversProvider.selectedServer, null);
      expect(listenerCalled, true);
    });

    test(
      'resetSelectedServer resets the selected server and notifies listeners',
      () async {
        serversProvider.setselectedServer(server: server);

        final result = await serversProvider.resetSelectedServer();

        expect(result, true);
        expect(serversProvider.selectedServer, null);
        expect(listenerCalled, true);
      },
    );

    test('setConnectingServer sets the connecting server', () async {
      serversProvider.setConnectingServer(server);

      expect(serversProvider.connectingServer, server);
      expect(listenerCalled, false);
    });

    test('clearConnectingServer clears the connecting server', () {
      serversProvider.setConnectingServer(server);
      serversProvider.clearConnectingServer();

      expect(serversProvider.connectingServer, null);
      expect(listenerCalled, false);
    });
  });
}
