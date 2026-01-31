import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:result_dart/result_dart.dart';

// ignore: one_member_abstracts
abstract interface class GroupRepository {
  /// Fetches a list of groups.
  Future<Result<List<Group>>> fetchGroups();
}
