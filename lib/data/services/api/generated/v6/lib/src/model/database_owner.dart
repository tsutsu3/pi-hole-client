//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/database_owner_user.dart';
import 'package:pihole_v6_api/src/model/database_owner_group.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_owner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DatabaseOwner {
  /// Returns a new [DatabaseOwner] instance.
  DatabaseOwner({

     this.user,

     this.group,
  });

  @JsonKey(
    
    name: r'user',
    required: false,
    includeIfNull: false,
  )


  final DatabaseOwnerUser? user;



  @JsonKey(
    
    name: r'group',
    required: false,
    includeIfNull: false,
  )


  final DatabaseOwnerGroup? group;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DatabaseOwner &&
      other.user == user &&
      other.group == group;

    @override
    int get hashCode =>
        user.hashCode +
        group.hashCode;

  factory DatabaseOwner.fromJson(Map<String, dynamic> json) => _$DatabaseOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseOwnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

