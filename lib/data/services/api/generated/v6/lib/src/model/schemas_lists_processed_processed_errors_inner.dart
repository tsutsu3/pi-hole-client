//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_lists_processed_processed_errors_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasListsProcessedProcessedErrorsInner {
  /// Returns a new [SchemasListsProcessedProcessedErrorsInner] instance.
  SchemasListsProcessedProcessedErrorsInner({

     this.item,

     this.error,
  });

      /// Group that could not be added to the database
  @JsonKey(
    
    name: r'item',
    required: false,
    includeIfNull: false,
  )


  final String? item;



      /// Error message
  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final String? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasListsProcessedProcessedErrorsInner &&
      other.item == item &&
      other.error == error;

    @override
    int get hashCode =>
        item.hashCode +
        error.hashCode;

  factory SchemasListsProcessedProcessedErrorsInner.fromJson(Map<String, dynamic> json) => _$SchemasListsProcessedProcessedErrorsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasListsProcessedProcessedErrorsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

