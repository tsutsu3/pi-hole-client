import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/model/v6/domains/domains.dart'
    as v6;

class DomainRequest {
  DomainRequest({
    required this.domain,
    required this.type,
    required this.kind,
    required this.enabled,
    required this.groups,
    this.comment,
  });

  factory DomainRequest.fromJson(Map<String, dynamic> json) => DomainRequest(
        domain: json['domain'],
        type: DomainType.values.firstWhere(
          (e) => e.name == _getTypeAndKind(json['type'])!['type'],
        ),
        kind: DomainKind.values.firstWhere(
          (e) => e.name == _getTypeAndKind(json['type'])!['kind'],
        ),
        enabled: json['enabled'] == 1 ? true : false,
        groups: List<int>.from(json['groups'].map((x) => x)),
        comment: json['comment'],
      );

  String domain;
  DomainType type;
  DomainKind kind;
  bool enabled;
  List<int> groups;
  String? comment;

  static Map<String, String>? _getTypeAndKind(int value) {
    // TODO: The value of `json['type']` is being converted to a string and then back to enums, which introduces unnecessary transformation. Consider refactoring.
    final types = <String, int>{
      'allow_exact': 0,
      'deny_exact': 1,
      'allow_regex': 2,
      'deny_regex': 3,
    };

    final entry = types.entries.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Invalid value: $value'),
    );

    final parts = entry.key.split('_');
    if (parts.length != 2) return null;

    return {
      'type': parts[0], // allow or deny
      'kind': parts[1], // exact or regex
    };
  }

  Map<String, dynamic> toJson() => {
        'domain': domain,
        'type': type.name,
        'kind': kind.name,
        'enabled': enabled,
        'comment': comment,
        'groups': groups,
      };
}

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

  factory Domain.fromV6(v6.DomainData domain) {
    final types = {
      'allow_exact': 0,
      'deny_exact': 1,
      'allow_regex': 2,
      'deny_regex': 3,
    };

    return Domain(
      id: domain.id,
      type: types['${domain.type}_${domain.kind}']!,
      domain: domain.domain,
      enabled: domain.enabled ? 1 : 0,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(domain.dateAdded * 1000),
      dateModified:
          DateTime.fromMillisecondsSinceEpoch(domain.dateModified * 1000),
      comment: domain.comment,
      groups: domain.groups,
    );
  }

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
        'groups': groups,
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
  }) {
    return Domain(
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
}
