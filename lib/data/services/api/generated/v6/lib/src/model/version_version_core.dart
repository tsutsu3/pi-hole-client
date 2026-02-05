//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version_core_remote.dart';
import 'package:pihole_v6_api/src/model/version_version_core_local.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_core.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionCore {
  /// Returns a new [VersionVersionCore] instance.
  VersionVersionCore({

     this.local,

     this.remote,
  });

  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionCoreLocal? local;



  @JsonKey(
    
    name: r'remote',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionCoreRemote? remote;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionCore &&
      other.local == local &&
      other.remote == remote;

    @override
    int get hashCode =>
        local.hashCode +
        remote.hashCode;

  factory VersionVersionCore.fromJson(Map<String, dynamic> json) => _$VersionVersionCoreFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionCoreToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

