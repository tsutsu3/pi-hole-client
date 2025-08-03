import 'package:pi_hole_client/data/mapper/v6/config_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/config_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/config.dart';
import 'package:result_dart/result_dart.dart';

class ConfigRepositoryV6 implements ConfigRepository {
  ConfigRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<Config>> fetchDnsQueryLogging() async {
    return _fetchConfig(
      element: 'dns/queryLogging',
      isDetailed: false,
    );
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
        final result = await _client.getConfigElement(
          _sid,
          element: element,
          isDetailed: isDetailed,
        );
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  Future<Result<Config>> _updateConfig(Config config) async {
    return runWithResultRetry<Config>(
      action: () async {
        final configData = config.toData();
        final result = await _client.patchConfig(_sid, body: configData);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }
}
