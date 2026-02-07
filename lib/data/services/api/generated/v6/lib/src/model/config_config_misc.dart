//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_misc_check.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_misc.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigMisc {
  /// Returns a new [ConfigConfigMisc] instance.
  ConfigConfigMisc({

     this.nice,

     this.delayStartup,

     this.addr2line,

     this.etcDnsmasqD,

     this.privacylevel,

     this.dnsmasqLines,

     this.extraLogging,

     this.readOnly,

     this.normalizeCPU,

     this.hideDnsmasqWarn,

     this.check,
  });

  @JsonKey(
    
    name: r'nice',
    required: false,
    includeIfNull: false,
  )


  final int? nice;



  @JsonKey(
    
    name: r'delay_startup',
    required: false,
    includeIfNull: false,
  )


  final int? delayStartup;



  @JsonKey(
    
    name: r'addr2line',
    required: false,
    includeIfNull: false,
  )


  final bool? addr2line;



  @JsonKey(
    
    name: r'etc_dnsmasq_d',
    required: false,
    includeIfNull: false,
  )


  final bool? etcDnsmasqD;



  @JsonKey(
    
    name: r'privacylevel',
    required: false,
    includeIfNull: false,
  )


  final int? privacylevel;



  @JsonKey(
    
    name: r'dnsmasq_lines',
    required: false,
    includeIfNull: false,
  )


  final List<String>? dnsmasqLines;



  @JsonKey(
    
    name: r'extraLogging',
    required: false,
    includeIfNull: false,
  )


  final bool? extraLogging;



  @JsonKey(
    
    name: r'readOnly',
    required: false,
    includeIfNull: false,
  )


  final bool? readOnly;



  @JsonKey(
    
    name: r'normalizeCPU',
    required: false,
    includeIfNull: false,
  )


  final bool? normalizeCPU;



  @JsonKey(
    
    name: r'hide_dnsmasq_warn',
    required: false,
    includeIfNull: false,
  )


  final bool? hideDnsmasqWarn;



  @JsonKey(
    
    name: r'check',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigMiscCheck? check;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigMisc &&
      other.nice == nice &&
      other.delayStartup == delayStartup &&
      other.addr2line == addr2line &&
      other.etcDnsmasqD == etcDnsmasqD &&
      other.privacylevel == privacylevel &&
      other.dnsmasqLines == dnsmasqLines &&
      other.extraLogging == extraLogging &&
      other.readOnly == readOnly &&
      other.normalizeCPU == normalizeCPU &&
      other.hideDnsmasqWarn == hideDnsmasqWarn &&
      other.check == check;

    @override
    int get hashCode =>
        nice.hashCode +
        delayStartup.hashCode +
        addr2line.hashCode +
        etcDnsmasqD.hashCode +
        privacylevel.hashCode +
        dnsmasqLines.hashCode +
        extraLogging.hashCode +
        readOnly.hashCode +
        normalizeCPU.hashCode +
        hideDnsmasqWarn.hashCode +
        check.hashCode;

  factory ConfigConfigMisc.fromJson(Map<String, dynamic> json) => _$ConfigConfigMiscFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigMiscToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

