//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Version {
  /// Returns a new [Version] instance.
  Version({

     this.version,
  });

  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final VersionVersion? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Version &&
      other.version == version;

    @override
    int get hashCode =>
        version.hashCode;

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

