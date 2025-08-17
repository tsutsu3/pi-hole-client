import 'package:pi_hole_client/data/repositories/api/v5/realtime_status_repository.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../models/v5/realtime_status.dart';
import 'fake_base_v5_token_repository.dart';

class FakeRealTimeStatusRepositoryV5 extends FakeBaseV5TokenRepository
    implements RealTimeStatusRepositoryV5 {
  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    if (shouldFail) {
      return Failure(Exception('Failed to fetch real-time status'));
    }
    return Success(kRepoFetchRealTimeStatus);
  }
}
