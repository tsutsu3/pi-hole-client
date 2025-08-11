import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
sealed class InfoMessages with _$InfoMessages {
  @JsonSerializable(explicitToJson: true)
  const factory InfoMessages({
    required List<Message> messages,
    required double took,
  }) = _InfoMessages;

  factory InfoMessages.fromJson(Map<String, dynamic> json) =>
      _$InfoMessagesFromJson(json);
}

@freezed
sealed class Message with _$Message {
  const factory Message({
    required int id,
    required int timestamp,
    required String type,
    required String plain,
    required String html,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
