//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/invalid_zip_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invalid_zip.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InvalidZip {
  /// Returns a new [InvalidZip] instance.
  InvalidZip({

     this.error,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final InvalidZipError? error;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InvalidZip &&
      other.error == error;

    @override
    int get hashCode =>
        error.hashCode;

  factory InvalidZip.fromJson(Map<String, dynamic> json) => _$InvalidZipFromJson(json);

  Map<String, dynamic> toJson() => _$InvalidZipToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

