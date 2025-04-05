import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages.freezed.dart';
part 'messages.g.dart';

@freezed
sealed class Messages with _$Messages {
  const factory Messages({
    required List<Message> messages,
    required double took,
  }) = _Messages;

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);
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
