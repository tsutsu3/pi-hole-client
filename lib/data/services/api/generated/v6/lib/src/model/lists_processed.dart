//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_processed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsProcessed {
  /// Returns a new [ListsProcessed] instance.
  ListsProcessed({

     this.processed,
  });

  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final ListsProcessedProcessed? processed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsProcessed &&
      other.processed == processed;

    @override
    int get hashCode =>
        (processed == null ? 0 : processed.hashCode);

  factory ListsProcessed.fromJson(Map<String, dynamic> json) => _$ListsProcessedFromJson(json);

  Map<String, dynamic> toJson() => _$ListsProcessedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

