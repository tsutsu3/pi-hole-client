//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/unauthorized_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_auth401_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddAuth401Response {
  /// Returns a new [AddAuth401Response] instance.
  AddAuth401Response({

     this.error,

     this.took,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final UnauthorizedError? error;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddAuth401Response &&
      other.error == error &&
      other.took == took;

    @override
    int get hashCode =>
        error.hashCode +
        took.hashCode;

  factory AddAuth401Response.fromJson(Map<String, dynamic> json) => _$AddAuth401ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddAuth401ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

