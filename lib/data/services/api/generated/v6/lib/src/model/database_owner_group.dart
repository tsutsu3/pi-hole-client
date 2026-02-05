//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_owner_group.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DatabaseOwnerGroup {
  /// Returns a new [DatabaseOwnerGroup] instance.
  DatabaseOwnerGroup({

     this.gid,

     this.name,
  });

      /// GID of database owner
  @JsonKey(
    
    name: r'gid',
    required: false,
    includeIfNull: false,
  )


  final int? gid;



      /// Name of database owner (group)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DatabaseOwnerGroup &&
      other.gid == gid &&
      other.name == name;

    @override
    int get hashCode =>
        gid.hashCode +
        name.hashCode;

  factory DatabaseOwnerGroup.fromJson(Map<String, dynamic> json) => _$DatabaseOwnerGroupFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseOwnerGroupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

