import 'package:result_dart/result_dart.dart';

abstract interface class ActionsRepository {
  Future<Result<Unit>> flushArp();

  Future<Result<Unit>> flushLogs();

  Stream<Result<List<String>>> updateGravity();

  Future<Result<Unit>> restartDns();
}
