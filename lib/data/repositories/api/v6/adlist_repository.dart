import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/adlist_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/adlist.dart';
import 'package:result_dart/result_dart.dart';

class AdlistRepositoryV6 implements AdListRepository {
  AdlistRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  }) async {
    return runWithResultRetry<List<Adlist>>(
      action: () async {
        final result = await _client.getLists(_sid, adlist: adlist, type: type);
        return Success(result.getOrThrow().toDomain());
      },
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
        final result = await _client.postLists(
          _sid,
          address: address,
          type: type,
          groups: groups,
          comment: comment,
          enabled: enabled,
        );
        return Success(result.getOrThrow().toSingleDomain());
      },
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
        final result = await _client.putLists(
          _sid,
          adlist: address,
          type: type,
          groups: groups,
          comment: comment,
          enabled: enabled,
        );
        return Success(result.getOrThrow().toSingleDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteAdlist(
    String address, {
    ListType? type,
  }) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result =
            await _client.deleteLists(_sid, adlist: address, type: type);
        return result;
      },
    );
  }
}
