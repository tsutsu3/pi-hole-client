import 'package:http/http.dart' as http;
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/auth.dart';
import 'package:pi_hole_client/domain/models/auth_session.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryV6 implements AuthRepository {
  AuthRepositoryV6({
    required String sid,
    required String url,
    http.Client? client,
    bool? allowSelfSignedCert,
  })  : _sid = sid,
        _client = PiholeV6ApiClient(
          url: url,
          client: client,
          allowSelfSignedCert: allowSelfSignedCert,
        );

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<Auth>> createSession(String password) {
    return runWithResultRetry<Auth>(
      action: () async {
        final session = await _client.postAuth(password: password);
        return Success(Auth.fromV6(session.getOrThrow()));
      },
    );
  }

  @override
  Future<Result<void>> deleteCurrentSession() async {
    return runWithResultRetry<Unit>(
      action: () async {
        await _client.deleteAuth(_sid);
        return const Success(unit);
      },
    );
  }

  @override
  Future<Result<List<AuthSession>>> getAllSessions() async {
    return runWithResultRetry<List<AuthSession>>(
      action: () async {
        final sessions = await _client.getAuthSessions(_sid);
        return Success(
          sessions.getOrThrow().sessions.map(AuthSession.fromV6).toList(),
        );
      },
    );
  }

  @override
  Future<Result<void>> deleteSessionById(int id) async {
    return runWithResultRetry<Unit>(
      action: () async {
        await _client.deleteAuthSession(_sid, id: id);
        return const Success(unit);
      },
    );
  }
}
