//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_components_schemas_comment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsComponentsSchemasComment {
  /// Returns a new [ListsComponentsSchemasComment] instance.
  ListsComponentsSchemasComment({

     this.comment,
  });

      /// User-provided free-text comment for this list
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsComponentsSchemasComment &&
      other.comment == comment;

    @override
    int get hashCode =>
        (comment == null ? 0 : comment.hashCode);

  factory ListsComponentsSchemasComment.fromJson(Map<String, dynamic> json) => _$ListsComponentsSchemasCommentFromJson(json);

  Map<String, dynamic> toJson() => _$ListsComponentsSchemasCommentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

