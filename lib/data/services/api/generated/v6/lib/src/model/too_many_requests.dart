//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/too_many_requests_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'too_many_requests.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TooManyRequests {
  /// Returns a new [TooManyRequests] instance.
  TooManyRequests({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final TooManyRequestsError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TooManyRequests &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory TooManyRequests.fromJson(Map<String, dynamic> json) => _$TooManyRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$TooManyRequestsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

