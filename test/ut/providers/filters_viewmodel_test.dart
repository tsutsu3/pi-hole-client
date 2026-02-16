import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel/filters_v5.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_viewmodel/filters_v6.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';

import './filters_viewmodel_test.mocks.dart';

@GenerateMocks([ServersViewModel])
void main() {
  group('FiltersViewModel', () {
    late FiltersViewModel filtersViewModel;
    late MockServersViewModel mockServersViewModel;
    late bool listenerCalled;

    setUp(() {
      mockServersViewModel = MockServersViewModel();
      when(mockServersViewModel.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8080',
          alias: 'test v5',
          defaultServer: false,
          apiVersion: 'v5',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );

      filtersViewModel = FiltersViewModel(serversViewModel: mockServersViewModel);

      listenerCalled = false;
      filtersViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('initializes with FiltersV5 by default', () {
      expect(
        filtersViewModel.statusAllowedAndRetried,
        FiltersV5().statusAllowedAndRetried,
      );
      expect(filtersViewModel.defaultSelected, [
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
      expect(filtersViewModel.statusSelectedString, 'Blocked (gravity)');
      expect(listenerCalled, false);
    });

    test('updates to FiltersV6 when server version is v6', () {
      when(mockServersViewModel.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );
      filtersViewModel.update(mockServersViewModel);
      expect(
        filtersViewModel.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
      expect(listenerCalled, false);
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      filtersViewModel.setStatusSelected([1, 2, 3]);
      expect(filtersViewModel.statusSelected, [1, 2, 3]);
      expect(listenerCalled, true);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersViewModel.setStartTime(dateTime);
      expect(filtersViewModel.startTime, dateTime);
      expect(listenerCalled, true);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersViewModel.setEndTime(dateTime);
      expect(filtersViewModel.endTime, dateTime);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersViewModel.setStatusSelected([1, 2, 3]);

        filtersViewModel.resetFilters();
        expect(filtersViewModel.statusSelected, [
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
      filtersViewModel.setStartTime(dateTime);
      filtersViewModel.setEndTime(dateTime);

      filtersViewModel.resetTime();
      expect(filtersViewModel.startTime, null);
      expect(filtersViewModel.endTime, null);

      expect(listenerCalled, true);
    });

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersViewModel.setStatusSelected([1, 2, 3]);

        filtersViewModel.resetStatus();
        expect(filtersViewModel.statusSelected, [
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
      filtersViewModel.setClients(clients);
      expect(filtersViewModel.totalClients, clients);

      expect(listenerCalled, true);
    });

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersViewModel.setSelectedClients(selectedClients);
        expect(filtersViewModel.selectedClients, selectedClients);

        expect(listenerCalled, true);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      const domain = 'example.com';
      filtersViewModel.setSelectedDomain(domain);
      expect(filtersViewModel.selectedDomain, domain);

      expect(listenerCalled, true);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersViewModel.setSelectedClients(selectedClients);

        filtersViewModel.resetClients();
        expect(filtersViewModel.totalClients, []);

        expect(listenerCalled, true);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      const status = RequestStatus.allowed;
      filtersViewModel.setRequestStatus(status);

      expect(filtersViewModel.requestStatus, status);

      expect(listenerCalled, true);
    });
  });

  group('FiltersViewModel v6', () {
    late FiltersViewModel filtersViewModel;
    late MockServersViewModel mockServersViewModel;
    late bool listenerCalled;

    setUp(() {
      mockServersViewModel = MockServersViewModel();
      when(mockServersViewModel.selectedServer).thenReturn(
        Server(
          address: 'http://localhost:8081',
          alias: 'test v6',
          defaultServer: false,
          apiVersion: 'v6',
          allowSelfSignedCert: true,
          ignoreCertificateErrors: false,
        ),
      );

      filtersViewModel = FiltersViewModel(serversViewModel: mockServersViewModel);
      listenerCalled = false;
      filtersViewModel.addListener(() {
        listenerCalled = true;
      });
    });

    test('initializes with FiltersV6 by default', () {
      expect(
        filtersViewModel.statusAllowedAndRetried,
        FiltersV6().statusAllowedAndRetried,
      );
      expect(filtersViewModel.defaultSelected, [
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
      expect(filtersViewModel.statusSelectedString, 'Blocked (gravity)');
    });

    test('setStatusSelected updates statusSelected and notifies listeners', () {
      filtersViewModel.setStatusSelected([1, 2, 3]);
      expect(filtersViewModel.statusSelected, [1, 2, 3]);

      expect(listenerCalled, true);
    });

    test('setStartTime updates startTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersViewModel.setStartTime(dateTime);
      expect(filtersViewModel.startTime, dateTime);

      expect(listenerCalled, true);
    });

    test('setEndTime updates endTime and notifies listeners', () {
      final dateTime = DateTime.now();
      filtersViewModel.setEndTime(dateTime);
      expect(filtersViewModel.endTime, dateTime);

      expect(listenerCalled, true);
    });

    test(
      'resetFilters calls resetFilters on _filters and notifies listeners',
      () {
        filtersViewModel.setStatusSelected([1, 2, 3]);

        filtersViewModel.resetFilters();
        expect(filtersViewModel.statusSelected, [
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
      filtersViewModel.setStartTime(dateTime);
      filtersViewModel.setEndTime(dateTime);

      filtersViewModel.resetTime();
      expect(filtersViewModel.startTime, null);
      expect(filtersViewModel.endTime, null);

      expect(listenerCalled, true);
    });

    test(
      'resetStatus calls resetStatus on _filters and notifies listeners',
      () {
        filtersViewModel.setStatusSelected([1, 2, 3]);

        filtersViewModel.resetStatus();
        expect(filtersViewModel.statusSelected, [
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
      filtersViewModel.setClients(clients);
      expect(filtersViewModel.totalClients, clients);

      expect(listenerCalled, true);
    });

    test(
      'setSelectedClients updates selectedClients and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersViewModel.setSelectedClients(selectedClients);
        expect(filtersViewModel.selectedClients, selectedClients);

        expect(listenerCalled, true);
      },
    );

    test('setSelectedDomain updates selectedDomain and notifies listeners', () {
      const domain = 'example.com';
      filtersViewModel.setSelectedDomain(domain);
      expect(filtersViewModel.selectedDomain, domain);

      expect(listenerCalled, true);
    });

    test(
      'resetClients calls resetClients on _filters and notifies listeners',
      () {
        final selectedClients = ['client1'];
        filtersViewModel.setSelectedClients(selectedClients);

        filtersViewModel.resetClients();
        expect(filtersViewModel.totalClients, []);

        expect(listenerCalled, true);
      },
    );

    test('setRequestStatus updates requestStatus and notifies listeners', () {
      const status = RequestStatus.allowed;
      filtersViewModel.setRequestStatus(status);

      expect(filtersViewModel.requestStatus, status);

      expect(listenerCalled, true);
    });
  });
}
