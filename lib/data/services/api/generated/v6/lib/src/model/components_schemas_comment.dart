//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components_schemas_comment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComponentsSchemasComment {
  /// Returns a new [ComponentsSchemasComment] instance.
  ComponentsSchemasComment({

     this.comment,
  });

      /// User-provided free-text comment for this client
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ComponentsSchemasComment &&
      other.comment == comment;

    @override
    int get hashCode =>
        (comment == null ? 0 : comment.hashCode);

  factory ComponentsSchemasComment.fromJson(Map<String, dynamic> json) => _$ComponentsSchemasCommentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsSchemasCommentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

