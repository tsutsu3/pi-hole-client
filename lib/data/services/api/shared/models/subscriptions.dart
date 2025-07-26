import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/model/v6/lists/lists.dart';

class SubscriptionRequest {
  SubscriptionRequest({
    required this.address,
    required this.type,
    required this.groups,
    this.comment,
    this.enabled = true,
  });

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) {
    return SubscriptionRequest(
      address: json['address'],
      comment: json['comment'],
      type: json['type'],
      groups: List<int>.from(json['groups']),
      enabled: json['enabled'],
    );
  }

  final String address;
  final String? comment;
  final String type;
  final List<int> groups;
  final bool enabled;

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'comment': comment,
      'type': type,
      'groups': groups,
      'enabled': enabled,
    };
  }

  SubscriptionRequest copyWith({
    String? address,
    String? comment,
    String? type,
    List<int>? groups,
    bool? enabled,
  }) {
    return SubscriptionRequest(
      address: address ?? this.address,
      comment: comment ?? this.comment,
      type: type ?? this.type,
      groups: groups ?? this.groups,
      enabled: enabled ?? this.enabled,
    );
  }
}

class SubscriptionsInfo {
  SubscriptionsInfo({
    required this.subscriptions,
  });

  factory SubscriptionsInfo.fromV6(Lists lists) {
    return SubscriptionsInfo(
      subscriptions: lists.lists
          .map(
            (e) => Subscription(
              address: e.address,
              type: e.type,
              comment: e.comment,
              groups: e.groups,
              enabled: e.enabled,
              id: e.id,
              dateAdded:
                  DateTime.fromMillisecondsSinceEpoch(e.dateAdded * 1000),
              dateModified:
                  DateTime.fromMillisecondsSinceEpoch(e.dateModified * 1000),
              dateUpdated:
                  DateTime.fromMillisecondsSinceEpoch(e.dateUpdated * 1000),
              number: e.number,
              invalidDomains: e.invalidDomains,
              abpEntries: e.abpEntries,
              status: ListsStatus.values[e.status],
            ),
          )
          .toList(),
    );
  }

  final List<Subscription> subscriptions;

  Map<String, dynamic> toJson() {
    return {
      'lists': subscriptions.map((e) => e.toJson()).toList(),
    };
  }
}

class Subscription {
  Subscription({
    required this.address,
    required this.type,
    required this.groups,
    required this.enabled,
    required this.id,
    required this.dateAdded,
    required this.dateModified,
    required this.dateUpdated,
    required this.number,
    required this.invalidDomains,
    required this.abpEntries,
    required this.status,
    this.comment,
  });

  final String address;
  final String type;
  final String? comment;
  final List<int> groups;
  final bool enabled;
  final int id;
  final DateTime dateAdded;
  final DateTime dateModified;
  final DateTime dateUpdated;
  final int number;
  final int invalidDomains;
  final int abpEntries;
  final ListsStatus status;

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'type': type,
      'comment': comment,
      'groups': groups,
      'enabled': enabled,
      'id': id,
      'date_added': dateAdded,
      'date_modified': dateModified,
      'date_updated': dateUpdated,
      'number': number,
      'invalid_domains': invalidDomains,
      'abp_entries': abpEntries,
      'status': status.index,
    };
  }

  Subscription copyWith({
    String? address,
    String? type,
    String? comment,
    List<int>? groups,
    bool? enabled,
    int? id,
    DateTime? dateAdded,
    DateTime? dateModified,
    DateTime? dateUpdated,
    int? number,
    int? invalidDomains,
    int? abpEntries,
    ListsStatus? status,
  }) {
    return Subscription(
      address: address ?? this.address,
      type: type ?? this.type,
      comment: comment ?? this.comment,
      groups: groups ?? this.groups,
      enabled: enabled ?? this.enabled,
      id: id ?? this.id,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
      dateUpdated: dateUpdated ?? this.dateUpdated,
      number: number ?? this.number,
      invalidDomains: invalidDomains ?? this.invalidDomains,
      abpEntries: abpEntries ?? this.abpEntries,
      status: status ?? this.status,
    );
  }
}
