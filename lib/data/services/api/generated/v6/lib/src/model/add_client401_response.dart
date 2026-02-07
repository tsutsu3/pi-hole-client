//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/unauthorized_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_client401_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddClient401Response {
  /// Returns a new [AddClient401Response] instance.
  AddClient401Response({

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


  final UnauthorizedError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddClient401Response &&
      other.took == took &&
      other.error == error;

    @override
    int get hashCode =>
        took.hashCode +
        error.hashCode;

  factory AddClient401Response.fromJson(Map<String, dynamic> json) => _$AddClient401ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddClient401ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

