import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/list/adlist.dart';
import 'package:result_dart/result_dart.dart';

class ActionsRepositoryV5 implements AdListRepository {
  ActionsRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    token.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<List<Adlist>>> fetchAdlists({
    String? adlist,
    ListType? type,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
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
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
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
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteAdlist(
    String address, {
    ListType? type,
  }) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
