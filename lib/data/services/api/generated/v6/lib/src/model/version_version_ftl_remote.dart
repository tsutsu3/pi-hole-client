//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_ftl_remote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionFtlRemote {
  /// Returns a new [VersionVersionFtlRemote] instance.
  VersionVersionFtlRemote({

     this.version,

     this.hash,
  });

      /// Remote (Github) Pi-hole FTL version (null if on custom branch)
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Remote (Github) Pi-hole FTL hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionFtlRemote &&
      other.version == version &&
      other.hash == hash;

    @override
    int get hashCode =>
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode);

  factory VersionVersionFtlRemote.fromJson(Map<String, dynamic> json) => _$VersionVersionFtlRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionFtlRemoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

