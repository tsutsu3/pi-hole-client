import 'package:pi_hole_client/data/mapper/v6/dns_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:result_dart/result_dart.dart';

class DnsRepositoryV6 extends BaseV6SidRepository implements DnsRepository {
  DnsRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<Blocking>> fetchBlockingStatus() async {
    return runWithResultRetry<Blocking>(
      action: () async {
        final sid = await getSid();
        final result = await _client.getDnsBlocking(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Blocking>> enableBlocking() async {
    return _updateBlockingStatus(true);
  }

  @override
  Future<Result<Blocking>> disableBlocking(int timer) async {
    return _updateBlockingStatus(false, timer: timer);
  }

  Future<Result<Blocking>> _updateBlockingStatus(
    bool enabled, {
    int? timer,
  }) async {
    return runWithResultRetry<Blocking>(
      action: () async {
        final sid = await getSid();
        final time = enabled ? null : timer;
        final result = await _client.postDnsBlocking(
          sid,
          enabled: enabled,
          timer: time,
        );
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }
}
