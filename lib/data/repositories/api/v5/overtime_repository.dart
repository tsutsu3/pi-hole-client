import 'package:pi_hole_client/data/mapper/v5/overtime_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/overtime_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

class OverTimeRepositoryV5 implements OverTimeRepository {
  OverTimeRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  }) : _token = token,
       _client = client;

  final String _token;
  final PiholeV5ApiClient _client;

  @override
  Future<Result<OverTime>> fetchOverTime() async {
    return runWithResultRetry(
      action: () async {
        final response = await _client.getOverTimeData(_token);
        return Success(response.getOrThrow().toDomain());
      },
    );
  }
}
