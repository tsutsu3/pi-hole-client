import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/model/v6/auth/auth.dart' as s;
import 'package:pi_hole_client/data/model/v6/auth/sessions.dart' as s;
import 'package:pi_hole_client/domain/model/auth/auth.dart' as d;

extension SessionMapper on s.Session {
  d.Auth toDomain() {
    return d.Auth(
      valid: session.valid,
      totp: session.totp,
      sid: session.sid,
      csrf: session.csrf,
      validity: session.validity,
      message: session.message,
    );
  }
}

extension AuthSessionsMapper on s.AuthSessions {
  List<d.AuthSession> toDomain() {
    return sessions.map((session) {
      return d.AuthSession(
        id: session.id,
        isValid: session.valid,
        isCurrentSession: session.currentSession,
        tlsStatus: convertTlsStatus(session.tls),
        isApp: session.app,
        isCli: session.cli,
        loginAt: DateTime.fromMillisecondsSinceEpoch(session.loginAt * 1000),
        lastActive: DateTime.fromMillisecondsSinceEpoch(
          session.lastActive * 1000,
        ),
        validUntil: DateTime.fromMillisecondsSinceEpoch(
          session.validUntil * 1000,
        ),
        clientIp: session.remoteAddr,
        userAgent: session.userAgent,
      );
    }).toList();
  }
}

TlsStatus convertTlsStatus(s.Tls tls) {
  if (tls.login) {
    return TlsStatus.login;
  } else if (tls.mixed) {
    return TlsStatus.mixed;
  } else {
    return TlsStatus.none;
  }
}
