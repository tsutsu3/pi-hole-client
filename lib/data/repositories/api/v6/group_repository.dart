import 'package:pi_hole_client/data/mapper/v6/group_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/group/group.dart';
import 'package:result_dart/result_dart.dart';

class GroupRepositoryV6 implements GroupRepository {
  GroupRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<Group>>> fetchGroups() async {
    return runWithResultRetry<List<Group>>(
      action: () async {
        final result = await _client.getGroups(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }
}
