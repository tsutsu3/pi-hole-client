//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/errors_bad_request_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'errors_bad_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorsBadRequest {
  /// Returns a new [ErrorsBadRequest] instance.
  ErrorsBadRequest({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ErrorsBadRequestError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ErrorsBadRequest &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory ErrorsBadRequest.fromJson(Map<String, dynamic> json) => _$ErrorsBadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsBadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

