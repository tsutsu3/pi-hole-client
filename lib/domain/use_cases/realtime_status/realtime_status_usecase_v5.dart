import 'package:pi_hole_client/data/repositories/api/v5/realtime_status_repository.dart';
import 'package:pi_hole_client/domain/model/realtime_status/realtime_status.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase.dart';
import 'package:result_dart/result_dart.dart';

class RealtimeStatusUseCaseV5 implements RealtimeStatusUseCase {
  RealtimeStatusUseCaseV5({required RealTimeStatusRepositoryV5 repository})
    : _repository = repository;

  final RealTimeStatusRepositoryV5 _repository;

  @override
  Future<Result<RealtimeStatus>> fetchRealtimeStatus() {
    return _repository.fetchRealtimeStatus();
  }
}
