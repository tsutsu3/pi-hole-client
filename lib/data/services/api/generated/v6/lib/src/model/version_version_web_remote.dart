//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_web_remote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionWebRemote {
  /// Returns a new [VersionVersionWebRemote] instance.
  VersionVersionWebRemote({

     this.version,

     this.hash,
  });

      /// Remote (Github) Pi-hole Web version (null if on custom branch)
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Remote (Github) Pi-hole Web hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionWebRemote &&
      other.version == version &&
      other.hash == hash;

    @override
    int get hashCode =>
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode);

  factory VersionVersionWebRemote.fromJson(Map<String, dynamic> json) => _$VersionVersionWebRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionWebRemoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

