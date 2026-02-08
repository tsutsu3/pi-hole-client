import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';

/// Maps [SessionSession] (OpenAPI-generated) to [Auth] (domain model).
extension SessionSessionMapper on SessionSession {
  Auth toDomain() {
    return Auth(
      valid: valid,
      totp: totp,
      sid: sid ?? '',
      csrf: csrf ?? '',
      validity: validity,
      message: message ?? '',
    );
  }
}

/// Maps [GetAuth200Response] (OpenAPI-generated) to [Auth] (domain model).
extension GetAuth200ResponseMapper on GetAuth200Response {
  Auth toDomain() {
    return session.toDomain();
  }
}

/// Maps [SessionsListSessionsInner] (OpenAPI-generated) to [AuthSession]
/// (domain model).
extension SessionsListSessionsInnerMapper on SessionsListSessionsInner {
  AuthSession toDomain() {
    return AuthSession(
      id: id?.toInt() ?? 0,
      isValid: valid ?? false,
      isCurrentSession: currentSession ?? false,
      tlsStatus: _convertTlsStatus(tls),
      isApp: app ?? false,
      isCli: cli ?? false,
      loginAt: DateTime.fromMillisecondsSinceEpoch((loginAt ?? 0) * 1000),
      lastActive:
          DateTime.fromMillisecondsSinceEpoch((lastActive ?? 0) * 1000),
      validUntil:
          DateTime.fromMillisecondsSinceEpoch((validUntil ?? 0) * 1000),
      clientIp: remoteAddr ?? '',
      userAgent: userAgent,
    );
  }
}

/// Maps [GetAuthSessions200Response] (OpenAPI-generated) to
/// [List<AuthSession>] (domain model).
extension GetAuthSessions200ResponseMapper on GetAuthSessions200Response {
  List<AuthSession> toDomainList() {
    return (sessions ?? []).map((s) => s.toDomain()).toList();
  }
}

TlsStatus _convertTlsStatus(SessionsListSessionsInnerTls? tls) {
  if (tls == null) return TlsStatus.none;
  if (tls.login == true) return TlsStatus.login;
  if (tls.mixed == true) return TlsStatus.mixed;
  return TlsStatus.none;
}
