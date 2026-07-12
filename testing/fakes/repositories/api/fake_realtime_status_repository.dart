import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

import '../../../models/v5/realtime_status.dart';

class FakeRealTimeStatusRepository implements RealtimeStatusRepository {
  bool shouldFail = false;

  /// Error returned when [shouldFail] is true. Lets tests inject a specific
  /// failure (e.g. a 495 TLS error) instead of the generic one.
  Exception? failureError;

  /// Optional override for the returned status.
  RealtimeStatus? response;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    if (shouldFail) {
      return Failure(
        failureError ?? Exception('Failed to fetch real-time status'),
      );
    }
    return Success(response ?? kRepoFetchRealTimeStatus);
  }
}
