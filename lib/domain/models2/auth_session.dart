import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/services/api/model/v6/auth/sessions.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

@freezed
sealed class AuthSession with _$AuthSession {
  @JsonSerializable(explicitToJson: true)
  const factory AuthSession({
    required int id,
    @JsonKey(name: 'current_session') required bool currentSession,
    required bool valid,
    required Tls tls,
    required bool app,
    required bool cli,
    @JsonKey(name: 'login_at') required int loginAt,
    @JsonKey(name: 'last_active') required int lastActive,
    @JsonKey(name: 'valid_until') required int validUntil,
    @JsonKey(name: 'remote_addr') required String remoteAddr,
    @JsonKey(name: 'user_agent') String? userAgent,
    @JsonKey(name: 'x_forwarded_for') String? xForwardedFor,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);

  factory AuthSession.fromV6(SessionData sessionData) {
    return AuthSession(
      id: sessionData.id,
      currentSession: sessionData.currentSession,
      valid: sessionData.valid,
      tls: Tls(login: sessionData.tls.login, mixed: sessionData.tls.mixed),
      app: sessionData.app,
      cli: sessionData.cli,
      loginAt: sessionData.loginAt,
      lastActive: sessionData.lastActive,
      validUntil: sessionData.validUntil,
      remoteAddr: sessionData.remoteAddr,
      userAgent: sessionData.userAgent,
      xForwardedFor: sessionData.xForwardedFor,
    );
  }
}

@freezed
sealed class Tls with _$Tls {
  const factory Tls({
    required bool login,
    required bool mixed,
  }) = _Tls;

  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);
}
