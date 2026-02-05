//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_missing_error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemMissingError {
  /// Returns a new [ItemMissingError] instance.
  ItemMissingError({

     this.key,

     this.message,

     this.hint,
  });

      /// Machine-readable error type
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Human-readable error message
  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



      /// Additional data (if available)
  @JsonKey(
    
    name: r'hint',
    required: false,
    includeIfNull: false,
  )


  final String? hint;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemMissingError &&
      other.key == key &&
      other.message == message &&
      other.hint == hint;

    @override
    int get hashCode =>
        key.hashCode +
        message.hashCode +
        (hint == null ? 0 : hint.hashCode);

  factory ItemMissingError.fromJson(Map<String, dynamic> json) => _$ItemMissingErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMissingErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

