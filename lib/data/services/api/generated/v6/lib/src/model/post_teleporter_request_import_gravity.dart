//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_teleporter_request_import_gravity.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostTeleporterRequestImportGravity {
  /// Returns a new [PostTeleporterRequestImportGravity] instance.
  PostTeleporterRequestImportGravity({

     this.group,

     this.adlist,

     this.adlistByGroup,

     this.domainlist,

     this.domainlistByGroup,

     this.client,

     this.clientByGroup,
  });

      /// Import Pi-hole's groups table
  @JsonKey(
    
    name: r'group',
    required: false,
    includeIfNull: false,
  )


  final bool? group;



      /// Import Pi-hole's adlist table
  @JsonKey(
    
    name: r'adlist',
    required: false,
    includeIfNull: false,
  )


  final bool? adlist;



      /// Import Pi-hole's table relating adlist entries to groups
  @JsonKey(
    
    name: r'adlist_by_group',
    required: false,
    includeIfNull: false,
  )


  final bool? adlistByGroup;



      /// Import Pi-hole's domainlist table
  @JsonKey(
    
    name: r'domainlist',
    required: false,
    includeIfNull: false,
  )


  final bool? domainlist;



      /// Import Pi-hole's table relating domainlist entries to groups
  @JsonKey(
    
    name: r'domainlist_by_group',
    required: false,
    includeIfNull: false,
  )


  final bool? domainlistByGroup;



      /// Import Pi-hole's client table
  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final bool? client;



      /// Import Pi-hole's table relating client entries to groups
  @JsonKey(
    
    name: r'client_by_group',
    required: false,
    includeIfNull: false,
  )


  final bool? clientByGroup;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostTeleporterRequestImportGravity &&
      other.group == group &&
      other.adlist == adlist &&
      other.adlistByGroup == adlistByGroup &&
      other.domainlist == domainlist &&
      other.domainlistByGroup == domainlistByGroup &&
      other.client == client &&
      other.clientByGroup == clientByGroup;

    @override
    int get hashCode =>
        group.hashCode +
        adlist.hashCode +
        adlistByGroup.hashCode +
        domainlist.hashCode +
        domainlistByGroup.hashCode +
        client.hashCode +
        clientByGroup.hashCode;

  factory PostTeleporterRequestImportGravity.fromJson(Map<String, dynamic> json) => _$PostTeleporterRequestImportGravityFromJson(json);

  Map<String, dynamic> toJson() => _$PostTeleporterRequestImportGravityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

