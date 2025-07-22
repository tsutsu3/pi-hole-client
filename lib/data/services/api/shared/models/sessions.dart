import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/v6/models/auth/sessions.dart';

class SessionsInfo {
  SessionsInfo({
    required this.sessions,
  });

  factory SessionsInfo.fromV6(AuthSessions authSessions) {
    return SessionsInfo(
      sessions: authSessions.sessions.map(SessionInfo.fromV6).toList(),
    );
  }

  final List<SessionInfo> sessions;

  Map<String, dynamic> toJson() {
    return {
      'sessions': sessions.map((session) => session.toJson()).toList(),
    };
  }
}

class SessionInfo {
  SessionInfo({
    required this.id,
    required this.isValid,
    required this.isCurrentSession,
    required this.tlsStatus,
    required this.isApp,
    required this.isCli,
    required this.loginAt,
    required this.lastActive,
    required this.validUntil,
    required this.clientIp,
    this.userAgent,
  });

  factory SessionInfo.fromV6(SessionData session) {
    return SessionInfo(
      id: session.id,
      isValid: session.valid,
      isCurrentSession: session.currentSession,
      tlsStatus: convertTlsStatus(session.tls),
      isApp: session.app,
      isCli: session.cli,
      loginAt: DateTime.fromMillisecondsSinceEpoch(session.loginAt * 1000),
      lastActive:
          DateTime.fromMillisecondsSinceEpoch(session.lastActive * 1000),
      validUntil:
          DateTime.fromMillisecondsSinceEpoch(session.validUntil * 1000),
      clientIp: session.remoteAddr,
      userAgent: session.userAgent,
    );
  }

  final int id;
  final bool isValid;
  final bool isCurrentSession;
  final TlsStatus tlsStatus;
  final bool isApp;
  final bool isCli;
  final DateTime loginAt;
  final DateTime lastActive;
  final DateTime validUntil;
  final String clientIp;
  final String? userAgent;

  static TlsStatus convertTlsStatus(Tls tls) {
    if (tls.login) {
      return TlsStatus.login;
    } else if (tls.mixed) {
      return TlsStatus.mixed;
    } else {
      return TlsStatus.none;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isValid': isValid,
      'isCurrentSession': isCurrentSession,
      'tlsStatus': tlsStatus.name,
      'isApp': isApp,
      'isCli': isCli,
      'loginAt': loginAt,
      'lastActive': lastActive,
      'validUntil': validUntil,
      'clientIp': clientIp,
      'userAgent': userAgent,
    };
  }
}
