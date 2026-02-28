import 'package:pi_hole_client/data/model/local/gravity_db_data.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class GravityRepository {
  Future<Result<GravityUpdateData>> fetchGravityUpdate(String address);
  Future<Result<int>> upsertGravityUpdate(GravityUpdateData gravityUpdateData);
  Future<Result<int>> deleteGravityUpdate(String address);
  Future<Result<List<GravityLogData>>> fetchGravityLogs(String address);
  Future<Result<int>> insertGravityLogs(List<GravityLogData> gravityLogsDataList);
  Future<Result<int>> deleteGravityLogs(String address);
  Future<Result<List<GravityMessageData>>> fetchGravityMessages(String address);
  Future<Result<int>> insertGravityMessages(List<GravityMessageData> messagesList);
  Future<Result<int>> deleteGravityMessages(String address);
  Future<Result<int>> deleteGravityMessage(String address, int id);
  Future<Result<GravityData>> fetchGravityData(String address);
  Future<Result<int>> deleteGravityData(String address);
  Future<Result<int>> deleteAllGravityData();
}
