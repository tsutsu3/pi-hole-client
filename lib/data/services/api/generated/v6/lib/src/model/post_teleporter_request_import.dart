//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/post_teleporter_request_import_gravity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_teleporter_request_import.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostTeleporterRequestImport {
  /// Returns a new [PostTeleporterRequestImport] instance.
  PostTeleporterRequestImport({

     this.config,

     this.dhcpLeases,

     this.gravity,
  });

      /// Import Pi-hole configuration
  @JsonKey(
    
    name: r'config',
    required: false,
    includeIfNull: false,
  )


  final bool? config;



      /// Import Pi-hole DHCP leases
  @JsonKey(
    
    name: r'dhcp_leases',
    required: false,
    includeIfNull: false,
  )


  final bool? dhcpLeases;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final PostTeleporterRequestImportGravity? gravity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostTeleporterRequestImport &&
      other.config == config &&
      other.dhcpLeases == dhcpLeases &&
      other.gravity == gravity;

    @override
    int get hashCode =>
        config.hashCode +
        dhcpLeases.hashCode +
        gravity.hashCode;

  factory PostTeleporterRequestImport.fromJson(Map<String, dynamic> json) => _$PostTeleporterRequestImportFromJson(json);

  Map<String, dynamic> toJson() => _$PostTeleporterRequestImportToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

