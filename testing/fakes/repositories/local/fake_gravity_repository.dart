import 'package:pi_hole_client/data/model/local/gravity_db_data.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/gravity_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/model/gravity/gravity_snapshot.dart';
import 'package:result_dart/result_dart.dart';

class FakeGravityRepository implements GravityRepository {
  final _start = DateTime.fromMillisecondsSinceEpoch(1641031200000);
  final _end = DateTime.fromMillisecondsSinceEpoch(1641032200000);
  final _timestamp = DateTime.fromMillisecondsSinceEpoch(1641032200000);

  GravityStatus status = GravityStatus.success;

  @override
  Future<Result<GravityUpdateData>> fetchGravityUpdate(String address) async {
    return Success(
      GravityUpdateData(
        address: address,
        startTime: _start,
        endTime: _end,
        status: status.index,
      ),
    );
  }

  @override
  Future<Result<int>> upsertGravityUpdate(
    String address,
    DateTime startTime,
    DateTime endTime,
    GravityStatus status,
  ) async {
    return const Success(1);
  }

  @override
  Future<Result<int>> deleteGravityUpdate(String address) async {
    return const Success(1);
  }

  @override
  Future<Result<List<GravityLogData>>> fetchGravityLogs(String address) async {
    return Success([
      GravityLogData(
        address: address,
        line: 1,
        message: 'Test Log',
        timestamp: _timestamp,
      ),
    ]);
  }

  @override
  Future<Result<int>> insertGravityLogs(
    String address,
    List<({int line, String message, DateTime timestamp})> entries,
  ) async {
    return const Success(10);
  }

  @override
  Future<Result<int>> deleteGravityLogs(String address) async {
    return const Success(10);
  }

  @override
  Future<Result<List<GravityMessageData>>> fetchGravityMessages(
    String address,
  ) async {
    return Success([
      GravityMessageData(
        id: 1,
        address: address,
        message: 'Test message',
        url: 'http://localhost/test.xt',
        timestamp: _timestamp,
      ),
    ]);
  }

  @override
  Future<Result<int>> insertGravityMessages(
    String address,
    List<FtlMessage> messages,
  ) async {
    return const Success(10);
  }

  @override
  Future<Result<int>> deleteGravityMessages(String address) async {
    return const Success(10);
  }

  @override
  Future<Result<int>> deleteGravityMessage(String address, int id) async {
    return const Success(10);
  }

  @override
  Future<Result<GravitySnapshot>> fetchGravityData(String address) async {
    return Success(
      GravitySnapshot(
        status: status,
        logs: ['Test log'],
        messages: [
          FtlMessage(
            id: 1,
            timestamp: _timestamp,
            message: 'Test message',
            url: 'https://example.com',
          ),
        ],
        startedAt: _start,
        completedAt: _end,
      ),
    );
  }

  @override
  Future<Result<int>> deleteGravityData(String address) async {
    return const Success(21);
  }

  @override
  Future<Result<int>> deleteAllGravityData() async {
    return const Success(100);
  }
}
