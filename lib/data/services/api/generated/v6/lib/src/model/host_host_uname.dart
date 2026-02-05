//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_uname.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostUname {
  /// Returns a new [HostHostUname] instance.
  HostHostUname({

     this.domainname,

     this.machine,

     this.nodename,

     this.release,

     this.sysname,

     this.version,
  });

  @JsonKey(
    
    name: r'domainname',
    required: false,
    includeIfNull: false,
  )


  final String? domainname;



  @JsonKey(
    
    name: r'machine',
    required: false,
    includeIfNull: false,
  )


  final String? machine;



  @JsonKey(
    
    name: r'nodename',
    required: false,
    includeIfNull: false,
  )


  final String? nodename;



  @JsonKey(
    
    name: r'release',
    required: false,
    includeIfNull: false,
  )


  final String? release;



  @JsonKey(
    
    name: r'sysname',
    required: false,
    includeIfNull: false,
  )


  final String? sysname;



  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostUname &&
      other.domainname == domainname &&
      other.machine == machine &&
      other.nodename == nodename &&
      other.release == release &&
      other.sysname == sysname &&
      other.version == version;

    @override
    int get hashCode =>
        domainname.hashCode +
        machine.hashCode +
        nodename.hashCode +
        release.hashCode +
        sysname.hashCode +
        version.hashCode;

  factory HostHostUname.fromJson(Map<String, dynamic> json) => _$HostHostUnameFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostUnameToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

