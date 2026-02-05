//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_files_log.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigFilesLog {
  /// Returns a new [ConfigConfigFilesLog] instance.
  ConfigConfigFilesLog({

     this.ftl,

     this.dnsmasq,

     this.webserver,
  });

  @JsonKey(
    
    name: r'ftl',
    required: false,
    includeIfNull: false,
  )


  final String? ftl;



  @JsonKey(
    
    name: r'dnsmasq',
    required: false,
    includeIfNull: false,
  )


  final String? dnsmasq;



  @JsonKey(
    
    name: r'webserver',
    required: false,
    includeIfNull: false,
  )


  final String? webserver;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigFilesLog &&
      other.ftl == ftl &&
      other.dnsmasq == dnsmasq &&
      other.webserver == webserver;

    @override
    int get hashCode =>
        ftl.hashCode +
        dnsmasq.hashCode +
        webserver.hashCode;

  factory ConfigConfigFilesLog.fromJson(Map<String, dynamic> json) => _$ConfigConfigFilesLogFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigFilesLogToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

