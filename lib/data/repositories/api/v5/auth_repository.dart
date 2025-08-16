import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV5 extends BaseV5TokenRepository implements AuthRepository {
  AuthRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) {
    // "Use" the parameters to suppress Lint
    client.hashCode;
  }

  @override
  Future<Result<Auth>> createSession(String password) {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteCurrentSession() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<List<AuthSession>>> getAllSessions() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteSessionById(int id) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
