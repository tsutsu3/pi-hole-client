import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/adlist_mapper.dart';
import 'package:pi_hole_client/data/model/v6/lists/lists.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _adlistItem = s.ListItem(
  address: 'https://example.com/blocklist.txt',
  type: 'block',
  groups: [0, 1],
  enabled: true,
  id: 42,
  dateAdded: 1700000000,
  dateModified: 1700001000,
  dateUpdated: 1700002000,
  number: 150000,
  invalidDomains: 5,
  abpEntries: 0,
  status: 2,
  comment: 'my list',
);

void main() {
  group('ListsMapper (v6)', () {
    test('maps all fields correctly', () {
      const source = s.Lists(lists: [_adlistItem], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 1);
      final item = result[0];
      expect(item.address, 'https://example.com/blocklist.txt');
      expect(item.type, ListType.block);
      expect(item.groups, [0, 1]);
      expect(item.enabled, isTrue);
      expect(item.id, 42);
      expect(
        item.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        item.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(
        item.dateUpdated,
        DateTime.fromMillisecondsSinceEpoch(1700002000 * 1000),
      );
      expect(item.number, 150000);
      expect(item.invalidDomains, 5);
      expect(item.abpEntries, 0);
      expect(item.comment, 'my list');
    });

    test('maps multiple items', () {
      const source = s.Lists(lists: [_adlistItem, _adlistItem], took: 0.001);
      expect(source.toDomain().length, 2);
    });

    test('returns empty list when lists is empty', () {
      const source = s.Lists(lists: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });

    test('toSingleDomain returns the one item', () {
      const source = s.Lists(lists: [_adlistItem], took: 0.001);
      expect(
        source.toSingleDomain().address,
        'https://example.com/blocklist.txt',
      );
    });

    test('toSingleDomain throws when list is empty', () {
      const source = s.Lists(lists: [], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<StateError>()));
    });

    test('toSingleDomain throws when list has multiple items', () {
      const source = s.Lists(lists: [_adlistItem, _adlistItem], took: 0.001);
      expect(() => source.toSingleDomain(), throwsA(isA<StateError>()));
    });
  });
}
