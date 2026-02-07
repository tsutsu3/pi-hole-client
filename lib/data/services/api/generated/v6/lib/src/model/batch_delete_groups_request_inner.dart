//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_delete_groups_request_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BatchDeleteGroupsRequestInner {
  /// Returns a new [BatchDeleteGroupsRequestInner] instance.
  BatchDeleteGroupsRequestInner({

    required  this.item,
  });

      /// group name
  @JsonKey(
    
    name: r'item',
    required: true,
    includeIfNull: false,
  )


  final String item;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BatchDeleteGroupsRequestInner &&
      other.item == item;

    @override
    int get hashCode =>
        item.hashCode;

  factory BatchDeleteGroupsRequestInner.fromJson(Map<String, dynamic> json) => _$BatchDeleteGroupsRequestInnerFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDeleteGroupsRequestInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

