import 'package:pi_hole_client/data2/services/gateways/v6/models/groups/groups.dart';

class GroupRequest {
  GroupRequest({
    required this.name,
    required this.enabled,
    this.comment,
  });

  factory GroupRequest.fromJson(Map<String, dynamic> json) {
    return GroupRequest(
      name: json['name'],
      comment: json['comment'],
      enabled: json['enabled'],
    );
  }

  final String name;
  final bool enabled;
  final String? comment;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'comment': comment,
      'enabled': enabled,
    };
  }
}

class GroupsInfo {
  GroupsInfo({
    required this.groups,
  });

  factory GroupsInfo.fromV6(Groups groups) {
    return GroupsInfo(
      groups: groups.groups.map((g) {
        return Group(
          id: g.id,
          name: g.name,
          comment: g.comment,
          enabled: g.enabled,
          dateAdded: DateTime.fromMillisecondsSinceEpoch(g.dateAdded * 1000),
          dateModified:
              DateTime.fromMillisecondsSinceEpoch(g.dateModified * 1000),
        );
      }).toList(),
    );
  }

  final List<Group> groups;

  Map<String, dynamic> toJson() {
    return {
      'groups': groups.map((g) => g.toJson()).toList(),
    };
  }
}

class Group {
  Group({
    required this.id,
    required this.name,
    required this.enabled,
    required this.dateAdded,
    required this.dateModified,
    this.comment,
  });

  final int id;
  final String name;
  final String? comment;
  final bool enabled;
  final DateTime dateAdded;
  final DateTime dateModified;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'comment': comment,
      'enabled': enabled,
      'date_added': dateAdded,
      'date_modified': dateModified,
    };
  }

  Group copyWith({
    int? id,
    String? name,
    String? comment,
    bool? enabled,
    DateTime? dateAdded,
    DateTime? dateModified,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      comment: comment ?? this.comment,
      enabled: enabled ?? this.enabled,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
