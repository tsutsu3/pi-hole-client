import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/model/v5/dns.dart' as v5;
import 'package:pi_hole_client/data/model/v5/summary_raw.dart';
import 'package:pi_hole_client/data/repositories/api/v5/dns_repository.dart';
import 'package:pi_hole_client/domain/model/dns/dns.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../testing/fakes/services/fake_pihole_v5_api_client.dart';
import '../../../../../testing/fakes/services/fake_session_credential_service.dart';

/// Checks that [result] is a Failure with a TokenNotFoundException.
void expectTokenNotFound(Result<Blocking> result) {
  expect(result.exceptionOrNull(), isA<TokenNotFoundException>());
}

/// A client that records the sent tokens. It fails with [failStatusCode] when
/// set. Otherwise it rejects any token other than [validToken] with a 401.
class _TokenCheckingClient extends FakePiholeV5ApiClient {
  String validToken = 'old';
  int? failStatusCode;
  final sentTokens = <String>[];

  /// Returns the error for [token], or null when the request succeeds.
  HttpStatusCodeException? _errorFor(String token) {
    sentTokens.add(token);
    if (failStatusCode != null) return HttpStatusCodeException(failStatusCode!);
    if (token != validToken) return HttpStatusCodeException(401);

    return null;
  }

  @override
  Future<Result<SummaryRaw>> getSummaryRaw(String token) async {
    final error = _errorFor(token);
    if (error != null) return Failure(error);

    return super.getSummaryRaw(token);
  }

  @override
  Future<Result<v5.Blocking>> postDnsBlocking(
    String token, {
    required bool enabled,
    int? timer,
  }) async {
    final error = _errorFor(token);
    if (error != null) return Failure(error);

    return super.postDnsBlocking(token, enabled: enabled, timer: timer);
  }
}

/// Checks the result and the tokens sent by [client].
/// A null [statusCode] means the result is a success.
void _expectSent(
  Result<Blocking> result,
  _TokenCheckingClient client, {
  required int? statusCode,
  required List<String> tokens,
}) {
  expect(
    result.exceptionOrNull(),
    statusCode == null
        ? isNull
        : isA<HttpStatusCodeException>().having(
            (e) => e.statusCode,
            'statusCode',
            statusCode,
          ),
  );
  expect(client.sentTokens, tokens);
}

/// The methods that send the token, called the same way in each test.
final _blockingCalls =
    <String, Future<Result<Blocking>> Function(DnsRepositoryV5)>{
      'fetchBlockingStatus': (repo) => repo.fetchBlockingStatus(),
      'enableBlocking': (repo) => repo.enableBlocking(),
      'disableBlocking': (repo) => repo.disableBlocking(30),
    };

void main() {
  late DnsRepositoryV5 repository;
  late FakePiholeV5ApiClient client;
  late FakeSessionCredentialService creds;

  setUp(() {
    client = FakePiholeV5ApiClient();
    creds = FakeSessionCredentialService();
    repository = DnsRepositoryV5(client: client, creds: creds);
  });

  group('fetchBlockingStatus', () {
    test('should return blocking status on success', () async {
      final result = await repository.fetchBlockingStatus();
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.enabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.fetchBlockingStatus();
      expect(result.isError(), true);
    });

    test(
      'should return TokenNotFoundException when the token cannot be read',
      () async {
        creds.shouldFailRead = true;
        final result = await repository.fetchBlockingStatus();
        expectTokenNotFound(result);
      },
    );
  });

  group('enableBlocking', () {
    test('should return enabled status on success', () async {
      final result = await repository.enableBlocking();
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.enabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.enableBlocking();
      expect(result.isError(), true);
    });

    test(
      'should return TokenNotFoundException when the token cannot be read',
      () async {
        creds.shouldFailRead = true;
        final result = await repository.enableBlocking();
        expectTokenNotFound(result);
      },
    );
  });

  group('disableBlocking', () {
    test('should return disabled status on success', () async {
      final result = await repository.disableBlocking(30);
      expect(result.isSuccess(), true);
      expect(result.getOrThrow().status, DnsBlockingStatus.disabled);
    });

    test('should return error on failure', () async {
      client.shouldFail = true;
      final result = await repository.disableBlocking(30);
      expect(result.isError(), true);
    });

    test(
      'should return TokenNotFoundException when the token cannot be read',
      () async {
        creds.shouldFailRead = true;
        final result = await repository.disableBlocking(30);
        expectTokenNotFound(result);
      },
    );
  });

  for (final MapEntry(key: name, value: call) in _blockingCalls.entries) {
    group('$name with a rejected token', () {
      late _TokenCheckingClient tokenClient;
      late DnsRepositoryV5 repo;

      setUp(() async {
        tokenClient = _TokenCheckingClient();
        creds.addressToken = 'old';
        repo = DnsRepositoryV5(client: tokenClient, creds: creds);

        // Cache the 'old' token.
        await call(repo);
        tokenClient.sentTokens.clear();
      });

      test(
        'sends again with the new token after the stored token changes',
        () async {
          creds.addressToken = 'new';
          tokenClient.validToken = 'new';

          final result = await call(repo);

          _expectSent(
            result,
            tokenClient,
            statusCode: null,
            tokens: ['old', 'new'],
          );
        },
      );

      test('does not send again when the stored token is the same', () async {
        tokenClient.validToken = 'new';

        final result = await call(repo);

        _expectSent(result, tokenClient, statusCode: 401, tokens: ['old']);
      });

      test('does not send again on a failure other than 401', () async {
        creds.addressToken = 'new';
        tokenClient.failStatusCode = 504;

        final result = await call(repo);

        _expectSent(result, tokenClient, statusCode: 504, tokens: ['old']);
      });
    });
  }
}
