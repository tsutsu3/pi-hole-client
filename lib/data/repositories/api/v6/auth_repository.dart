import 'package:pi_hole_client/data/mapper/v6/auth_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV6 extends BaseV6SidRepository implements AuthRepository {
  AuthRepositoryV6({
    required PiholeV6ApiClient client,
    required super.sessionCache,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<Auth>> createSession(String password) async {
    return runWithResultRetry<Auth>(
      // POST /api/auth is non-idempotent - retrying creates duplicate sessions
      maxRetries: 0,
      action: () async {
        final result = await _client.postAuth(password: password);
        final auth = result.map((e) => e.toDomain());
        final value = auth.getOrNull();
        if (value != null && value.valid) {
          await saveSid(value.sid);
          await WidgetChannel.sendSidUpdated(
            serverAddress: serverAddress,
            sid: value.sid,
          );
        }
        return auth;
      },
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
      onRetry: (_) => clearAndRenewSid(),
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
      onRetry: (_) => clearAndRenewSid(),
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
      onRetry: (_) => clearAndRenewSid(),
    );
  }
}
