import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/mapper/v6_generated/auth_mapper.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

void main() {
  group('SessionSessionMapper', () {
    test('maps all fields correctly', () {
      final session = SessionSession(
        valid: true,
        totp: false,
        sid: 'test-sid-123',
        csrf: 'csrf-token',
        validity: 300,
        message: 'correct password',
      );

      final auth = session.toDomain();

      expect(auth.valid, true);
      expect(auth.totp, false);
      expect(auth.sid, 'test-sid-123');
      expect(auth.csrf, 'csrf-token');
      expect(auth.validity, 300);
      expect(auth.message, 'correct password');
    });

    test('handles null optional fields', () {
      final session = SessionSession(
        valid: false,
        totp: true,
        sid: null,
        validity: 0,
        message: null,
      );

      final auth = session.toDomain();

      expect(auth.valid, false);
      expect(auth.totp, true);
      expect(auth.sid, '');
      expect(auth.csrf, '');
      expect(auth.validity, 0);
      expect(auth.message, '');
    });
  });

  group('GetAuth200ResponseMapper', () {
    test('delegates to SessionSession.toDomain()', () {
      final response = GetAuth200Response(
        session: SessionSession(
          valid: true,
          totp: false,
          sid: 'sid-abc',
          validity: 600,
          message: 'OK',
        ),
      );

      final auth = response.toDomain();

      expect(auth.valid, true);
      expect(auth.sid, 'sid-abc');
      expect(auth.validity, 600);
    });
  });

  group('SessionsListSessionsInnerMapper', () {
    test('maps all fields correctly', () {
      final session = SessionsListSessionsInner(
        id: 42,
        valid: true,
        currentSession: true,
        tls: SessionsListSessionsInnerTls(login: true, mixed: false),
        app: false,
        cli: false,
        loginAt: 1700000000,
        lastActive: 1700001000,
        validUntil: 1700002000,
        remoteAddr: '192.168.1.1',
        userAgent: 'PiholeClient/1.0',
      );

      final authSession = session.toDomain();

      expect(authSession.id, 42);
      expect(authSession.isValid, true);
      expect(authSession.isCurrentSession, true);
      expect(authSession.tlsStatus, TlsStatus.login);
      expect(authSession.isApp, false);
      expect(authSession.isCli, false);
      expect(
        authSession.loginAt,
        DateTime.fromMillisecondsSinceEpoch(1700000000 * 1000),
      );
      expect(
        authSession.lastActive,
        DateTime.fromMillisecondsSinceEpoch(1700001000 * 1000),
      );
      expect(
        authSession.validUntil,
        DateTime.fromMillisecondsSinceEpoch(1700002000 * 1000),
      );
      expect(authSession.clientIp, '192.168.1.1');
      expect(authSession.userAgent, 'PiholeClient/1.0');
    });

    test('maps TLS mixed status', () {
      final session = SessionsListSessionsInner(
        tls: SessionsListSessionsInnerTls(login: false, mixed: true),
      );

      final authSession = session.toDomain();

      expect(authSession.tlsStatus, TlsStatus.mixed);
    });

    test('maps TLS none status', () {
      final session = SessionsListSessionsInner(
        tls: SessionsListSessionsInnerTls(login: false, mixed: false),
      );

      final authSession = session.toDomain();

      expect(authSession.tlsStatus, TlsStatus.none);
    });

    test('maps null TLS to none', () {
      final session = SessionsListSessionsInner();

      final authSession = session.toDomain();

      expect(authSession.tlsStatus, TlsStatus.none);
    });

    test('uses defaults for null fields', () {
      final session = SessionsListSessionsInner();

      final authSession = session.toDomain();

      expect(authSession.id, 0);
      expect(authSession.isValid, false);
      expect(authSession.isCurrentSession, false);
      expect(authSession.isApp, false);
      expect(authSession.isCli, false);
      expect(authSession.clientIp, '');
      expect(authSession.userAgent, isNull);
    });

    test('converts num id to int', () {
      final session = SessionsListSessionsInner(id: 3.0);

      final authSession = session.toDomain();

      expect(authSession.id, 3);
    });
  });

  group('GetAuthSessions200ResponseMapper', () {
    test('toDomainList maps all entries', () {
      final response = GetAuthSessions200Response(
        sessions: [
          SessionsListSessionsInner(id: 1, remoteAddr: '10.0.0.1'),
          SessionsListSessionsInner(id: 2, remoteAddr: '10.0.0.2'),
        ],
      );

      final list = response.toDomainList();

      expect(list.length, 2);
      expect(list[0].id, 1);
      expect(list[0].clientIp, '10.0.0.1');
      expect(list[1].id, 2);
      expect(list[1].clientIp, '10.0.0.2');
    });

    test('toDomainList returns empty list when sessions is null', () {
      final response = GetAuthSessions200Response();

      final list = response.toDomainList();

      expect(list, isEmpty);
    });
  });
}
