//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_docker.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionDocker {
  /// Returns a new [VersionVersionDocker] instance.
  VersionVersionDocker({

     this.local,

     this.remote,
  });

      /// Local Pi-hole Docker image version (`null` if not running in Docker)
  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final String? local;



      /// Remote (Docker Hub) Pi-hole Docker image version (`null` if not running in Docker)
  @JsonKey(
    
    name: r'remote',
    required: false,
    includeIfNull: false,
  )


  final String? remote;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionDocker &&
      other.local == local &&
      other.remote == remote;

    @override
    int get hashCode =>
        (local == null ? 0 : local.hashCode) +
        (remote == null ? 0 : remote.hashCode);

  factory VersionVersionDocker.fromJson(Map<String, dynamic> json) => _$VersionVersionDockerFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionDockerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

