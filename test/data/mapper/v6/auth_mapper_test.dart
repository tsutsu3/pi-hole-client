import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/mapper/v6/auth_mapper.dart';
import 'package:pi_hole_client/data/model/v6/auth/auth.dart' as s;
import 'package:pi_hole_client/data/model/v6/auth/sessions.dart' as s;
import 'package:pi_hole_client/domain/model/enums.dart';

const _sessionData = s.SessionData(
  id: 1,
  currentSession: true,
  valid: true,
  tls: s.Tls(login: true, mixed: false),
  app: false,
  cli: true,
  loginAt: 1700000000,
  lastActive: 1700003600,
  validUntil: 1700007200,
  remoteAddr: '192.168.1.100',
  userAgent: 'TestAgent/1.0',
);

void main() {
  group('SessionMapper (v6)', () {
    test('maps all fields correctly', () {
      final source = s.Session(
        session: s.SessionDetail(
          valid: true,
          totp: false,
          sid: 'session-id-123',
          csrf: 'csrf-token-abc',
          validity: 1800,
          message: 'OK',
        ),
        took: 0.001,
      );

      final domain = source.toDomain();

      expect(domain.valid, isTrue);
      expect(domain.totp, isFalse);
      expect(domain.sid, 'session-id-123');
      expect(domain.csrf, 'csrf-token-abc');
      expect(domain.validity, 1800);
      expect(domain.message, 'OK');
    });
  });

  group('AuthSessionsMapper (v6)', () {
    test('maps all fields correctly', () {
      const source = s.AuthSessions(sessions: [_sessionData], took: 0.001);
      final result = source.toDomain();

      expect(result.length, 1);
      final session = result[0];
      expect(session.id, 1);
      expect(session.isCurrentSession, isTrue);
      expect(session.isValid, isTrue);
      expect(session.tlsStatus, TlsStatus.login);
      expect(session.isApp, isFalse);
      expect(session.isCli, isTrue);
      expect(
        session.loginAt,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        session.lastActive,
        DateTime.fromMillisecondsSinceEpoch(1700003600 * 1000),
      );
      expect(
        session.validUntil,
        DateTime.fromMillisecondsSinceEpoch(1700007200 * 1000),
      );
      expect(session.clientIp, '192.168.1.100');
      expect(session.userAgent, 'TestAgent/1.0');
    });

    test('returns empty list when sessions is empty', () {
      const source = s.AuthSessions(sessions: [], took: 0.001);
      expect(source.toDomain(), isEmpty);
    });
  });

  group('convertTlsStatus', () {
    test('login=true → TlsStatus.login', () {
      const tls = s.Tls(login: true, mixed: false);
      expect(convertTlsStatus(tls), TlsStatus.login);
    });

    test('login=false, mixed=true → TlsStatus.mixed', () {
      const tls = s.Tls(login: false, mixed: true);
      expect(convertTlsStatus(tls), TlsStatus.mixed);
    });

    test('login=false, mixed=false → TlsStatus.none', () {
      const tls = s.Tls(login: false, mixed: false);
      expect(convertTlsStatus(tls), TlsStatus.none);
    });
  });
}
