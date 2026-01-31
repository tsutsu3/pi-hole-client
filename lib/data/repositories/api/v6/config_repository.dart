import 'package:pi_hole_client/data/mapper/v6/config_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/config_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/config/config.dart';
import 'package:result_dart/result_dart.dart';

class ConfigRepositoryV6 extends BaseV6SidRepository
    implements ConfigRepository {
  ConfigRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<Config>> fetchDnsQueryLogging() async {
    return _fetchConfig(element: 'dns/queryLogging', isDetailed: false);
  }

  @override
  Future<Result<Config>> setDnsQueryLogging(bool status) async {
    final config = Config(dns: Dns(queryLogging: status));
    return _updateConfig(config);
  }

  Future<Result<Config>> _fetchConfig({
    String? element,
    bool? isDetailed,
  }) async {
    return runWithResultRetry<Config>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getConfigElement(
          sid,
          element: element,
          isDetailed: isDetailed,
        );
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  Future<Result<Config>> _updateConfig(Config config) async {
    return runWithResultRetry<Config>(
      action: () async {
        final sid = await getSid();
        final configData = config.toData();
        final result = await _client.patchConfig(sid, body: configData);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }
}
