//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_components_schemas_lists_processed_processed_success_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsComponentsSchemasListsProcessedProcessedSuccessInner {
  /// Returns a new [ListsComponentsSchemasListsProcessedProcessedSuccessInner] instance.
  ListsComponentsSchemasListsProcessedProcessedSuccessInner({

     this.item,
  });

      /// List that was added to the database
  @JsonKey(
    
    name: r'item',
    required: false,
    includeIfNull: false,
  )


  final String? item;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsComponentsSchemasListsProcessedProcessedSuccessInner &&
      other.item == item;

    @override
    int get hashCode =>
        item.hashCode;

  factory ListsComponentsSchemasListsProcessedProcessedSuccessInner.fromJson(Map<String, dynamic> json) => _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ListsComponentsSchemasListsProcessedProcessedSuccessInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

