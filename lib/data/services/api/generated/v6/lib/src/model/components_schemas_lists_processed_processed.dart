//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed_errors_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components_schemas_lists_processed_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComponentsSchemasListsProcessedProcessed {
  /// Returns a new [ComponentsSchemasListsProcessedProcessed] instance.
  ComponentsSchemasListsProcessedProcessed({

     this.success,

     this.errors,
  });

      /// Array of clients that were successfully added to the database. 
  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final List<ComponentsSchemasListsProcessedProcessedSuccessInner>? success;



      /// Array of errors that occurred during processing. 
  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final List<ComponentsSchemasListsProcessedProcessedErrorsInner>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ComponentsSchemasListsProcessedProcessed &&
      other.success == success &&
      other.errors == errors;

    @override
    int get hashCode =>
        success.hashCode +
        errors.hashCode;

  factory ComponentsSchemasListsProcessedProcessed.fromJson(Map<String, dynamic> json) => _$ComponentsSchemasListsProcessedProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsSchemasListsProcessedProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

