//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/groups_get_groups_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'groups_get.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GroupsGet {
  /// Returns a new [GroupsGet] instance.
  GroupsGet({

     this.groups,
  });

  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<GroupsGetGroupsInner>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GroupsGet &&
      other.groups == groups;

    @override
    int get hashCode =>
        groups.hashCode;

  factory GroupsGet.fromJson(Map<String, dynamic> json) => _$GroupsGetFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsGetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

