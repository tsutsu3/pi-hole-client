import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:result_dart/result_dart.dart';

class FakeAdlistRepository implements AdListRepository {
  bool shouldFail = false;

  final _now = DateTime(2025, 1, 1);

  @override
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAdlists failure'));
    }
    return Success([
      Adlist(
        address: 'https://blocklist.example.com/hosts',
        type: ListType.block,
        groups: [0],
        enabled: true,
        id: 1,
        dateAdded: _now,
        dateModified: _now,
        dateUpdated: _now,
        number: 1000,
        invalidDomains: 0,
        abpEntries: 0,
        status: ListsStatus.downloaded,
      ),
      Adlist(
        address: 'https://allowlist.example.com/hosts',
        type: ListType.allow,
        groups: [0],
        enabled: true,
        id: 2,
        dateAdded: _now,
        dateModified: _now,
        dateUpdated: _now,
        number: 50,
        invalidDomains: 0,
        abpEntries: 0,
        status: ListsStatus.downloaded,
      ),
      Adlist(
        address: 'https://another-blocklist.example.com/hosts',
        type: ListType.block,
        groups: [0, 1],
        enabled: false,
        id: 3,
        dateAdded: _now,
        dateModified: _now,
        dateUpdated: _now,
        number: 500,
        invalidDomains: 5,
        abpEntries: 0,
        status: ListsStatus.unknown,
        comment: 'test comment',
      ),
    ]);
  }

  @override
  Future<Result<Adlist>> addAdlist(
    String address,
    ListType type, {
    List<int> groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force addAdlist failure'));
    }
    return Success(
      Adlist(
        address: address,
        type: type,
        groups: groups,
        enabled: enabled ?? true,
        id: 99,
        dateAdded: _now,
        dateModified: _now,
        dateUpdated: _now,
        number: 0,
        invalidDomains: 0,
        abpEntries: 0,
        status: ListsStatus.unknown,
        comment: comment,
      ),
    );
  }

  @override
  Future<Result<Adlist>> updateAdlist(
    String address,
    ListType type, {
    List<int> groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force updateAdlist failure'));
    }
    return Success(
      Adlist(
        address: address,
        type: type,
        groups: groups,
        enabled: enabled ?? true,
        id: 1,
        dateAdded: _now,
        dateModified: _now,
        dateUpdated: _now,
        number: 1000,
        invalidDomains: 0,
        abpEntries: 0,
        status: ListsStatus.downloaded,
        comment: comment,
      ),
    );
  }

  @override
  Future<Result<Unit>> deleteAdlist(String address, ListType type) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteAdlist failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<ListSearchResult>> searchLists({
    required String domain,
    bool? partial,
    int? limit,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force searchLists failure'));
    }
    return Success(
      ListSearchResult(
        domains: [],
        gravityMatches: [
          GravityMatch(
            adlist: Adlist(
              address: 'https://blocklist.example.com/hosts',
              type: ListType.block,
              groups: [0],
              enabled: true,
              id: 1,
              dateAdded: _now,
              dateModified: _now,
              dateUpdated: _now,
              number: 1000,
              invalidDomains: 0,
              abpEntries: 0,
              status: ListsStatus.downloaded,
            ),
            matchedDomain: domain,
          ),
        ],
        meta: const ListSearchMeta(
          domainsExact: 0,
          domainsRegex: 0,
          gravityAllow: 0,
          gravityBlock: 1,
          total: 1,
        ),
      ),
    );
  }
}
