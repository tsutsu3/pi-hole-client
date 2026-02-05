//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_processed_processed_success_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsProcessedProcessedSuccessInner {
  /// Returns a new [ListsProcessedProcessedSuccessInner] instance.
  ListsProcessedProcessedSuccessInner({

     this.item,
  });

      /// Domain that was added to the database
  @JsonKey(
    
    name: r'item',
    required: false,
    includeIfNull: false,
  )


  final String? item;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsProcessedProcessedSuccessInner &&
      other.item == item;

    @override
    int get hashCode =>
        item.hashCode;

  factory ListsProcessedProcessedSuccessInner.fromJson(Map<String, dynamic> json) => _$ListsProcessedProcessedSuccessInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ListsProcessedProcessedSuccessInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

