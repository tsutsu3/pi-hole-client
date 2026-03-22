import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/group_mapper.dart';
import 'package:pi_hole_client/data/model/v6/groups/groups.dart' as s;

const _groupData = s.Group(
  id: 5,
  name: 'Work devices',
  enabled: true,
  dateAdded: 1700000000,
  dateModified: 1700001000,
  comment: 'office LAN',
);

void main() {
  group('GroupsMapper (v6)', () {
    test('maps all fields correctly', () {
      const source = s.Groups(groups: [_groupData], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 1);
      final group = result[0];
      expect(group.id, 5);
      expect(group.name, 'Work devices');
      expect(group.enabled, isTrue);
      expect(
        group.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        group.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(group.comment, 'office LAN');
    });

    test('maps multiple groups', () {
      const source = s.Groups(groups: [_groupData, _groupData], took: 0.001);
      expect(source.toDomain().length, 2);
    });

    test('returns empty list when groups is empty', () {
      const source = s.Groups(groups: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });

    test('toSingleDomain returns the one group', () {
      const source = s.Groups(groups: [_groupData], took: 0.001);
      expect(source.toSingleDomain().name, 'Work devices');
    });

    test('toSingleDomain throws when empty', () {
      const source = s.Groups(groups: [], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });

    test('toSingleDomain throws when multiple', () {
      const source = s.Groups(groups: [_groupData, _groupData], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<Exception>()));
    });
  });
}
