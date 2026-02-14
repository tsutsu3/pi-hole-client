import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:result_dart/result_dart.dart';

class FakeActionsRepository implements ActionsRepository {
  bool shouldFail = false;
  Stream<Result<List<String>>> Function()? customGravityStream;

  @override
  Future<Result<Unit>> flushArp() async {
    if (shouldFail) return Failure(Exception('Force flushArp failure'));
    return const Success(unit);
  }

  @override
  Future<Result<Unit>> flushLogs() async {
    if (shouldFail) return Failure(Exception('Force flushLogs failure'));
    return const Success(unit);
  }

  @override
  Stream<Result<List<String>>> updateGravity() async* {
    if (customGravityStream != null) {
      yield* customGravityStream!();
      return;
    }
    if (shouldFail) {
      yield Failure(Exception('Force updateGravity failure'));
      return;
    }
    yield const Success(['Done']);
  }

  @override
  Future<Result<Unit>> restartDns() async {
    if (shouldFail) return Failure(Exception('Force restartDns failure'));
    return const Success(unit);
  }
}
