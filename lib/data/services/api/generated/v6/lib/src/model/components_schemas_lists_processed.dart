//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/components_schemas_lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components_schemas_lists_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComponentsSchemasListsProcessed {
  /// Returns a new [ComponentsSchemasListsProcessed] instance.
  ComponentsSchemasListsProcessed({

     this.processed,
  });

  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final ComponentsSchemasListsProcessedProcessed? processed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ComponentsSchemasListsProcessed &&
      other.processed == processed;

    @override
    int get hashCode =>
        (processed == null ? 0 : processed.hashCode);

  factory ComponentsSchemasListsProcessed.fromJson(Map<String, dynamic> json) => _$ComponentsSchemasListsProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsSchemasListsProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

