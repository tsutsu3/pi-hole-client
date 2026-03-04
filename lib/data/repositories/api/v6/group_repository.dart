import 'package:pi_hole_client/data/mapper/v6/group_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:result_dart/result_dart.dart';

class GroupRepositoryV6 extends BaseV6SidRepository implements GroupRepository {
  GroupRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Group>>> fetchGroups() async {
    return runWithResultRetry<List<Group>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getGroups(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearAndRenewSid(),
    );
  }

  @override
  Future<Result<Group>> addGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  }) async {
    return runWithResultRetry<Group>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postGroups(
          sid,
          name: name,
          comment: comment,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearAndRenewSid(),
    );
  }

  @override
  Future<Result<Group>> updateGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  }) async {
    return runWithResultRetry<Group>(
      action: () async {
        final sid = await getSid();
        final result = await _client.putGroups(
          sid,
          name: name,
          comment: comment,
          enabled: enabled,
        );
        return result.map((e) => e.toSingleDomain());
      },
      onRetry: (_) => clearAndRenewSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteGroup(String name) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        return _client.deleteGroups(sid, name: name);
      },
      onRetry: (_) => clearAndRenewSid(),
    );
  }
}
