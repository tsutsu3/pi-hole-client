//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_comment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasComment {
  /// Returns a new [SchemasComment] instance.
  SchemasComment({

     this.comment,
  });

      /// User-provided free-text comment for this group
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasComment &&
      other.comment == comment;

    @override
    int get hashCode =>
        (comment == null ? 0 : comment.hashCode);

  factory SchemasComment.fromJson(Map<String, dynamic> json) => _$SchemasCommentFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasCommentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

