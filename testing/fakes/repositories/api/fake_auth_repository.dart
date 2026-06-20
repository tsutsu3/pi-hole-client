import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/auth.dart';

class FakeAuthRepository implements AuthRepository {
  bool shouldFail = false;
  int getAllSessionsCallCount = 0;
  int createSessionCallCount = 0;
  int deleteCurrentSessionCallCount = 0;

  /// When true, a password-only login (totp == null) fails with
  /// [TotpRequiredException], mimicking a 2FA-enabled server.
  bool shouldRequireTotp = false;

  /// When set, a login whose totp does not equal this value fails with
  /// [TotpInvalidException]. Used to exercise the re-prompt loop.
  String? validTotp;

  /// Exceptions to return on successive totp-bearing [createSession] calls,
  /// consumed in order. Lets a test drive a reused/rate-limit sequence before a
  /// final success.
  final List<Exception> totpFailures = [];
  int _totpFailureIndex = 0;
  int _rateLimitFailureCount = 1;

  /// The totp passed to the most recent [createSession] call.
  String? lastTotp;

  @override
  Future<Result<Auth>> createSession(String password, {String? totp}) async {
    createSessionCallCount++;
    lastTotp = totp;
    if (shouldRequireTotp && totp == null) {
      return Failure(TotpRequiredException());
    }
    if (totp != null && _totpFailureIndex < totpFailures.length) {
      return Failure(totpFailures[_totpFailureIndex++]);
    }
    if (validTotp != null && totp != null && totp != validTotp) {
      return Failure(TotpInvalidException());
    }
    if (totp != null && _rateLimitFailureCount > 0) {
      _rateLimitFailureCount--;
      return Failure(TotpRateLimitException());
    }
    if (shouldFail) {
      return Failure(Exception('Force createSession failure'));
    }
    return Success(kRepoCreateSession);
  }

  @override
  Future<Result<Unit>> deleteCurrentSession() async {
    deleteCurrentSessionCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force deleteCurrentSession failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<List<AuthSession>>> getAllSessions() async {
    getAllSessionsCallCount++;
    if (shouldFail) {
      return Failure(Exception('Force getAllSessions failure'));
    }
    return Success(kRepoGetAllSessions);
  }

  @override
  Future<Result<Unit>> deleteSessionById(int id) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteSessionById failure'));
    }
    return const Success(unit);
  }
}
