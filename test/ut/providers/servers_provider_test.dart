import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
    });

    test('initial values are correct', () {
      expect(serversProvider.getServersList, []);
      expect(serversProvider.selectedServer, null);
    });

    test('update sets AppConfigProvider', () {
      serversProvider.update(mockAppConfigProvider);
      expect(serversProvider.appConfigProvider, mockAppConfigProvider);
    });

    test('addServer adds a server and notifies listeners', () async {
      when(mockDatabaseRepository.saveServerQuery(server))
          .thenAnswer((_) async => true);

      final result = await serversProvider.addServer(server);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), true);
    });

    test('editServer edits a server and notifies listeners', () async {
      serversProvider.getServersList.add(server);
      final updatedServer = server.copyWith(alias: 'Updated Server');
      when(mockDatabaseRepository.editServerQuery(updatedServer))
          .thenAnswer((_) async => true);

      final result = await serversProvider.editServer(updatedServer);

      expect(result, true);
      expect(serversProvider.getServersList.contains(updatedServer), true);
    });

    test('removeServer removes a server and notifies listeners', () async {
      serversProvider.getServersList.add(server);
      when(mockDatabaseRepository.removeServerQuery(server.address))
          .thenAnswer((_) async => true);

      final result = await serversProvider.removeServer(server.address);

      expect(result, true);
      expect(serversProvider.getServersList.contains(server), false);
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
      },
    );

    test(
      'resetSelectedServer resets the selected server and notifies listeners',
      () async {
        serversProvider.setselectedServer(server: server);

        final result = await serversProvider.resetSelectedServer();

        expect(result, true);
        expect(serversProvider.selectedServer, null);
      },
    );
  });
}
