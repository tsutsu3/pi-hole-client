import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/services/api/model/v6/auth/auth.dart';

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

  factory Auth.fromV6(Session session) {
    return Auth(
      valid: session.session.valid,
      totp: session.session.totp,
      sid: session.session.sid,
      csrf: session.session.csrf,
      validity: session.session.validity,
      message: session.session.message,
    );
  }
}
