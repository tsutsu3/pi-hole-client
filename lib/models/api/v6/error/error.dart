import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
class Error with _$Error {
  factory Error({
    required ErrorDetails error,
  }) = _Error;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}

@freezed
class ErrorDetails with _$ErrorDetails {
  factory ErrorDetails({
    required String key,
    required String message,
    String? hint,
  }) = _ErrorDetails;

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsFromJson(json);
}
