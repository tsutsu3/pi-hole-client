import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
sealed class InfoMessage with _$InfoMessage {
  const factory InfoMessage({
    required int id,
    required DateTime timestamp,
    required String message,
    required String url,
  }) = _InfoMessage;

  factory InfoMessage.fromJson(Map<String, dynamic> json) =>
      _$InfoMessageFromJson(json);
}
