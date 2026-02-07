//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/no_payload_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'no_payload.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NoPayload {
  /// Returns a new [NoPayload] instance.
  NoPayload({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final NoPayloadError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NoPayload &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory NoPayload.fromJson(Map<String, dynamic> json) => _$NoPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$NoPayloadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

