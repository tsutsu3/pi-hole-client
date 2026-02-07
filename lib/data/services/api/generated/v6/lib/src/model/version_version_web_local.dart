//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_web_local.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionWebLocal {
  /// Returns a new [VersionVersionWebLocal] instance.
  VersionVersionWebLocal({

     this.branch,

     this.version,

     this.hash,
  });

      /// Local Pi-hole Web branch
  @JsonKey(
    
    name: r'branch',
    required: false,
    includeIfNull: false,
  )


  final String? branch;



      /// Local Pi-hole Web version
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Local Pi-hole Web hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionWebLocal &&
      other.branch == branch &&
      other.version == version &&
      other.hash == hash;

    @override
    int get hashCode =>
        (branch == null ? 0 : branch.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode);

  factory VersionVersionWebLocal.fromJson(Map<String, dynamic> json) => _$VersionVersionWebLocalFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionWebLocalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

