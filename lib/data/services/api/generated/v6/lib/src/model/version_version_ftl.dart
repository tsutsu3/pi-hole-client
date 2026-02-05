//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version_ftl_remote.dart';
import 'package:pihole_v6_api/src/model/version_version_ftl_local.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_ftl.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionFtl {
  /// Returns a new [VersionVersionFtl] instance.
  VersionVersionFtl({

     this.local,

     this.remote,
  });

  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionFtlLocal? local;



  @JsonKey(
    
    name: r'remote',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionFtlRemote? remote;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionFtl &&
      other.local == local &&
      other.remote == remote;

    @override
    int get hashCode =>
        local.hashCode +
        remote.hashCode;

  factory VersionVersionFtl.fromJson(Map<String, dynamic> json) => _$VersionVersionFtlFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionFtlToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

