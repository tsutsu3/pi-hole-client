//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_files_log.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_files.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigFiles {
  /// Returns a new [ConfigConfigFiles] instance.
  ConfigConfigFiles({

     this.pid,

     this.database,

     this.gravity,

     this.gravityTmp,

     this.macvendor,

     this.pcap,

     this.log,
  });

  @JsonKey(
    
    name: r'pid',
    required: false,
    includeIfNull: false,
  )


  final String? pid;



  @JsonKey(
    
    name: r'database',
    required: false,
    includeIfNull: false,
  )


  final String? database;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final String? gravity;



  @JsonKey(
    
    name: r'gravity_tmp',
    required: false,
    includeIfNull: false,
  )


  final String? gravityTmp;



  @JsonKey(
    
    name: r'macvendor',
    required: false,
    includeIfNull: false,
  )


  final String? macvendor;



  @JsonKey(
    
    name: r'pcap',
    required: false,
    includeIfNull: false,
  )


  final String? pcap;



  @JsonKey(
    
    name: r'log',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigFilesLog? log;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigFiles &&
      other.pid == pid &&
      other.database == database &&
      other.gravity == gravity &&
      other.gravityTmp == gravityTmp &&
      other.macvendor == macvendor &&
      other.pcap == pcap &&
      other.log == log;

    @override
    int get hashCode =>
        pid.hashCode +
        database.hashCode +
        gravity.hashCode +
        gravityTmp.hashCode +
        macvendor.hashCode +
        pcap.hashCode +
        log.hashCode;

  factory ConfigConfigFiles.fromJson(Map<String, dynamic> json) => _$ConfigConfigFilesFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigFilesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

