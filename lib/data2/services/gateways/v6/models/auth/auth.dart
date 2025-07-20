import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
sealed class Password with _$Password {
  factory Password({
    required String password,
  }) = _Password;

  factory Password.fromJson(Map<String, dynamic> json) =>
      _$PasswordFromJson(json);
}

@freezed
sealed class Session with _$Session {
  factory Session({
    required SessionDetail session,
    required double took,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

@freezed
sealed class SessionDetail with _$SessionDetail {
  factory SessionDetail({
    required bool valid,
    required bool totp,
    required String sid,
    required String csrf,
    required int validity,
    required String message,
  }) = _SessionDetail;

  factory SessionDetail.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailFromJson(json);
}
