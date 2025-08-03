import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models/list/adlist.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AdListRepository {
  /// Retrieves Adlists, optionally filtered by address or type.
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  });

  /// Adds a new Adlist.
  Future<Result<Adlist>> addAdlist(
    String address,
    ListType type, {
    List<int> groups = const [0],
    String? comment = '',
    bool? enabled = true,
  });

  /// Updates an existing Adlist.
  Future<Result<Adlist>> updateAdlist(
    String address,
    ListType type, {
    List<int> groups = const [0],
    String? comment = '',
    bool? enabled = true,
  });

  /// Deletes an Adlist by address and optional type.
  Future<Result<Unit>> deleteAdlist(
    String address, {
    ListType? type,
  });
}
