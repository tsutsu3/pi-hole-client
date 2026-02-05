//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/unauthorized_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unauthorized.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Unauthorized {
  /// Returns a new [Unauthorized] instance.
  Unauthorized({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final UnauthorizedError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Unauthorized &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory Unauthorized.fromJson(Map<String, dynamic> json) => _$UnauthorizedFromJson(json);

  Map<String, dynamic> toJson() => _$UnauthorizedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

