//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_ftl_local.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionFtlLocal {
  /// Returns a new [VersionVersionFtlLocal] instance.
  VersionVersionFtlLocal({

     this.branch,

     this.version,

     this.hash,

     this.date,
  });

      /// Local Pi-hole FTL branch
  @JsonKey(
    
    name: r'branch',
    required: false,
    includeIfNull: false,
  )


  final String? branch;



      /// Local Pi-hole FTL version
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Local Pi-hole FTL hash
  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;



      /// Build time of your local Pi-hole FTL
  @JsonKey(
    
    name: r'date',
    required: false,
    includeIfNull: false,
  )


  final String? date;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionFtlLocal &&
      other.branch == branch &&
      other.version == version &&
      other.hash == hash &&
      other.date == date;

    @override
    int get hashCode =>
        (branch == null ? 0 : branch.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (hash == null ? 0 : hash.hashCode) +
        (date == null ? 0 : date.hashCode);

  factory VersionVersionFtlLocal.fromJson(Map<String, dynamic> json) => _$VersionVersionFtlLocalFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionFtlLocalToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

