//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_post.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsPost {
  /// Returns a new [ListsPost] instance.
  ListsPost({

     this.address,

     this.comment,

     this.groups = const [0],

     this.enabled = true,
  });

  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? address;



      /// User-provided free-text comment for this list
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Array of group IDs
  @JsonKey(
    defaultValue: [0],
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;



      /// Status of domain
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsPost &&
      other.address == address &&
      other.comment == comment &&
      other.groups == groups &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        address.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        enabled.hashCode;

  factory ListsPost.fromJson(Map<String, dynamic> json) => _$ListsPostFromJson(json);

  Map<String, dynamic> toJson() => _$ListsPostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

