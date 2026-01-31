import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions.freezed.dart';
part 'sessions.g.dart';

@freezed
sealed class AuthSessions with _$AuthSessions {
  @JsonSerializable(explicitToJson: true)
  const factory AuthSessions({
    required List<SessionData> sessions,
    required double took,
  }) = _AuthSessions;

  factory AuthSessions.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionsFromJson(json);
}

@freezed
sealed class SessionData with _$SessionData {
  @JsonSerializable(explicitToJson: true)
  const factory SessionData({
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
  }) = _SessionData;

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);
}

@freezed
sealed class Tls with _$Tls {
  const factory Tls({required bool login, required bool mixed}) = _Tls;

  factory Tls.fromJson(Map<String, dynamic> json) => _$TlsFromJson(json);
}
