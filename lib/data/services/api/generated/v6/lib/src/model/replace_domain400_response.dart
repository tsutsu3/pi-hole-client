//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/errors_bad_request_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replace_domain400_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReplaceDomain400Response {
  /// Returns a new [ReplaceDomain400Response] instance.
  ReplaceDomain400Response({

     this.error,

     this.took,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ErrorsBadRequestError? error;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReplaceDomain400Response &&
      other.error == error &&
      other.took == took;

    @override
    int get hashCode =>
        error.hashCode +
        took.hashCode;

  factory ReplaceDomain400Response.fromJson(Map<String, dynamic> json) => _$ReplaceDomain400ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceDomain400ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

