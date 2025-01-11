import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/repository/database.dart';
import './servers_provider_test.mocks.dart';

@GenerateMocks([DatabaseRepository, AppConfigProvider])
void main() {
  group('ServersProvider', () {
    late ServersProvider serversProvider;
    late MockDatabaseRepository mockDatabaseRepository;
    late MockAppConfigProvider mockAppConfigProvider;
    late bool listenerCalled;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
    );

    setUp(() {
      mockDatabaseRepository = MockDatabaseRepository();
      mockAppConfigProvider = MockAppConfigProvider();

      when(mockAppConfigProvider.setSelectedTab(any)).thenReturn(null);

      when(mockDatabaseRepository.saveServerQuery(any))
          .thenAnswer((_) async => true);
      when(mockDatabaseRepository.editServerQuery(any))
          .thenAnswer((_) async => true);
      when(mockDatabaseRepository.removeServerQuery(any))
          .thenAnswer((_) async => true);
      when(mockDatabaseRepository.setDefaultServerQuery(any))
          .thenAnswer((_) async => true);
      when(mockDatabaseRepository.deleteServersDataQuery())
          .thenAnswer((_) async => true);
      when(mockDatabaseRepository.checkUrlExistsQuery(any))
          .thenAnswer((_) async => {'result': 'success', 'exists': true});

      serversProvider = ServersProvider(mockDatabaseRepository);

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
      expect(listenerCalled, false);
    });

    test('update sets AppConfigProvider', () {
      serversProvider.update(mockAppConfigProvider);
      expect(serversProvider.appConfigProvider, mockAppConfigProvider);
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
      when(mockDatabaseRepository.saveServerQuery(any))
          .thenAnswer((_) async => true);

      final result = await serversProvider.addServer(server);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), true);
      expect(listenerCalled, true);
    });

    test('editServer edits a server and notifies listeners', () async {
      serversProvider.getServersList.add(server);
      final updatedServer = server.copyWith(alias: 'Updated Server');
      when(mockDatabaseRepository.editServerQuery(updatedServer))
          .thenAnswer((_) async => true);

      final result = await serversProvider.editServer(updatedServer);

      expect(result, true);
      expect(serversProvider.getServersList.contains(updatedServer), true);
      expect(listenerCalled, true);
    });

    test('removeServer removes a server and notifies listeners', () async {
      serversProvider.getServersList.add(server);
      when(mockDatabaseRepository.removeServerQuery(server.address))
          .thenAnswer((_) async => true);

      final result = await serversProvider.removeServer(server.address);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), false);
      expect(listenerCalled, true);
    });

    test(
      'setDefaultServer sets a default server and notifies listeners',
      () async {
        serversProvider.getServersList.add(server);
        when(mockDatabaseRepository.setDefaultServerQuery(server.address))
            .thenAnswer((_) async => true);

        final result = await serversProvider.setDefaultServer(server);

        expect(result, true);
        expect(
          serversProvider.getServersList[0].defaultServer,
          true,
        );
        expect(listenerCalled, true);
      },
    );

    test('saveFromDb saves the servers from the database', () async {
      final servers = [
        ServerDbData(
          address: server.address,
          alias: server.alias,
          token: await server.sm.token,
          isDefaultServer: 1,
          apiVersion: server.apiVersion,
          basicAuthUser: server.basicAuthUser,
          basicAuthPassword: server.basicAuthPassword,
          sid: 'sid01',
        ),
      ];

      await serversProvider.saveFromDb(servers);

      expect(serversProvider.getServersList.length, 1);
      expect(serversProvider.getServersList[0].alias, server.alias);
      expect(serversProvider.selectedServer!.alias, server.alias);
      expect(listenerCalled, true);
    });

    test('checkUrlExists returns the correct result', () async {
      serversProvider.addServer(server);

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
      serversProvider.addServer(server);
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
  });
}
