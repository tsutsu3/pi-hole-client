//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_owner_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DatabaseOwnerUser {
  /// Returns a new [DatabaseOwnerUser] instance.
  DatabaseOwnerUser({

     this.uid,

     this.name,

     this.info,
  });

      /// UID of database owner
  @JsonKey(
    
    name: r'uid',
    required: false,
    includeIfNull: false,
  )


  final int? uid;



      /// Name of database owner (user)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// User info
  @JsonKey(
    
    name: r'info',
    required: false,
    includeIfNull: false,
  )


  final String? info;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DatabaseOwnerUser &&
      other.uid == uid &&
      other.name == name &&
      other.info == info;

    @override
    int get hashCode =>
        uid.hashCode +
        name.hashCode +
        info.hashCode;

  factory DatabaseOwnerUser.fromJson(Map<String, dynamic> json) => _$DatabaseOwnerUserFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseOwnerUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

