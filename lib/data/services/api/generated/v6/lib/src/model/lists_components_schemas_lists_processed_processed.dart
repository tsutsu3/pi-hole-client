//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed_success_inner.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed_errors_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_components_schemas_lists_processed_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsComponentsSchemasListsProcessedProcessed {
  /// Returns a new [ListsComponentsSchemasListsProcessedProcessed] instance.
  ListsComponentsSchemasListsProcessedProcessed({

     this.success,

     this.errors,
  });

      /// Array of lists that were successfully added to the database. 
  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final List<ListsComponentsSchemasListsProcessedProcessedSuccessInner>? success;



      /// Array of errors that occurred during processing. 
  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final List<ListsComponentsSchemasListsProcessedProcessedErrorsInner>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsComponentsSchemasListsProcessedProcessed &&
      other.success == success &&
      other.errors == errors;

    @override
    int get hashCode =>
        success.hashCode +
        errors.hashCode;

  factory ListsComponentsSchemasListsProcessedProcessed.fromJson(Map<String, dynamic> json) => _$ListsComponentsSchemasListsProcessedProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$ListsComponentsSchemasListsProcessedProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

