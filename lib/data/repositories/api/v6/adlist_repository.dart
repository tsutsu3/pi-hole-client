import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6/adlist_mapper.dart';
import 'package:pi_hole_client/data/mapper/v6/list_search_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:result_dart/result_dart.dart';

class AdlistRepositoryV6 extends BaseV6SidRepository
    implements AdListRepository {
  AdlistRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  }) async {
    return runWithResultRetry<List<Adlist>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getLists(sid, adlist: adlist, type: type);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Adlist>> addAdlist(
    String address,
    ListType type, {
    List<int> groups = const [0],
    String? comment = '',
    bool? enabled = true,
  }) async {
    return runWithResultRetry<Adlist>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postLists(
          sid,
          address: address,
          type: type,
          groups: groups,
          comment: comment,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
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
    return runWithResultRetry<Adlist>(
      action: () async {
        final sid = await getSid();
        final result = await _client.putLists(
          sid,
          adlist: address,
          type: type,
          groups: groups,
          comment: comment,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteAdlist(String address, ListType type) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteLists(
          sid,
          adlist: address,
          type: type,
        );
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<ListSearchResult>> searchLists({
    required String domain,
    bool? partial,
    int? limit,
  }) async {
    return runWithResultRetry<ListSearchResult>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getSearch(
          sid,
          domain: domain,
          partial: partial,
          limit: limit,
        );
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }
}
