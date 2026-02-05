//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Post {
  /// Returns a new [Post] instance.
  Post({

     this.domain,

     this.comment,

     this.groups,

     this.enabled = true,
  });

  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? domain;



      /// User-provided free-text comment for this domain
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Array of group IDs
  @JsonKey(
    
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
    bool operator ==(Object other) => identical(this, other) || other is Post &&
      other.domain == domain &&
      other.comment == comment &&
      other.groups == groups &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        domain.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        enabled.hashCode;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

