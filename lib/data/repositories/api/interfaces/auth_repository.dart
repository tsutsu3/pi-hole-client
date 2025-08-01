import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  /// Submit password for login
  Future<Result<void>> createSession(String password);

  /// Get current session
  Future<Result<void>> deleteCurrentSession();

  /// Get all sessions
  Future<Result<void>> getAllSessions();

  /// Delete session by ID
  Future<Result<void>> deleteSessionById(int id);
}
