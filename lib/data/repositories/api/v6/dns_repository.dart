import 'package:pi_hole_client/data/mapper/v6/dns_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:pi_hole_client/domain/models/dns/dns.dart';
import 'package:result_dart/result_dart.dart';

class DnsRepositoryV6 implements DnsRepository {
  DnsRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<Blocking>> fetchBlockingStatus() async {
    return runWithResultRetry<Blocking>(
      action: () async {
        final result = await _client.getDnsBlocking(_sid);
        return Success(result.getOrThrow().toDomain());
      },
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
        final time = enabled ? null : timer;
        final result =
            await _client.postDnsBlocking(_sid, enabled: enabled, timer: time);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }
}
