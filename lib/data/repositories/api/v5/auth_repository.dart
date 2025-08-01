import 'package:http/http.dart' as http;
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/auth.dart';
import 'package:pi_hole_client/domain/models/auth_session.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV5 implements AuthRepository {
  AuthRepositoryV5({
    required String sid,
    required PiholeV5ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    sid.hashCode;
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
