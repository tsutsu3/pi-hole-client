// ignore_for_file: one_member_abstracts
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class RealtimeStatusUseCase {
  Future<Result<RealtimeStatus>> fetchRealtimeStatus();
}
