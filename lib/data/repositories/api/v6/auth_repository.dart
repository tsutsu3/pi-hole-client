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
  Future<Result<Auth>> createSession(String password, {String? totp}) async {
    return runWithResultRetry<Auth>(
      // POST /api/auth is non-idempotent - retrying creates duplicate sessions
      maxRetries: 0,
      action: () async {
        final result = await _client.postAuth(
          password: password,
          totp: totp != null ? int.parse(totp) : null,
        );
        final auth = result.map((e) => e.toDomain());
        final value = auth.getOrNull();
        // Persist only a real sid. An empty sid (no app password) is
        // intentionally not saved; any leftover sid is harmless since a
        // password-less v6 server ignores the sid header.
        if (value != null && value.valid && value.sid.isNotEmpty) {
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
  Future<Result<Auth>> getAuth({bool useSid = true}) async {
    // [useSid] false reads the server's 2FA status unauthenticated.
    return runWithResultRetry<Auth>(
      action: () async {
        final sid = useSid ? await getSid() : null;
        final result = await _client.getAuth(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: useSid ? (_, e) => renewSidIfExpired(e) : null,
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
      onRetry: (_, e) => renewSidIfExpired(e),
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
      onRetry: (_, e) => renewSidIfExpired(e),
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
      onRetry: (_, e) => renewSidIfExpired(e),
    );
  }
}
