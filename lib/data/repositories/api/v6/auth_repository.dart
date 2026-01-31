import 'package:pi_hole_client/data/mapper/v6/auth_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV6 extends BaseV6SidRepository implements AuthRepository {
  AuthRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<Auth>> createSession(String password) async {
    return runWithResultRetry<Auth>(
      action: () async {
        final result = await _client.postAuth(password: password);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteCurrentSession() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteAuth(sid);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<List<AuthSession>>> getAllSessions() async {
    return runWithResultRetry<List<AuthSession>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getAuthSessions(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteSessionById(int id) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteAuthSession(sid, id: id);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }
}
