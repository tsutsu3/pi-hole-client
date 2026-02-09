import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class FtlMessage with _$FtlMessage {
  const factory FtlMessage({
    required int id,
    required DateTime timestamp,
    required String message,
    required String url,
  }) = _FtlMessage;

  factory FtlMessage.fromJson(Map<String, dynamic> json) =>
      _$FtlMessageFromJson(json);
}
