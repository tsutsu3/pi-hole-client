import 'package:pi_hole_client/data/model/local/gravity_db_data.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/model/gravity/gravity_snapshot.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class GravityRepository {
  Future<Result<GravityUpdateData>> fetchGravityUpdate(String address);
  Future<Result<int>> upsertGravityUpdate(
    String address,
    DateTime startTime,
    DateTime endTime,
    GravityStatus status,
  );
  Future<Result<int>> deleteGravityUpdate(String address);
  Future<Result<List<GravityLogData>>> fetchGravityLogs(String address);
  Future<Result<int>> insertGravityLogs(
    String address,
    List<({int line, String message, DateTime timestamp})> entries,
  );
  Future<Result<int>> deleteGravityLogs(String address);
  Future<Result<List<GravityMessageData>>> fetchGravityMessages(String address);
  Future<Result<int>> insertGravityMessages(
    String address,
    List<FtlMessage> messages,
  );
  Future<Result<int>> deleteGravityMessages(String address);
  Future<Result<int>> deleteGravityMessage(String address, int id);
  Future<Result<GravitySnapshot>> fetchGravityData(String address);
  Future<Result<int>> deleteGravityData(String address);
  Future<Result<int>> deleteAllGravityData();
}
