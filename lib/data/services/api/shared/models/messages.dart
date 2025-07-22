import 'package:pi_hole_client/data/services/api/v6/models/ftl/messages.dart';

class MessagesInfo {
  MessagesInfo({
    required this.messages,
  });

  factory MessagesInfo.fromV6(Messages messages) {
    final list = messages.messages
        .map((m) {
          return Message.tryParsePlain(
            id: m.id,
            timestamp: DateTime.fromMillisecondsSinceEpoch(m.timestamp * 1000),
            plain: m.plain,
          );
        })
        .whereType<Message>()
        .toList();

    return MessagesInfo(messages: list);
  }

  final List<Message> messages;

  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((m) => m.toJson()).toList(),
    };
  }
}

class Message {
  Message({
    required this.id,
    required this.timestamp,
    required this.message,
    required this.url,
  });

  static Message? fromJson(Map<String, dynamic> json) {
    if (json['type'] != 'LIST') return null;
    if (json['plain'] == null) return null;

    return tryParsePlain(
      id: json['id'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp'] * 1000),
      plain: json['plain'],
    );
  }

  static Message? tryParsePlain({
    required int id,
    required DateTime timestamp,
    required String plain,
  }) {
    // See: pi-hole/FTL src/database/message-table.c: format_inaccessible_adlist_message
    final regex = RegExp(
      r'List with ID (\d+) \((.+)\) was inaccessible during last gravity run',
    );
    final match = regex.firstMatch(plain);
    if (match == null) return null;

    final listId = match.group(1);
    final listUrl = match.group(2);

    return Message(
      id: id,
      timestamp: timestamp,
      message: 'List with ID $listId was inaccessible during last gravity run',
      url: listUrl ?? '',
    );
  }

  final int id;
  final DateTime timestamp;
  final String message;
  final String url;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp,
      'message': message,
      'url': url,
    };
  }
}
