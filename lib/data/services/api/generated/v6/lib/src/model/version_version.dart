//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version_docker.dart';
import 'package:pihole_v6_api/src/model/version_version_core.dart';
import 'package:pihole_v6_api/src/model/version_version_ftl.dart';
import 'package:pihole_v6_api/src/model/version_version_web.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersion {
  /// Returns a new [VersionVersion] instance.
  VersionVersion({

     this.core,

     this.web,

     this.ftl,

     this.docker,
  });

  @JsonKey(
    
    name: r'core',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionCore? core;



  @JsonKey(
    
    name: r'web',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionWeb? web;



  @JsonKey(
    
    name: r'ftl',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionFtl? ftl;



  @JsonKey(
    
    name: r'docker',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionDocker? docker;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersion &&
      other.core == core &&
      other.web == web &&
      other.ftl == ftl &&
      other.docker == docker;

    @override
    int get hashCode =>
        core.hashCode +
        web.hashCode +
        ftl.hashCode +
        docker.hashCode;

  factory VersionVersion.fromJson(Map<String, dynamic> json) => _$VersionVersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

