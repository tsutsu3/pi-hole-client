//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_lists_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasListsProcessed {
  /// Returns a new [SchemasListsProcessed] instance.
  SchemasListsProcessed({

     this.processed,
  });

  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final SchemasListsProcessedProcessed? processed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasListsProcessed &&
      other.processed == processed;

    @override
    int get hashCode =>
        (processed == null ? 0 : processed.hashCode);

  factory SchemasListsProcessed.fromJson(Map<String, dynamic> json) => _$SchemasListsProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasListsProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

