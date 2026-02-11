import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v6/auth.dart';

class FakeAuthRepository implements AuthRepository {
  bool shouldFail = false;
  int getAllSessionsCallCount = 0;

  @override
  Future<Result<Auth>> createSession(String password) async {
    if (shouldFail) {
      return Failure(Exception('Force createSession failure'));
    }
    return Success(kRepoCreateSession);
  }

  @override
  Future<Result<Unit>> deleteCurrentSession() async {
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
