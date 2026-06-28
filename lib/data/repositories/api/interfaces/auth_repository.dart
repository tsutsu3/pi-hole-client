import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  /// Submit password for login.
  ///
  /// When the server has 2FA (TOTP) enabled, pass the 6-digit [totp] code.
  /// Omitting it on a 2FA server fails with [TotpRequiredException]; a wrong
  /// code fails with [TotpInvalidException].
  Future<Result<Auth>> createSession(String password, {String? totp});

  /// Check if authentication is required
  Future<Result<Auth>> getAuth({bool useSid = true});

  /// Get current session
  Future<Result<Unit>> deleteCurrentSession();

  /// Get all sessions
  Future<Result<List<AuthSession>>> getAllSessions();

  /// Delete session by ID
  Future<Result<Unit>> deleteSessionById(int id);
}
