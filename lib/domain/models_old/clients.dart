class ClientRequest {
  ClientRequest({this.client, this.comment, this.groups = const [0]});

  factory ClientRequest.fromJson(Map<String, dynamic> json) {
    return ClientRequest(
      client: json['client'],
      comment: json['comment'],
      groups: json['groups'] != null
          ? List<int>.from(json['groups'])
          : const [0],
    );
  }

  final String? client;
  final String? comment;
  final List<int> groups;

  Map<String, dynamic> toJson({bool includeClient = true}) {
    return {
      if (includeClient) 'client': client,
      'comment': comment,
      'groups': groups,
    };
  }

  ClientRequest copyWith({String? client, String? comment, List<int>? groups}) {
    return ClientRequest(
      client: client ?? this.client,
      comment: comment ?? this.comment,
      groups: groups ?? this.groups,
    );
  }
}

class ClientsInfo {
  ClientsInfo({required this.clients});

  factory ClientsInfo.fromJson(Map<String, dynamic> json) {
    final clientsJson = json['clients'] as List<dynamic>? ?? [];
    return ClientsInfo(
      clients: clientsJson
          .map((item) => ClientItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<ClientItem> clients;

  Map<String, dynamic> toJson() {
    return {'clients': clients.map((c) => c.toJson()).toList()};
  }
}

class ClientItem {
  ClientItem({
    required this.client,
    required this.groups,
    required this.id,
    required this.dateAdded,
    required this.dateModified,
    this.name,
    this.comment,
  });

  factory ClientItem.fromJson(Map<String, dynamic> json) {
    return ClientItem(
      client: json['client'],
      name: json['name'],
      comment: json['comment'],
      groups: json['groups'] != null
          ? List<int>.from(json['groups'])
          : const [0],
      id: json['id'],
      dateAdded: DateTime.fromMillisecondsSinceEpoch(
        (json['date_added'] ?? 0) * 1000,
      ),
      dateModified: DateTime.fromMillisecondsSinceEpoch(
        (json['date_modified'] ?? 0) * 1000,
      ),
    );
  }

  final String client;
  final String? name;
  final String? comment;
  final List<int> groups;
  final int id;
  final DateTime dateAdded;
  final DateTime dateModified;

  Map<String, dynamic> toJson() {
    return {
      'client': client,
      'name': name,
      'comment': comment,
      'groups': groups,
      'id': id,
      'date_added': dateAdded,
      'date_modified': dateModified,
    };
  }

  ClientItem copyWith({
    String? client,
    String? name,
    String? comment,
    List<int>? groups,
    int? id,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return ClientItem(
      client: client ?? this.client,
      name: name ?? this.name,
      comment: comment ?? this.comment,
      groups: groups ?? this.groups,
      id: id ?? this.id,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
