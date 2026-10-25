import 'package:pi_hole_client/data/mapper/v5/dns_mapper.dart';
import 'package:pi_hole_client/data/mapper/v6/dns_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

class DnsRepositoryV5 extends BaseV5TokenRepository implements DnsRepository {
  DnsRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) : _client = client;

  final PiholeV5ApiClient _client;

  @override
  Future<Result<Blocking>> fetchBlockingStatus({
    bool skipRenewal = false,
  }) async {
    try {
      final token = await getToken();
      final result = await _client.getSummaryRaw(token);

      return result.map(
        (summary) => Blocking(
          status: convertBlockingStatus(summary.status),
          timer: null,
        ),
      );
    } on TokenNotFoundException catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<Blocking>> enableBlocking() async {
    try {
      final token = await getToken();
      final result = await _client.postDnsBlocking(token, enabled: true);

      return result.map((e) => e.toDomain());
    } on TokenNotFoundException catch (e) {
      return Failure(e);
    }
  }

  @override
  Future<Result<Blocking>> disableBlocking(int timer) async {
    try {
      final token = await getToken();
      final result = await _client.postDnsBlocking(
        token,
        enabled: false,
        timer: timer,
      );

      return result.map((e) => e.toDomain());
    } on TokenNotFoundException catch (e) {
      return Failure(e);
    }
  }
}
