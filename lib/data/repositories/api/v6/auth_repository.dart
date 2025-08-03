import 'package:pi_hole_client/data/mapper/v6/auth_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/auth/auth.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV6 implements AuthRepository {
  AuthRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<Auth>> createSession(String password) async {
    return runWithResultRetry<Auth>(
      action: () async {
        final result = await _client.postAuth(password: password);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteCurrentSession() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.deleteAuth(_sid);
        return Success(result.getOrThrow());
      },
    );
  }

  @override
  Future<Result<List<AuthSession>>> getAllSessions() async {
    return runWithResultRetry<List<AuthSession>>(
      action: () async {
        final result = await _client.getAuthSessions(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteSessionById(int id) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.deleteAuthSession(_sid, id: id);
        return Success(result.getOrThrow());
      },
    );
  }
}
