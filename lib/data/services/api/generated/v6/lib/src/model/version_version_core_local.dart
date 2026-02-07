//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_core_local.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionCoreLocal {
  /// Returns a new [VersionVersionCoreLocal] instance.
  VersionVersionCoreLocal({

     this.branch,

     this.version,

     this.hash,
  });

      /// Local Pi-hole Core branch
  @JsonKey(
    
    name: r'branch',
    required: false,
    includeIfNull: false,
  )


  final String? branch;



      /// Local Pi-hole Core version
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Local Pi-hole Core hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionCoreLocal &&
      other.branch == branch &&
      other.version == version &&
      other.hash == hash;

    @override
    int get hashCode =>
        (branch == null ? 0 : branch.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode);

  factory VersionVersionCoreLocal.fromJson(Map<String, dynamic> json) => _$VersionVersionCoreLocalFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionCoreLocalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

