class GravityData {
  GravityData({
    required this.gravityUpdate,
    required this.gravityLogs,
    required this.gravityMessages,
  });

  final GravityUpdateData? gravityUpdate;
  final List<GravityLogData>? gravityLogs;
  final List<GravityMessageData>? gravityMessages;
}

class GravityUpdateData {
  GravityUpdateData({
    required this.address,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  factory GravityUpdateData.fromMap(Map<String, Object?> map) {
    return GravityUpdateData(
      address: map['address']! as String,
      startTime: DateTime.parse(map['start_time']! as String).toLocal(),
      endTime: DateTime.parse(map['end_time']! as String).toLocal(),
      status: map['status']! as int,
    );
  }

  final String address;
  final DateTime startTime;
  final DateTime endTime;
  final int status;

  GravityUpdateData copyWith({
    String? address,
    DateTime? startTime,
    DateTime? endTime,
    int? status,
  }) {
    return GravityUpdateData(
      address: address ?? this.address,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
    );
  }

  bool isInitial() {
    return address == '';
  }
}

class GravityLogData {
  GravityLogData({
    required this.address,
    required this.line,
    required this.message,
    required this.timestamp,
  });

  factory GravityLogData.fromMap(Map<String, Object?> map) {
    return GravityLogData(
      address: map['address']! as String,
      line: map['line']! as int,
      message: map['message']! as String,
      timestamp: DateTime.parse(map['timestamp']! as String).toLocal(),
    );
  }

  final String address;
  final int line;
  final String message;
  final DateTime timestamp;
}

class GravityMessageData {
  GravityMessageData({
    required this.id,
    required this.address,
    required this.message,
    required this.url,
    required this.timestamp,
  });

  factory GravityMessageData.fromMap(Map<String, Object?> map) {
    return GravityMessageData(
      id: map['message_id']! as int,
      address: map['address']! as String,
      message: map['message']! as String,
      url: map['url']! as String,
      timestamp: DateTime.parse(map['timestamp']! as String).toLocal(),
    );
  }

  final int id;
  final String address;
  final String message;
  final String url;
  final DateTime timestamp;
}
