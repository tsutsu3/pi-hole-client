import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class GroupRepository {
  Future<Result<List<Group>>> fetchGroups();

  Future<Result<Group>> addGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  });

  Future<Result<Group>> updateGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  });

  Future<Result<Unit>> deleteGroup(String name);
}
