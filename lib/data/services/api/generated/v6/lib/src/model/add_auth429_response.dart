//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/too_many_requests_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_auth429_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddAuth429Response {
  /// Returns a new [AddAuth429Response] instance.
  AddAuth429Response({

     this.error,

     this.took,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final TooManyRequestsError? error;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddAuth429Response &&
      other.error == error &&
      other.took == took;

    @override
    int get hashCode =>
        error.hashCode +
        took.hashCode;

  factory AddAuth429Response.fromJson(Map<String, dynamic> json) => _$AddAuth429ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddAuth429ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

