//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'groups_get_groups_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GroupsGetGroupsInner {
  /// Returns a new [GroupsGetGroupsInner] instance.
  GroupsGetGroupsInner({

     this.name,

     this.comment,

     this.enabled = true,

     this.id,

     this.dateAdded,

     this.dateModified,
  });

      /// Group name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// User-provided free-text comment for this group
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Status of item
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;



      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of item addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last item modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GroupsGetGroupsInner &&
      other.name == name &&
      other.comment == comment &&
      other.enabled == enabled &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified;

    @override
    int get hashCode =>
        name.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        enabled.hashCode +
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode;

  factory GroupsGetGroupsInner.fromJson(Map<String, dynamic> json) => _$GroupsGetGroupsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsGetGroupsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

