import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6_generated/group_mapper.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

void main() {
  group('GroupsGetGroupsInnerMapper', () {
    test('maps all fields correctly', () {
      final inner = GroupsGetGroupsInner(
        id: 5,
        name: 'Test Group',
        enabled: true,
        dateAdded: 1700000000,
        dateModified: 1700001000,
        comment: 'A test group',
      );

      final group = inner.toDomain();

      expect(group.id, 5);
      expect(group.name, 'Test Group');
      expect(group.enabled, true);
      expect(
        group.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        group.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(group.comment, 'A test group');
    });

    test('maps disabled group', () {
      final inner = GroupsGetGroupsInner(
        id: 2,
        name: 'Disabled',
        enabled: false,
      );

      final group = inner.toDomain();

      expect(group.enabled, false);
    });

    test('uses defaults for null fields', () {
      final inner = GroupsGetGroupsInner();

      final group = inner.toDomain();

      expect(group.id, 0);
      expect(group.name, '');
      expect(group.enabled, true);
      expect(group.comment, isNull);
      expect(group.dateAdded, DateTime.fromMillisecondsSinceEpoch(0));
      expect(group.dateModified, DateTime.fromMillisecondsSinceEpoch(0));
    });
  });

  group('GetGroups200ResponseMapper', () {
    test('toDomainList maps all entries', () {
      final response = GetGroups200Response(
        groups: [
          GroupsGetGroupsInner(id: 0, name: 'Default'),
          GroupsGetGroupsInner(id: 1, name: 'Custom'),
        ],
      );

      final list = response.toDomainList();

      expect(list.length, 2);
      expect(list[0].id, 0);
      expect(list[0].name, 'Default');
      expect(list[1].id, 1);
      expect(list[1].name, 'Custom');
    });

    test('toDomainList returns empty list when groups is null', () {
      final response = GetGroups200Response();

      final list = response.toDomainList();

      expect(list, isEmpty);
    });
  });
}
