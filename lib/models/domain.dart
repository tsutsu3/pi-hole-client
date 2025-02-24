class Domain {
  Domain({
    required this.id,
    required this.type,
    required this.domain,
    required this.enabled,
    required this.dateAdded,
    required this.dateModified,
    required this.comment,
    required this.groups,
  });

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json['id'],
        type: json['type'],
        domain: json['domain'],
        enabled: json['enabled'],
        dateAdded:
            DateTime.fromMillisecondsSinceEpoch(json['date_added'] * 1000),
        dateModified:
            DateTime.fromMillisecondsSinceEpoch(json['date_modified'] * 1000),
        comment: json['comment'],
        groups: List<int>.from(json['groups'].map((x) => x)),
      );

  int id;
  int type;
  String domain;
  int enabled;
  DateTime dateAdded;
  DateTime dateModified;
  String? comment;
  List<int> groups;

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'domain': domain,
        'enabled': enabled,
        'date_added': dateAdded,
        'date_modified': dateModified,
        'comment': comment,
        'groups': List<int>.from(groups.map((x) => x)),
      };

  Domain copyWith({
    int? id,
    int? type,
    String? domain,
    int? enabled,
    DateTime? dateAdded,
    DateTime? dateModified,
    String? comment,
    List<int>? groups,
  }) =>
      Domain(
        id: id ?? this.id,
        type: type ?? this.type,
        domain: domain ?? this.domain,
        enabled: enabled ?? this.enabled,
        dateAdded: dateAdded ?? this.dateAdded,
        dateModified: dateModified ?? this.dateModified,
        comment: comment ?? this.comment,
        groups: groups ?? this.groups,
      );
}
