//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_delete_lists_request_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BatchDeleteListsRequestInner {
  /// Returns a new [BatchDeleteListsRequestInner] instance.
  BatchDeleteListsRequestInner({

     this.item,

     this.type,
  });

      /// group name
  @JsonKey(
    
    name: r'item',
    required: false,
    includeIfNull: false,
  )


  final String? item;



      /// Type of list
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final BatchDeleteListsRequestInnerTypeEnum? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BatchDeleteListsRequestInner &&
      other.item == item &&
      other.type == type;

    @override
    int get hashCode =>
        item.hashCode +
        type.hashCode;

  factory BatchDeleteListsRequestInner.fromJson(Map<String, dynamic> json) => _$BatchDeleteListsRequestInnerFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDeleteListsRequestInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of list
enum BatchDeleteListsRequestInnerTypeEnum {
    /// Type of list
@JsonValue(r'allow')
allow(r'allow'),
    /// Type of list
@JsonValue(r'block')
block(r'block');

const BatchDeleteListsRequestInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


