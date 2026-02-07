//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/groups_get_groups_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replace_group200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReplaceGroup200Response {
  /// Returns a new [ReplaceGroup200Response] instance.
  ReplaceGroup200Response({

     this.groups,

     this.processed,

     this.took,
  });

  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<GroupsGetGroupsInner>? groups;



  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final SchemasListsProcessedProcessed? processed;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReplaceGroup200Response &&
      other.groups == groups &&
      other.processed == processed &&
      other.took == took;

    @override
    int get hashCode =>
        groups.hashCode +
        (processed == null ? 0 : processed.hashCode) +
        took.hashCode;

  factory ReplaceGroup200Response.fromJson(Map<String, dynamic> json) => _$ReplaceGroup200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceGroup200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

