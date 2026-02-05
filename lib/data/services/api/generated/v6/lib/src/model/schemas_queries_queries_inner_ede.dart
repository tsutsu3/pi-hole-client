//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_queries_queries_inner_ede.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasQueriesQueriesInnerEde {
  /// Returns a new [SchemasQueriesQueriesInnerEde] instance.
  SchemasQueriesQueriesInnerEde({

     this.code,

     this.text,
  });

      /// EDE code
  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final int? code;



      /// EDE message (if available)
  @JsonKey(
    
    name: r'text',
    required: false,
    includeIfNull: false,
  )


  final String? text;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasQueriesQueriesInnerEde &&
      other.code == code &&
      other.text == text;

    @override
    int get hashCode =>
        code.hashCode +
        (text == null ? 0 : text.hashCode);

  factory SchemasQueriesQueriesInnerEde.fromJson(Map<String, dynamic> json) => _$SchemasQueriesQueriesInnerEdeFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasQueriesQueriesInnerEdeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

