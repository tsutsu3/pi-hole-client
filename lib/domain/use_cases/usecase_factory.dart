import 'package:pi_hole_client/config/api_versions.dart';
import 'package:pi_hole_client/data/repositories/api/v5/realtime_status_repository.dart';
// import 'package:pi_hole_client/data/repositories/api/v6/dns_repository.dart';
// import 'package:pi_hole_client/data/repositories/api/v6/ftl_repository.dart';
// import 'package:pi_hole_client/data/repositories/api/v6/metrics_repository.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase.dart';
import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v5.dart';
// import 'package:pi_hole_client/domain/use_cases/realtime_status/realtime_status_usecase_v6.dart';

class UseCaseFactory {
  RealtimeStatusUseCase createRealtimeStatusUseCase({
    required String apiVersion,
    required RealTimeStatusRepositoryV5 realTimeStatusRepository,
    // required MetricsRepositoryV6 metricsRepository,
    // required FtlRepositoryV6 ftlRepository,
    // required DnsRepositoryV6 dnsRepository,
  }) {
    switch (apiVersion) {
      case SupportedApiVersions.v5:
        return RealtimeStatusUseCaseV5(repository: realTimeStatusRepository);
      // case SupportedApiVersions.v6:
      //   return RealtimeStatusUseCaseV6(
      //     metricsRepository: metricsRepository,
      //     ftlRepository: ftlRepository,
      //     dnsRepository: dnsRepository,
      //   );
      default:
        throw UnsupportedError('Unsupported API version: $apiVersion');
    }
  }
}
