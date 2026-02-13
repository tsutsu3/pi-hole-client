import 'package:pi_hole_client/data/model/v6/config/config.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:result_dart/result_dart.dart';

class LocalDnsRepositoryV6 extends BaseV6SidRepository
    implements LocalDnsRepository {
  LocalDnsRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<List<LocalDns>>> fetchRecords() async {
    return runWithResultRetry<List<LocalDns>>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getConfigElement(
          sid,
          element: 'dns/hosts',
        );
        return result.map((config) => _parseHosts(config.config?.dns?.hosts));
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> addRecord({
    required String ip,
    required String name,
  }) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        return _client.putConfigElement(
          sid,
          element: 'dns/hosts',
          value: '$ip $name',
        );
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteRecord({
    required String ip,
    required String name,
  }) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        return _client.deleteConfigElement(
          sid,
          element: 'dns/hosts',
          value: '$ip $name',
        );
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> updateRecord({
    required LocalDns record,
    required String oldIp,
  }) async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();

        // 1. Fetch current hosts list
        final configResult = await _client.getConfigElement(
          sid,
          element: 'dns/hosts',
        );
        final config = configResult.getOrThrow();
        final hosts = List<String>.from(config.config?.dns?.hosts ?? []);

        // 2. Find and replace the entry matching oldIp
        final oldEntry = hosts.indexWhere((h) => h.startsWith('$oldIp '));
        if (oldEntry == -1) {
          throw Exception('Entry with IP $oldIp not found');
        }
        hosts[oldEntry] = '${record.ip} ${record.name}';

        // 3. Patch config with updated hosts list
        final patchResult = await _client.patchConfig(
          sid,
          body: ConfigData(dns: Dns(hosts: hosts)),
        );
        return patchResult.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  List<LocalDns> _parseHosts(List<String>? hosts) {
    if (hosts == null || hosts.isEmpty) return [];
    return hosts.map((entry) {
      final parts = entry.split(' ');
      return LocalDns(ip: parts[0], name: parts.length > 1 ? parts[1] : '');
    }).toList();
  }
}
