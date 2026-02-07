//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_core_remote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionCoreRemote {
  /// Returns a new [VersionVersionCoreRemote] instance.
  VersionVersionCoreRemote({

     this.version,

     this.hash,
  });

      /// Remote (Github) Pi-hole Core version (null if on custom branch)
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Remote (Github) Pi-hole Core hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionCoreRemote &&
      other.version == version &&
      other.hash == hash;

    @override
    int get hashCode =>
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode);

  factory VersionVersionCoreRemote.fromJson(Map<String, dynamic> json) => _$VersionVersionCoreRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionCoreRemoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

