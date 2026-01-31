import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  /// Submit password for login
  Future<Result<Auth>> createSession(String password);

  /// Get current session
  Future<Result<Unit>> deleteCurrentSession();

  /// Get all sessions
  Future<Result<List<AuthSession>>> getAllSessions();

  /// Delete session by ID
  Future<Result<Unit>> deleteSessionById(int id);
}
