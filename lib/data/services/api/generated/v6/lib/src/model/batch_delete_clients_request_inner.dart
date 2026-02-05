//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_delete_clients_request_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BatchDeleteClientsRequestInner {
  /// Returns a new [BatchDeleteClientsRequestInner] instance.
  BatchDeleteClientsRequestInner({

    required  this.item,
  });

      /// client IP / MAC / hostname / interface
  @JsonKey(
    
    name: r'item',
    required: true,
    includeIfNull: false,
  )


  final String item;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BatchDeleteClientsRequestInner &&
      other.item == item;

    @override
    int get hashCode =>
        item.hashCode;

  factory BatchDeleteClientsRequestInner.fromJson(Map<String, dynamic> json) => _$BatchDeleteClientsRequestInnerFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDeleteClientsRequestInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

