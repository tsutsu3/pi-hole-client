import 'package:pi_hole_client/data/mapper/v5/realtime_status_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/realtime_status_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/realtime_status/realtime_status.dart';
import 'package:result_dart/result_dart.dart';

class RealTimeStatusRepositoryV5 implements RealtimeStatusRepository {
  RealTimeStatusRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) : _token = token,
       _client = client;

  final String _token;
  final PiholeV5ApiClient _client;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() async {
    return runWithResultRetry(
      action: () async {
        final response = await _client.getRealTimeStatus(_token);
        return Success(response.getOrThrow().toDomain());
      },
    );
  }
}
