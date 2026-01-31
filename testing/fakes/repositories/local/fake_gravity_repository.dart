import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
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
    GravityUpdateData gravityUpdateData,
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
    List<GravityLogData> gravityLogsDataList,
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
    List<GravityMessageData> messagesList,
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
  Future<Result<GravityData>> fetchGravityData(String address) async {
    return Success(
      GravityData(
        gravityUpdate: GravityUpdateData(
          address: address,
          startTime: _start,
          endTime: _end,
          status: status.index,
        ),
        gravityLogs: [
          GravityLogData(
            address: address,
            line: 1,
            message: 'Test log',
            timestamp: _timestamp,
          ),
        ],
        gravityMessages: [
          GravityMessageData(
            id: 1,
            address: address,
            message: 'Test message',
            url: 'https://example.com',
            timestamp: _timestamp,
          ),
        ],
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
