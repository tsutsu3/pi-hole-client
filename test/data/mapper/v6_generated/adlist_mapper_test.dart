import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6_generated/adlist_mapper.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

void main() {
  group('ListsGetListsInnerMapper', () {
    test('maps all fields correctly', () {
      final inner = ListsGetListsInner(
        id: 1,
        address: 'https://example.com/hosts.txt',
        type: ListsGetListsInnerTypeEnum.block,
        groups: [0],
        enabled: true,
        dateAdded: 1700000000,
        dateModified: 1700001000,
        dateUpdated: 1700002000,
        number: 50000,
        invalidDomains: 10,
        abpEntries: 5,
        status: 1,
        comment: 'Main blocklist',
      );

      final adlist = inner.toDomain();

      expect(adlist.id, 1);
      expect(adlist.address, 'https://example.com/hosts.txt');
      expect(adlist.type, ListType.block);
      expect(adlist.groups, [0]);
      expect(adlist.enabled, true);
      expect(
        adlist.dateAdded,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        adlist.dateModified,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(
        adlist.dateUpdated,
        DateTime.fromMillisecondsSinceEpoch(1700002000 * 1000),
      );
      expect(adlist.number, 50000);
      expect(adlist.invalidDomains, 10);
      expect(adlist.abpEntries, 5);
      expect(adlist.status, ListsStatus.downloaded);
      expect(adlist.comment, 'Main blocklist');
    });

    test('maps allow list type', () {
      final inner = ListsGetListsInner(
        type: ListsGetListsInnerTypeEnum.allow,
      );

      final adlist = inner.toDomain();

      expect(adlist.type, ListType.allow);
    });

    test('uses defaults for null fields', () {
      final inner = ListsGetListsInner();

      final adlist = inner.toDomain();

      expect(adlist.id, 0);
      expect(adlist.address, '');
      expect(adlist.type, ListType.unknown);
      expect(adlist.groups, [0]);
      expect(adlist.enabled, true);
      expect(adlist.number, 0);
      expect(adlist.invalidDomains, 0);
      expect(adlist.abpEntries, 0);
      expect(adlist.status, ListsStatus.notDownloaded);
      expect(adlist.comment, isNull);
    });

    test('maps various status codes', () {
      for (final entry in {
        0: ListsStatus.notDownloaded,
        1: ListsStatus.downloaded,
        2: ListsStatus.unchanged,
        3: ListsStatus.unavailableCached,
        4: ListsStatus.unavailableNoCache,
      }.entries) {
        final inner = ListsGetListsInner(status: entry.key);
        final adlist = inner.toDomain();
        expect(adlist.status, entry.value, reason: 'status ${entry.key}');
      }
    });
  });

  group('GetLists200ResponseMapper', () {
    test('toDomainList maps all entries', () {
      final response = GetLists200Response(
        lists: [
          ListsGetListsInner(
            id: 1,
            address: 'https://a.com/list.txt',
          ),
          ListsGetListsInner(
            id: 2,
            address: 'https://b.com/list.txt',
          ),
        ],
      );

      final list = response.toDomainList();

      expect(list.length, 2);
      expect(list[0].address, 'https://a.com/list.txt');
      expect(list[1].address, 'https://b.com/list.txt');
    });

    test('toDomainList returns empty list when lists is null', () {
      final response = GetLists200Response();

      final list = response.toDomainList();

      expect(list, isEmpty);
    });
  });

  group('ListsGetListsInnerTypeEnumMapper', () {
    test('maps allow', () {
      expect(
        ListsGetListsInnerTypeEnum.allow.toListType(),
        ListType.allow,
      );
    });

    test('maps block', () {
      expect(
        ListsGetListsInnerTypeEnum.block.toListType(),
        ListType.block,
      );
    });

    test('maps null to unknown', () {
      const ListsGetListsInnerTypeEnum? value = null;
      expect(value.toListType(), ListType.unknown);
    });
  });
}
