import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider/filters_v5.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider/filters_v6.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import './filters_provider_test.mocks.dart';

@GenerateMocks([ServersProvider])
void main() {
  group('FiltersProvider', () {
    late FiltersProvider filtersProvider;
    late MockServersProvider mockServersProvider;
    late bool listenerCalled;

    setUp(() {
      mockServersProvider = MockServersProvider();
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );

      filtersProvider = FiltersProvider(serversProvider: mockServersProvider);

      listenerCalled = false;
      filtersProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initializes with FiltersV5 by default', () {
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV5().statusAllowedAndRetried,
      );
      expect(filtersProvider.defaultSelected, [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
      ]);
      expect(filtersProvider.statusSelectedString, 'Blocked (gravity)');
      expect(listenerCalled, false);
    });

    test('updates to FiltersV6 when server version is v6', () {
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );
      filtersProvider.update(mockServersProvider);
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
      expect(listenerCalled, false);
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      filtersProvider.setStatusSelected([1, 2, 3]);
      expect(filtersProvider.statusSelected, [1, 2, 3]);
      expect(listenerCalled, true);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      expect(filtersProvider.startTime, dateTime);
      expect(listenerCalled, true);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setEndTime(dateTime);
      expect(filtersProvider.endTime, dateTime);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        filtersProvider.resetFilters();
        expect(filtersProvider.statusSelected, [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
        ]);

        expect(listenerCalled, true);
      },
    );

    test('resetTime calls resetTime on _filters and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      filtersProvider.setEndTime(dateTime);

      filtersProvider.resetTime();
      expect(filtersProvider.startTime, null);
      expect(filtersProvider.endTime, null);

      expect(listenerCalled, true);
    });

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        filtersProvider.resetStatus();
        expect(filtersProvider.statusSelected, [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
        ]);

        expect(listenerCalled, true);
      },
    );

    test('setClients updates clients and notifies listeners', () {
      final clients = ['client1', 'client2'];
      filtersProvider.setClients(clients);
      expect(filtersProvider.totalClients, clients);

      expect(listenerCalled, true);
    });

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);
        expect(filtersProvider.selectedClients, selectedClients);

        expect(listenerCalled, true);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      const domain = 'example.com';
      filtersProvider.setSelectedDomain(domain);
      expect(filtersProvider.selectedDomain, domain);

      expect(listenerCalled, true);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);

        filtersProvider.resetClients();
        expect(filtersProvider.totalClients, []);

        expect(listenerCalled, true);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      const status = RequestStatus.allowed;
      filtersProvider.setRequestStatus(status);

      expect(filtersProvider.requestStatus, status);

      expect(listenerCalled, true);
    });
  });

  group('FiltersProvider v6', () {
    late FiltersProvider filtersProvider;
    late MockServersProvider mockServersProvider;
    late bool listenerCalled;

    setUp(() {
      mockServersProvider = MockServersProvider();
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );

      filtersProvider = FiltersProvider(serversProvider: mockServersProvider);
      listenerCalled = false;
      filtersProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('initializes with FiltersV6 by default', () {
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
      expect(filtersProvider.defaultSelected, [
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
      ]);
      expect(filtersProvider.statusSelectedString, 'Blocked (gravity)');
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      filtersProvider.setStatusSelected([1, 2, 3]);
      expect(filtersProvider.statusSelected, [1, 2, 3]);

      expect(listenerCalled, true);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      expect(filtersProvider.startTime, dateTime);

      expect(listenerCalled, true);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setEndTime(dateTime);
      expect(filtersProvider.endTime, dateTime);

      expect(listenerCalled, true);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        filtersProvider.resetFilters();
        expect(filtersProvider.statusSelected, [
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
        ]);

        expect(listenerCalled, true);
      },
    );

    test('resetTime calls resetTime on _filters and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      filtersProvider.setEndTime(dateTime);

      filtersProvider.resetTime();
      expect(filtersProvider.startTime, null);
      expect(filtersProvider.endTime, null);

      expect(listenerCalled, true);
    });

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        filtersProvider.resetStatus();
        expect(filtersProvider.statusSelected, [
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
        ]);

        expect(listenerCalled, true);
      },
    );

    test('setClients updates clients and notifies listeners', () {
      final clients = ['client1', 'client2'];
      filtersProvider.setClients(clients);
      expect(filtersProvider.totalClients, clients);

      expect(listenerCalled, true);
    });

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);
        expect(filtersProvider.selectedClients, selectedClients);

        expect(listenerCalled, true);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      const domain = 'example.com';
      filtersProvider.setSelectedDomain(domain);
      expect(filtersProvider.selectedDomain, domain);

      expect(listenerCalled, true);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);

        filtersProvider.resetClients();
        expect(filtersProvider.totalClients, []);

        expect(listenerCalled, true);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      const status = RequestStatus.allowed;
      filtersProvider.setRequestStatus(status);

      expect(filtersProvider.requestStatus, status);

      expect(listenerCalled, true);
    });
  });
}
