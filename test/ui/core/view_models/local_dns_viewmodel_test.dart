import 'package:command_it/command_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/view_models/local_dns_viewmodel.dart';
import 'package:result_dart/result_dart.dart';

import './local_dns_viewmodel_test.mocks.dart';

@GenerateMocks([LocalDnsRepository, NetworkRepository])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('LocalDnsViewModel', () {
    late LocalDnsViewModel localDnsProvider;
    late MockLocalDnsRepository mockLocalDnsRepository;
    late MockNetworkRepository mockNetworkRepository;
    late bool listenerCalled;

    final devices = [
      Device(
        id: 1,
        hwaddr: '00:11:22:33:44:55',
        interface: 'eth0',
        firstSeen: DateTime.now(),
        lastQuery: DateTime.now(),
        numQueries: 10,
        ips: [
          DeviceIp(
            ip: '192.168.1.100',
            name: 'ubuntu-server',
            lastSeen: DateTime.now(),
            nameUpdated: DateTime.now(),
          ),
        ],
        macVendor: 'Digital Data Communications Asia Co.,Ltd',
      ),
      Device(
        id: 2,
        hwaddr: '00:11:22:33:44:66',
        interface: 'eth0',
        firstSeen: DateTime.now(),
        lastQuery: DateTime.now(),
        numQueries: 12,
        ips: [
          DeviceIp(
            ip: '192.168.1.52',
            name: 'test',
            lastSeen: DateTime.now(),
            nameUpdated: DateTime.now(),
          ),
          DeviceIp(
            ip: '192.168.1.62',
            lastSeen: DateTime.now(),
            nameUpdated: DateTime.now(),
          ),
        ],
        macVendor: 'test',
      ),
    ];

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
      Command.globalExceptionHandler = (_, _) {};
      provideDummy<Result<List<LocalDns>>>(const Success([]));
      provideDummy<Result<Unit>>(const Success(unit));
      provideDummy<Result<List<Device>>>(const Success([]));
      provideDummy<Result<Gateways>>(const Success(Gateways(gateways: [])));

      mockLocalDnsRepository = MockLocalDnsRepository();
      mockNetworkRepository = MockNetworkRepository();

      localDnsProvider = LocalDnsViewModel(
        localDnsRepository: mockLocalDnsRepository,
        networkRepository: mockNetworkRepository,
      );
      listenerCalled = false;
      localDnsProvider.addListener(() {
        listenerCalled = true;
      });
    });

    tearDown(() {
      localDnsProvider.dispose();
      Command.globalExceptionHandler = null;
    });

    test('Initial values are set correctly', () {
      expect(localDnsProvider.localDns, []);
      expect(localDnsProvider.deviceOptions, []);
      expect(localDnsProvider.loadingStatus, LoadStatus.loading);
      expect(listenerCalled, false);
    });

    test(
      'setLoadingStatus() updates loading status and notifies listeners',
      () {
        localDnsProvider.setLoadingStatus(LoadStatus.loaded);

        expect(localDnsProvider.loadingStatus, LoadStatus.loaded);
        expect(listenerCalled, true);
      },
    );

    test('load Command updates local DNS and notifies listeners', () async {
      when(mockLocalDnsRepository.fetchRecords()).thenAnswer(
        (_) async =>
            const Success([LocalDns(ip: '192.168.1.2', name: 'device')]),
      );
      when(
        mockNetworkRepository.fetchDevices(
          maxDevices: anyNamed('maxDevices'),
          maxAddresses: anyNamed('maxAddresses'),
        ),
      ).thenAnswer((_) async => Success(devices));

      await localDnsProvider.load.runAsync();

      expect(localDnsProvider.load.errors.value, isNull);
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

    group('addLocalDns Command', () {
      test('adds record and notifies listeners', () async {
        when(
          mockLocalDnsRepository.addRecord(ip: '192.168.11.3', name: 'test'),
        ).thenAnswer((_) async => const Success(unit));

        await localDnsProvider.addLocalDns.runAsync(
          const LocalDns(ip: '192.168.11.3', name: 'test'),
        );

        expect(localDnsProvider.addLocalDns.errors.value, isNull);
        expect(
          localDnsProvider.localDns[0],
          const LocalDns(ip: '192.168.11.3', name: 'test'),
        );
        expect(listenerCalled, true);
      });

      test('rolls back optimistic state and sets error on failure', () async {
        when(
          mockLocalDnsRepository.addRecord(ip: '192.168.11.3', name: 'test'),
        ).thenAnswer((_) async => Failure(Exception('Failed to add')));

        try {
          await localDnsProvider.addLocalDns.runAsync(
            const LocalDns(ip: '192.168.11.3', name: 'test'),
          );
        } catch (_) {}

        expect(localDnsProvider.addLocalDns.errors.value, isNotNull);
        expect(localDnsProvider.localDns.length, 0);
        expect(listenerCalled, true);
      });
    });

    group('updateLocalDns Command', () {
      test('updates record and notifies listeners', () async {
        when(mockLocalDnsRepository.fetchRecords()).thenAnswer(
          (_) async =>
              const Success([LocalDns(ip: '192.168.1.2', name: 'device')]),
        );
        when(
          mockNetworkRepository.fetchDevices(
            maxDevices: anyNamed('maxDevices'),
            maxAddresses: anyNamed('maxAddresses'),
          ),
        ).thenAnswer((_) async => Success(devices));
        await localDnsProvider.load.runAsync();

        when(
          mockLocalDnsRepository.updateRecord(
            record: const LocalDns(ip: '192.168.1.3', name: 'test'),
            oldIp: '192.168.1.2',
          ),
        ).thenAnswer((_) async => const Success(unit));

        await localDnsProvider.updateLocalDns.runAsync(
          (oldIp: '192.168.1.2', item: const LocalDns(ip: '192.168.1.3', name: 'test')),
        );

        expect(localDnsProvider.updateLocalDns.errors.value, isNull);
        expect(localDnsProvider.localDns.length, 1);
        expect(
          localDnsProvider.localDns[0],
          const LocalDns(ip: '192.168.1.3', name: 'test'),
        );
        expect(listenerCalled, true);
      });

      test('rolls back optimistic state and sets error on failure', () async {
        when(mockLocalDnsRepository.fetchRecords()).thenAnswer(
          (_) async =>
              const Success([LocalDns(ip: '192.168.1.2', name: 'device')]),
        );
        when(
          mockNetworkRepository.fetchDevices(
            maxDevices: anyNamed('maxDevices'),
            maxAddresses: anyNamed('maxAddresses'),
          ),
        ).thenAnswer((_) async => Success(devices));
        await localDnsProvider.load.runAsync();

        when(
          mockLocalDnsRepository.updateRecord(
            record: const LocalDns(ip: '192.168.1.3', name: 'test'),
            oldIp: '192.168.1.2',
          ),
        ).thenAnswer((_) async => Failure(Exception('Failed to update')));

        try {
          await localDnsProvider.updateLocalDns.runAsync(
            (oldIp: '192.168.1.2', item: const LocalDns(ip: '192.168.1.3', name: 'test')),
          );
        } catch (_) {}

        expect(localDnsProvider.updateLocalDns.errors.value, isNotNull);
        expect(localDnsProvider.localDns.length, 1);
        expect(
          localDnsProvider.localDns[0],
          const LocalDns(ip: '192.168.1.2', name: 'device'),
        );
        expect(listenerCalled, true);
      });
    });

    group('removeLocalDns Command', () {
      test('removes record and notifies listeners', () async {
        when(mockLocalDnsRepository.fetchRecords()).thenAnswer(
          (_) async =>
              const Success([LocalDns(ip: '192.168.1.2', name: 'device')]),
        );
        when(
          mockNetworkRepository.fetchDevices(
            maxDevices: anyNamed('maxDevices'),
            maxAddresses: anyNamed('maxAddresses'),
          ),
        ).thenAnswer((_) async => Success(devices));
        await localDnsProvider.load.runAsync();

        when(
          mockLocalDnsRepository.deleteRecord(
            ip: '192.168.1.2',
            name: 'device',
          ),
        ).thenAnswer((_) async => const Success(unit));

        await localDnsProvider.removeLocalDns.runAsync(
          const LocalDns(ip: '192.168.1.2', name: 'device'),
        );

        expect(localDnsProvider.removeLocalDns.errors.value, isNull);
        expect(localDnsProvider.localDns.length, 0);
        expect(listenerCalled, true);
      });

      test('rolls back optimistic state and sets error on failure', () async {
        when(mockLocalDnsRepository.fetchRecords()).thenAnswer(
          (_) async =>
              const Success([LocalDns(ip: '192.168.1.2', name: 'device')]),
        );
        when(
          mockNetworkRepository.fetchDevices(
            maxDevices: anyNamed('maxDevices'),
            maxAddresses: anyNamed('maxAddresses'),
          ),
        ).thenAnswer((_) async => Success(devices));
        await localDnsProvider.load.runAsync();

        when(
          mockLocalDnsRepository.deleteRecord(
            ip: '192.168.1.2',
            name: 'device',
          ),
        ).thenAnswer((_) async => Failure(Exception('Failed to delete')));

        try {
          await localDnsProvider.removeLocalDns.runAsync(
            const LocalDns(ip: '192.168.1.2', name: 'device'),
          );
        } catch (_) {}

        expect(localDnsProvider.removeLocalDns.errors.value, isNotNull);
        expect(localDnsProvider.localDns.length, 1);
        expect(
          localDnsProvider.localDns[0],
          const LocalDns(ip: '192.168.1.2', name: 'device'),
        );
        expect(listenerCalled, true);
      });
    });

    test('devicesToOptions() converts devices to device options', () {
      final resp = localDnsProvider.devicesToOptions(devices);

      expect(
        resp.map((e) => e.toJson()).toList(),
        deviceOptions.map((e) => e.toJson()).toList(),
      );
      expect(listenerCalled, false);
    });
  });
}
