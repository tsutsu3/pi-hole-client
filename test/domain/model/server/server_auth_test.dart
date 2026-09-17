import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/model/server/server_auth.dart';

void main() {
  Server server(String apiVersion) => Server(
    address: 'http://localhost',
    alias: 'test',
    apiVersion: apiVersion,
  );

  group('ServerAuth.of', () {
    test('returns NoAuth for v6 with an empty password', () {
      final auth = ServerAuth.of(server(SupportedApiVersions.v6), (
        password: '',
        token: 'unused',
      ));

      expect(auth, isA<NoAuth>());
    });

    test('returns PasswordAuth for v6 with a password', () {
      final auth = ServerAuth.of(server(SupportedApiVersions.v6), (
        password: 'secret',
        token: 'unused',
      ));

      expect(auth, isA<PasswordAuth>());
      expect((auth as PasswordAuth).password, 'secret');
    });

    test('does not trim a v6 password', () {
      final auth = ServerAuth.of(server(SupportedApiVersions.v6), (
        password: '   ',
        token: 'unused',
      ));

      expect(auth, isA<PasswordAuth>());
      expect((auth as PasswordAuth).password, '   ');
    });

    test('returns TokenAuth for v5', () {
      final auth = ServerAuth.of(server(SupportedApiVersions.v5), (
        password: 'unused',
        token: 'token',
      ));

      expect(auth, isA<TokenAuth>());
      expect((auth as TokenAuth).token, 'token');
    });

    test('defaults an unknown API version to TokenAuth', () {
      final auth = ServerAuth.of(server('v99'), (
        password: 'unused',
        token: 'token',
      ));

      expect(auth, isA<TokenAuth>());
      expect((auth as TokenAuth).token, 'token');
    });
  });

  group('V6ServerAuth.of', () {
    test('returns NoAuth for an empty password', () {
      expect(V6ServerAuth.of(''), isA<NoAuth>());
    });

    test('returns PasswordAuth for a non-empty password', () {
      final auth = V6ServerAuth.of('secret');

      expect(auth, isA<PasswordAuth>());
      expect((auth as PasswordAuth).password, 'secret');
    });
  });
}
