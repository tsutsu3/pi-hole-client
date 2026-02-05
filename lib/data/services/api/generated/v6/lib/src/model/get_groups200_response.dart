//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/groups_get_groups_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_groups200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetGroups200Response {
  /// Returns a new [GetGroups200Response] instance.
  GetGroups200Response({

     this.groups,

     this.took,
  });

  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<GroupsGetGroupsInner>? groups;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetGroups200Response &&
      other.groups == groups &&
      other.took == took;

    @override
    int get hashCode =>
        groups.hashCode +
        took.hashCode;

  factory GetGroups200Response.fromJson(Map<String, dynamic> json) => _$GetGroups200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetGroups200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

