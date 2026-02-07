//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/forbidden_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forbidden.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Forbidden {
  /// Returns a new [Forbidden] instance.
  Forbidden({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ForbiddenError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Forbidden &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory Forbidden.fromJson(Map<String, dynamic> json) => _$ForbiddenFromJson(json);

  Map<String, dynamic> toJson() => _$ForbiddenToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

