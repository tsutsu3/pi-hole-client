import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import './gravity_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('LocalDnsProvider', () {
    late LocalDnsProvider localDnsProvider;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;
    late bool listenerCalled;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
    );

    final devicesInfo = DevicesInfo(
      devices: [
        DeviceInfo(
          id: 1,
          hwaddr: '00:11:22:33:44:55',
          interface: 'eth0',
          firstSeen: DateTime.now(),
          lastQuery: DateTime.now(),
          numQueries: 10,
          ips: [
            DeviceAddress(
              ip: '192.168.1.100',
              name: 'ubuntu-server',
              lastSeen: DateTime.now(),
              nameUpdated: DateTime.now(),
            ),
          ],
          macVendor: 'Digital Data Communications Asia Co.,Ltd',
        ),
        DeviceInfo(
          id: 2,
          hwaddr: '00:11:22:33:44:66',
          interface: 'eth0',
          firstSeen: DateTime.now(),
          lastQuery: DateTime.now(),
          numQueries: 12,
          ips: [
            DeviceAddress(
              ip: '192.168.1.52',
              name: 'test',
              lastSeen: DateTime.now(),
              nameUpdated: DateTime.now(),
            ),
            DeviceAddress(
              ip: '192.168.1.62',
              lastSeen: DateTime.now(),
              nameUpdated: DateTime.now(),
            ),
          ],
          macVendor: 'test',
        ),
      ],
    );

    const deviceOptions = [
      DeviceOption(
        ip: '192.168.1.52',
        hwaddr: '00:11:22:33:44:66',
        macVendor: 'test',
      ),
      DeviceOption(
        ip: '192.168.1.62',
        hwaddr: '00:11:22:33:44:66',
        macVendor: 'test',
      ),
      DeviceOption(
        ip: '192.168.1.100',
        hwaddr: '00:11:22:33:44:55',
        macVendor: 'Digital Data Communications Asia Co.,Ltd',
      ),
    ];

    setUp(() {
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);

      localDnsProvider = LocalDnsProvider(serversProvider: mockServersProvider);
      listenerCalled = false;
      localDnsProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are set correctly', () {
      expect(localDnsProvider.localDns, []);
      expect(localDnsProvider.deviceOptions, []);
      expect(localDnsProvider.loadingStatus, LoadStatus.loading);
      expect(listenerCalled, false);
    });

    test('update() updates serversProvider and resets state', () {
      final newServersProvider = MockServersProvider();
      when(newServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      localDnsProvider.update(newServersProvider);

      expect(localDnsProvider.localDns, []);
      expect(localDnsProvider.deviceOptions, []);
      expect(localDnsProvider.loadingStatus, LoadStatus.loading);
    });

    test(
      'setLoadingStatus() updates loading status and notifies listeners',
      () {
        localDnsProvider.setLoadingStatus(LoadStatus.loaded);

        expect(localDnsProvider.loadingStatus, LoadStatus.loaded);
        expect(listenerCalled, true);
      },
    );

    test('load() updates local DNS and notifies listeners', () async {
      when(mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.2', name: 'device')],
        ),
      );
      when(mockApiGatewayV6.getDevices()).thenAnswer(
        (_) async =>
            DevicesResponse(result: APiResponseType.success, data: devicesInfo),
      );

      await localDnsProvider.load();

      expect(localDnsProvider.localDns.length, 1);
      expect(
        localDnsProvider.localDns[0],
        const LocalDns(ip: '192.168.1.2', name: 'device'),
      );
      expect(localDnsProvider.deviceOptions.length, 3);
      expect(
        localDnsProvider.deviceOptions[0],
        const DeviceOption(
          ip: '192.168.1.52',
          hwaddr: '00:11:22:33:44:66',
          macVendor: 'test',
        ),
      );
      expect(
        localDnsProvider.deviceOptions[1],
        const DeviceOption(
          ip: '192.168.1.62',
          hwaddr: '00:11:22:33:44:66',
          macVendor: 'test',
        ),
      );
      expect(
        localDnsProvider.deviceOptions[2],
        const DeviceOption(
          ip: '192.168.1.100',
          hwaddr: '00:11:22:33:44:55',
          macVendor: 'Digital Data Communications Asia Co.,Ltd',
        ),
      );
      expect(listenerCalled, true);
    });

    test('addLocalDns() updates status and notifies listeners', () async {
      when(
        mockApiGatewayV6.addLocalDns(ip: '192.168.11.3', name: 'test'),
      ).thenAnswer(
        (_) async => AddLocalDnsResponse(result: APiResponseType.success),
      );

      final resp = await localDnsProvider.addLocalDns(
        const LocalDns(ip: '192.168.11.3', name: 'test'),
      );

      expect(resp, true);
      expect(
        localDnsProvider.localDns[0],
        const LocalDns(ip: '192.168.11.3', name: 'test'),
      );
      expect(listenerCalled, true);
    });

    test('addLocalDns() failed', () async {
      when(
        mockApiGatewayV6.addLocalDns(ip: '192.168.11.3', name: 'test'),
      ).thenAnswer(
        (_) async => AddLocalDnsResponse(result: APiResponseType.error),
      );

      final resp = await localDnsProvider.addLocalDns(
        const LocalDns(ip: '192.168.11.3', name: 'test'),
      );

      expect(resp, false);
      expect(localDnsProvider.localDns.length, 0);
      expect(listenerCalled, true);
    });

    test('updateLocalDns() updates local DNS and notifies listeners', () async {
      when(mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.2', name: 'device')],
        ),
      );
      when(mockApiGatewayV6.getDevices()).thenAnswer(
        (_) async =>
            DevicesResponse(result: APiResponseType.success, data: devicesInfo),
      );
      await localDnsProvider.load();

      when(
        mockApiGatewayV6.updateLocalDns(
          ip: '192.168.1.3',
          name: 'test',
          oldIp: '192.168.1.2',
        ),
      ).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.3', name: 'test')],
        ),
      );
      final resp = await localDnsProvider.updateLocalDns(
        oldIp: '192.168.1.2',
        item: const LocalDns(ip: '192.168.1.3', name: 'test'),
      );

      expect(resp, true);
      expect(localDnsProvider.localDns.length, 1);
      expect(
        localDnsProvider.localDns[0],
        const LocalDns(ip: '192.168.1.3', name: 'test'),
      );
      expect(listenerCalled, true);
    });

    test('updateLocalDns() failed', () async {
      when(mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.2', name: 'device')],
        ),
      );
      when(mockApiGatewayV6.getDevices()).thenAnswer(
        (_) async =>
            DevicesResponse(result: APiResponseType.success, data: devicesInfo),
      );
      await localDnsProvider.load();

      when(
        mockApiGatewayV6.updateLocalDns(
          ip: '192.168.1.3',
          name: 'test',
          oldIp: '192.168.1.2',
        ),
      ).thenAnswer(
        (_) async => LocalDnsResponse(result: APiResponseType.error),
      );
      final resp = await localDnsProvider.updateLocalDns(
        oldIp: '192.168.1.2',
        item: const LocalDns(ip: '192.168.1.3', name: 'test'),
      );

      expect(resp, false);
      expect(localDnsProvider.localDns.length, 1);
      expect(
        localDnsProvider.localDns[0],
        const LocalDns(ip: '192.168.1.2', name: 'device'),
      );
      expect(listenerCalled, true);
    });

    test('removeLocalDns() loads local DNS and notifies listeners', () async {
      when(mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.2', name: 'device')],
        ),
      );
      when(mockApiGatewayV6.getDevices()).thenAnswer(
        (_) async =>
            DevicesResponse(result: APiResponseType.success, data: devicesInfo),
      );
      await localDnsProvider.load();

      when(
        mockApiGatewayV6.deleteLocalDns(ip: '192.168.1.2', name: 'device'),
      ).thenAnswer(
        (_) async => DeleteLocalDnsResponse(result: APiResponseType.success),
      );
      final resp = await localDnsProvider.removeLocalDns(
        const LocalDns(ip: '192.168.1.2', name: 'device'),
      );

      expect(resp, true);
      expect(localDnsProvider.localDns.length, 0);
      expect(listenerCalled, true);
    });

    test('removeLocalDns() failed', () async {
      when(mockApiGatewayV6.getLocalDns()).thenAnswer(
        (_) async => LocalDnsResponse(
          result: APiResponseType.success,
          data: [const LocalDns(ip: '192.168.1.2', name: 'device')],
        ),
      );
      when(mockApiGatewayV6.getDevices()).thenAnswer(
        (_) async =>
            DevicesResponse(result: APiResponseType.success, data: devicesInfo),
      );
      await localDnsProvider.load();

      when(
        mockApiGatewayV6.deleteLocalDns(ip: '192.168.1.2', name: 'device'),
      ).thenAnswer(
        (_) async => DeleteLocalDnsResponse(result: APiResponseType.error),
      );
      final resp = await localDnsProvider.removeLocalDns(
        const LocalDns(ip: '192.168.1.2', name: 'device'),
      );

      expect(resp, false);
      expect(localDnsProvider.localDns.length, 1);
      expect(
        localDnsProvider.localDns[0],
        const LocalDns(ip: '192.168.1.2', name: 'device'),
      );
      expect(listenerCalled, true);
    });

    test('devicesInfoToOptions() updates messages and notifies listeners', () {
      final resp = localDnsProvider.devicesInfoToOptions(devicesInfo.devices);

      expect(
        resp.map((e) => e.toJson()).toList(),
        deviceOptions.map((e) => e.toJson()).toList(),
      );
      expect(listenerCalled, false);
    });
  });
}
