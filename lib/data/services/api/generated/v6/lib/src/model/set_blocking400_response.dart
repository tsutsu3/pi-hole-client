//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/item_missing_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_blocking400_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetBlocking400Response {
  /// Returns a new [SetBlocking400Response] instance.
  SetBlocking400Response({

     this.took,

     this.error,
  });

      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;



  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ItemMissingError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetBlocking400Response &&
      other.took == took &&
      other.error == error;

    @override
    int get hashCode =>
        took.hashCode +
        error.hashCode;

  factory SetBlocking400Response.fromJson(Map<String, dynamic> json) => _$SetBlocking400ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetBlocking400ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

