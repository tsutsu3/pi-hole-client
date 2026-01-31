import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v5/realtime_status.dart';

class FakeRealTimeStatusRepository implements RealtimeStatusRepository {
  bool shouldFail = false;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch real-time status'));
    }
    return Success(kRepoFetchRealTimeStatus);
  }
}
