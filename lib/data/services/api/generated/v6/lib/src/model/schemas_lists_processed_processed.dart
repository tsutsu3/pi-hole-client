//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed_errors_inner.dart';
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed_success_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_lists_processed_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasListsProcessedProcessed {
  /// Returns a new [SchemasListsProcessedProcessed] instance.
  SchemasListsProcessedProcessed({

     this.success,

     this.errors,
  });

      /// Array of groups that were successfully added to the database. 
  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final List<SchemasListsProcessedProcessedSuccessInner>? success;



      /// Array of errors that occurred during processing. 
  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final List<SchemasListsProcessedProcessedErrorsInner>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasListsProcessedProcessed &&
      other.success == success &&
      other.errors == errors;

    @override
    int get hashCode =>
        success.hashCode +
        errors.hashCode;

  factory SchemasListsProcessedProcessed.fromJson(Map<String, dynamic> json) => _$SchemasListsProcessedProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasListsProcessedProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

