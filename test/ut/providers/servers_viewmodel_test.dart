import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import '../../../testing/fakes/repositories/local/fake_server_repository.dart';
import './servers_viewmodel_test.mocks.dart';

@GenerateMocks([AppConfigViewModel])
void main() async {
  await dotenv.load();

  group('ServersViewModel', () {
    late ServersViewModel serversViewModel;
    late FakeServerRepository repository;
    late MockAppConfigViewModel mockAppConfigViewModel;
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
      serversViewModel = ServersViewModel(repository);

      mockAppConfigViewModel = MockAppConfigViewModel();
      when(mockAppConfigViewModel.setSelectedTab(any)).thenReturn(null);

      listenerCalled = false;
      serversViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('initial values are correct', () {
      expect(serversViewModel.getServersList, []);
      expect(serversViewModel.selectedServer, null);
      expect(serversViewModel.selectedApiGateway, null);
      expect(serversViewModel.numShown, 0);
      expect(serversViewModel.queryStatuses, []);
      expect(serversViewModel.connectingServer, null);
      expect(listenerCalled, false);
    });

    test('update sets AppConfigViewModel', () {
      serversViewModel.update(mockAppConfigViewModel);
      expect(serversViewModel.appConfigViewModel, mockAppConfigViewModel);
      expect(listenerCalled, false);
    });

    test('createApiGateway creates the api gateways', () {
      final result = serversViewModel.createApiGateway(server);
      expect(result?.server.alias, server.alias);
      expect(result?.server.address, server.address);
      expect(result?.server.apiVersion, server.apiVersion);
      expect(result?.server.allowSelfSignedCert, server.allowSelfSignedCert);
      expect(result?.server.defaultServer, server.defaultServer);
      expect(listenerCalled, false);
    });

    test('loadApiGateway loads the api gateways', () {
      final result = serversViewModel.loadApiGateway(server);
      expect(result!.server, ApiGatewayV6(server).server);
      expect(listenerCalled, false);
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
        final server2 = Server(
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

      expect(serversViewModel.selectedServer!.enabled, true);
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
