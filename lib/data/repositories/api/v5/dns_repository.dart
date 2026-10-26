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
    final result = await _sendWithToken(_client.getSummaryRaw);

    return result.map(
      (summary) =>
          Blocking(status: convertBlockingStatus(summary.status), timer: null),
    );
  }

  @override
  Future<Result<Blocking>> enableBlocking() async {
    final result = await _sendWithToken(
      (token) => _client.postDnsBlocking(token, enabled: true),
    );

    return result.map((e) => e.toDomain());
  }

  @override
  Future<Result<Blocking>> disableBlocking(int timer) async {
    final result = await _sendWithToken(
      (token) => _client.postDnsBlocking(token, enabled: false, timer: timer),
    );

    return result.map((e) => e.toDomain());
  }

  /// Sends [request] with the token. When the token is rejected (401), reads
  /// the stored token again. When it changed, sends [request] once more.
  ///
  /// The stored token can change while the cached one is still in use, for
  /// example when the user edits the server.
  Future<Result<T>> _sendWithToken<T extends Object>(
    Future<Result<T>> Function(String token) request,
  ) async {
    try {
      final token = await getToken();
      final result = await request(token);
      if (!_isTokenRejected(result)) return result;

      await clearToken();
      final newToken = await getToken();
      if (newToken == token) return result;

      return await request(newToken);
    } on TokenNotFoundException catch (e) {
      return Failure(e);
    }
  }

  bool _isTokenRejected(Result<Object> result) {
    final error = result.exceptionOrNull();

    return error is HttpStatusCodeException && error.statusCode == 401;
  }
}
