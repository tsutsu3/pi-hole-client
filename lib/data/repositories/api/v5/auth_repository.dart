import 'package:http/http.dart' as http;
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/domain/models/auth.dart';
import 'package:pi_hole_client/domain/models/auth_session.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV5 implements AuthRepository {
  AuthRepositoryV5({
    required String sid,
    required String url,
    http.Client? client,
    bool? allowSelfSignedCert,
  }) {
    // "Use" the parameters to suppress Lint
    sid.hashCode;
    url.hashCode;
    client.hashCode;
    allowSelfSignedCert.hashCode;
  }

  @override
  Future<Result<Auth>> createSession(String password) {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<void>> deleteCurrentSession() async {
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
  Future<Result<void>> deleteSessionById(int id) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}
