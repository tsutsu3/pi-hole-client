import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/filters_provider/filters_v5.dart';
import 'package:pi_hole_client/providers/filters_provider/filters_v6.dart';
import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart';
import './filters_provider_test.mocks.dart';

@GenerateMocks([ServersProvider])
void main() {
  group('FiltersProvider', () {
    late FiltersProvider filtersProvider;
    late MockServersProvider mockServersProvider;

    setUp(() {
      mockServersProvider = MockServersProvider();
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
        ),
      );

      filtersProvider = FiltersProvider(serversProvider: mockServersProvider);
    });

    test('initializes with FiltersV5 by default', () {
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV5().statusAllowedAndRetried,
      );
      expect(
        filtersProvider.defaultSelected,
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
      );
      expect(
        filtersProvider.statusSelectedString,
        'Blocked (gravity)',
      );
    });

    test('updates to FiltersV6 when server version is v6', () {
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
        ),
      );
      filtersProvider.update(mockServersProvider);
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      filtersProvider.setStatusSelected([1, 2, 3]);
      expect(filtersProvider.statusSelected, [1, 2, 3]);
      filtersProvider.removeListener(listener);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      expect(filtersProvider.startTime, dateTime);
      filtersProvider.removeListener(listener);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final dateTime = DateTime.now();
      filtersProvider.setEndTime(dateTime);
      expect(filtersProvider.endTime, dateTime);
      filtersProvider.removeListener(listener);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetFilters();
        expect(
          filtersProvider.statusSelected,
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
        );
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'resetTime calls resetTime on _filters and notifies listeners',
      () {
        final dateTime = DateTime.now();
        filtersProvider.setStartTime(dateTime);
        filtersProvider.setEndTime(dateTime);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetTime();
        expect(filtersProvider.startTime, null);
        expect(filtersProvider.endTime, null);
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetStatus();
        expect(
          filtersProvider.statusSelected,
          [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14],
        );
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'setClients updates clients and notifies listeners',
      () {
        void listener() {}
        filtersProvider.addListener(listener);
        final clients = ['client1', 'client2'];
        filtersProvider.setClients(clients);
        expect(filtersProvider.totalClients, clients);
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        void listener() {}
        filtersProvider.addListener(listener);
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);
        expect(filtersProvider.selectedClients, selectedClients);
        filtersProvider.removeListener(listener);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final domain = 'example.com';
      filtersProvider.setSelectedDomain(domain);
      expect(filtersProvider.selectedDomain, domain);
      filtersProvider.removeListener(listener);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetClients();
        expect(filtersProvider.totalClients, []);
        filtersProvider.removeListener(listener);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final status = RequestStatus.allowed;
      filtersProvider.setRequestStatus(status);

      expect(filtersProvider.requestStatus, status);
      filtersProvider.removeListener(listener);
    });
  });

  group('FiltersProvider v6', () {
    late FiltersProvider filtersProvider;
    late MockServersProvider mockServersProvider;

    setUp(() {
      mockServersProvider = MockServersProvider();
      when(mockServersProvider.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
        ),
      );

      filtersProvider = FiltersProvider(serversProvider: mockServersProvider);
    });

    test('initializes with FiltersV6 by default', () {
      expect(
        filtersProvider.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
      expect(
        filtersProvider.defaultSelected,
        [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
      );
      expect(
        filtersProvider.statusSelectedString,
        'Blocked (gravity)',
      );
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      filtersProvider.setStatusSelected([1, 2, 3]);
      expect(filtersProvider.statusSelected, [1, 2, 3]);
      filtersProvider.removeListener(listener);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final dateTime = DateTime.now();
      filtersProvider.setStartTime(dateTime);
      expect(filtersProvider.startTime, dateTime);
      filtersProvider.removeListener(listener);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final dateTime = DateTime.now();
      filtersProvider.setEndTime(dateTime);
      expect(filtersProvider.endTime, dateTime);
      filtersProvider.removeListener(listener);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetFilters();
        expect(
          filtersProvider.statusSelected,
          [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        );
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'resetTime calls resetTime on _filters and notifies listeners',
      () {
        final dateTime = DateTime.now();
        filtersProvider.setStartTime(dateTime);
        filtersProvider.setEndTime(dateTime);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetTime();
        expect(filtersProvider.startTime, null);
        expect(filtersProvider.endTime, null);
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersProvider.setStatusSelected([1, 2, 3]);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetStatus();
        expect(
          filtersProvider.statusSelected,
          [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        );
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'setClients updates clients and notifies listeners',
      () {
        void listener() {}
        filtersProvider.addListener(listener);
        final clients = ['client1', 'client2'];
        filtersProvider.setClients(clients);
        expect(filtersProvider.totalClients, clients);
        filtersProvider.removeListener(listener);
      },
    );

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        void listener() {}
        filtersProvider.addListener(listener);
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);
        expect(filtersProvider.selectedClients, selectedClients);
        filtersProvider.removeListener(listener);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final domain = 'example.com';
      filtersProvider.setSelectedDomain(domain);
      expect(filtersProvider.selectedDomain, domain);
      filtersProvider.removeListener(listener);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersProvider.setSelectedClients(selectedClients);

        void listener() {}
        filtersProvider.addListener(listener);
        filtersProvider.resetClients();
        expect(filtersProvider.totalClients, []);
        filtersProvider.removeListener(listener);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      void listener() {}
      filtersProvider.addListener(listener);
      final status = RequestStatus.allowed;
      filtersProvider.setRequestStatus(status);

      expect(filtersProvider.requestStatus, status);
      filtersProvider.removeListener(listener);
    });
  });
}
