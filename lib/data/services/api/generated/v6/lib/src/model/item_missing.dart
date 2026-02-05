//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/item_missing_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_missing.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemMissing {
  /// Returns a new [ItemMissing] instance.
  ItemMissing({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ItemMissingError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemMissing &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory ItemMissing.fromJson(Map<String, dynamic> json) => _$ItemMissingFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMissingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

