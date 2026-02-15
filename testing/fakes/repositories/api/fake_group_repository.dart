import 'package:pi_hole_client/data/repositories/api/interfaces/group_repository.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:result_dart/result_dart.dart';

class FakeGroupRepository implements GroupRepository {
  bool shouldFail = false;

  final _now = DateTime(2025, 1, 1);

  @override
  Future<Result<List<Group>>> fetchGroups() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchGroups failure'));
    }
    return Success([
      Group(
        id: 0,
        name: 'Default',
        comment: 'The default group',
        enabled: true,
        dateAdded: _now,
        dateModified: _now,
      ),
      Group(
        id: 5,
        name: 'test',
        enabled: false,
        dateAdded: _now,
        dateModified: _now,
      ),
    ]);
  }

  @override
  Future<Result<Group>> addGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force addGroup failure'));
    }
    return Success(
      Group(
        id: 10,
        name: name,
        comment: comment,
        enabled: enabled ?? true,
        dateAdded: _now,
        dateModified: _now,
      ),
    );
  }

  @override
  Future<Result<Group>> updateGroup(
    String name, {
    String? comment,
    bool? enabled = true,
  }) async {
    if (shouldFail) {
      return Failure(Exception('Force updateGroup failure'));
    }
    return Success(
      Group(
        id: 5,
        name: name,
        comment: comment,
        enabled: enabled ?? true,
        dateAdded: _now,
        dateModified: _now,
      ),
    );
  }

  @override
  Future<Result<Unit>> deleteGroup(String name) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteGroup failure'));
    }
    return const Success(unit);
  }
}
