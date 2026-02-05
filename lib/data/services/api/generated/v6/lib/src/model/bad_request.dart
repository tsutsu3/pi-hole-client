//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/bad_request_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bad_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BadRequest {
  /// Returns a new [BadRequest] instance.
  BadRequest({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final BadRequestError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BadRequest &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory BadRequest.fromJson(Map<String, dynamic> json) => _$BadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

