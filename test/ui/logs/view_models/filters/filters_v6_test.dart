import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/logs/view_models/filters/filters_v6.dart';

void main() {
  // -------------------------------------------------------------------------
  // Initial state
  // -------------------------------------------------------------------------

  group('FiltersV6 – initial state', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('requestStatus defaults to all', () {
      expect(f.requestStatus, RequestStatus.all);
    });

    test('statusSelected matches defaultSelected (all shown statuses)', () {
      expect(f.statusSelected, equals(f.defaultSelected));
    });

    test('statusSelected is non-empty', () {
      expect(f.statusSelected, isNotEmpty);
    });

    test('statusAllowedAndRetried is non-empty', () {
      expect(f.statusAllowedAndRetried, isNotEmpty);
    });

    test('startTime is null', () {
      expect(f.startTime, isNull);
    });

    test('endTime is null', () {
      expect(f.endTime, isNull);
    });

    test('totalClients is empty', () {
      expect(f.totalClients, isEmpty);
    });

    test('selectedClients is empty', () {
      expect(f.selectedClients, isEmpty);
    });

    test('selectedDomain is null', () {
      expect(f.selectedDomain, isNull);
    });

    test('statusSelectedString returns text for first selected status', () {
      expect(f.statusSelectedString, isNotEmpty);
    });
  });

  // -------------------------------------------------------------------------
  // setRequestStatus
  // -------------------------------------------------------------------------

  group('FiltersV6 – setRequestStatus', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('setRequestStatus(blocked) narrows statusSelected', () {
      final allCount = f.statusSelected.length;
      f.setRequestStatus(RequestStatus.blocked);
      expect(f.requestStatus, RequestStatus.blocked);
      expect(f.statusSelected.length, lessThan(allCount));
    });

    test('setRequestStatus(allowed) narrows statusSelected', () {
      final allCount = f.statusSelected.length;
      f.setRequestStatus(RequestStatus.allowed);
      expect(f.requestStatus, RequestStatus.allowed);
      expect(f.statusSelected.length, lessThan(allCount));
    });

    test('setRequestStatus(all) restores full selection', () {
      f.setRequestStatus(RequestStatus.blocked);
      f.setRequestStatus(RequestStatus.all);
      expect(f.requestStatus, RequestStatus.all);
      expect(f.statusSelected.length, equals(f.defaultSelected.length));
    });
  });

  // -------------------------------------------------------------------------
  // resetStatus
  // -------------------------------------------------------------------------

  group('FiltersV6 – resetStatus', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('restores requestStatus to all', () {
      f.setRequestStatus(RequestStatus.blocked);
      f.resetStatus();
      expect(f.requestStatus, RequestStatus.all);
    });

    test('restores statusSelected to defaultSelected', () {
      f.setRequestStatus(RequestStatus.allowed);
      f.resetStatus();
      expect(f.statusSelected.length, equals(f.defaultSelected.length));
    });
  });

  // -------------------------------------------------------------------------
  // Time filters
  // -------------------------------------------------------------------------

  group('FiltersV6 – time filters', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('setStartTime stores the value', () {
      final dt = DateTime(2024, 6, 1);
      f.setStartTime(dt);
      expect(f.startTime, equals(dt));
    });

    test('setEndTime stores the value', () {
      final dt = DateTime(2024, 6, 1, 23, 59);
      f.setEndTime(dt);
      expect(f.endTime, equals(dt));
    });

    test('resetTime clears both start and end times', () {
      f.setStartTime(DateTime(2024));
      f.setEndTime(DateTime(2024));
      f.resetTime();
      expect(f.startTime, isNull);
      expect(f.endTime, isNull);
    });
  });

  // -------------------------------------------------------------------------
  // Client filters
  // -------------------------------------------------------------------------

  group('FiltersV6 – client filters', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test(
      'setClients sets totalClients and initializes selectedClients when empty',
      () {
        f.setClients(['a', 'b', 'c']);
        expect(f.totalClients, equals(['a', 'b', 'c']));
        expect(f.selectedClients, equals(['a', 'b', 'c']));
      },
    );

    test(
      'setClients preserves existing selectedClients on subsequent calls',
      () {
        f.setClients(['a', 'b']);
        f.setSelectedClients(['a']);
        f.setClients(['a', 'b', 'c']); // update total but selected stays
        expect(f.selectedClients, equals(['a']));
      },
    );

    test('setSelectedClients updates the selection', () {
      f.setClients(['a', 'b', 'c']);
      f.setSelectedClients(['b']);
      expect(f.selectedClients, equals(['b']));
    });

    test('resetClients restores selectedClients to totalClients', () {
      f.setClients(['a', 'b', 'c']);
      f.setSelectedClients(['a']);
      f.resetClients();
      expect(f.selectedClients, equals(f.totalClients));
    });
  });

  // -------------------------------------------------------------------------
  // Domain filter
  // -------------------------------------------------------------------------

  group('FiltersV6 – domain filter', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('setSelectedDomain stores the domain', () {
      f.setSelectedDomain('example.com');
      expect(f.selectedDomain, equals('example.com'));
    });

    test('setSelectedDomain(null) clears the domain', () {
      f.setSelectedDomain('example.com');
      f.setSelectedDomain(null);
      expect(f.selectedDomain, isNull);
    });
  });

  // -------------------------------------------------------------------------
  // resetFilters
  // -------------------------------------------------------------------------

  group('FiltersV6 – resetFilters', () {
    late FiltersV6 f;

    setUp(() => f = FiltersV6());

    test('resets all fields to defaults', () {
      f.setRequestStatus(RequestStatus.blocked);
      f.setStartTime(DateTime(2024));
      f.setEndTime(DateTime(2024));
      f.setSelectedDomain('bad.com');
      f.setClients(['x', 'y']);
      f.setSelectedClients(['x']);

      f.resetFilters();

      expect(f.requestStatus, RequestStatus.all);
      expect(f.statusSelected.length, equals(f.defaultSelected.length));
      expect(f.startTime, isNull);
      expect(f.endTime, isNull);
      expect(f.selectedDomain, isNull);
      // selectedClients is restored to totalClients after reset.
      expect(f.selectedClients, equals(f.totalClients));
    });
  });
}
