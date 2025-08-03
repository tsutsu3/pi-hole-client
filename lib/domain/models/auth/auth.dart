import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
sealed class Auth with _$Auth {
  factory Auth({
    required bool valid,
    required bool totp,
    required String sid,
    required String csrf,
    required int validity,
    required String message,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}

@freezed
sealed class AuthSession with _$AuthSession {
  const factory AuthSession({
    required int id,
    required bool isValid,
    required bool isCurrentSession,
    required TlsStatus tlsStatus,
    required bool isApp,
    required bool isCli,
    required DateTime loginAt,
    required DateTime lastActive,
    required DateTime validUntil,
    required String clientIp,
    String? userAgent,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
