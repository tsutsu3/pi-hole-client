import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

// ignore: one_member_abstracts
abstract interface class RealtimeStatusRepository {
  Future<Result<RealtimeStatus>> fetchRealtimeStatus();
}
