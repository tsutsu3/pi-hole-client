import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class BasicAuth with _$BasicAuth {
  const factory BasicAuth({
    required String? username,
    required String? password,
  }) = _BasicAuth;

  factory BasicAuth.fromJson(Map<String, dynamic> json) =>
      _$BasicAuthFromJson(json);
}
