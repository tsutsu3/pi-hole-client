//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_ntp_sync_rtc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_ntp_sync.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigNtpSync {
  /// Returns a new [ConfigConfigNtpSync] instance.
  ConfigConfigNtpSync({

     this.active,

     this.server,

     this.interval,

     this.count,

     this.rtc,
  });

  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



  @JsonKey(
    
    name: r'server',
    required: false,
    includeIfNull: false,
  )


  final String? server;



  @JsonKey(
    
    name: r'interval',
    required: false,
    includeIfNull: false,
  )


  final int? interval;



  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'rtc',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigNtpSyncRtc? rtc;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigNtpSync &&
      other.active == active &&
      other.server == server &&
      other.interval == interval &&
      other.count == count &&
      other.rtc == rtc;

    @override
    int get hashCode =>
        active.hashCode +
        server.hashCode +
        interval.hashCode +
        count.hashCode +
        rtc.hashCode;

  factory ConfigConfigNtpSync.fromJson(Map<String, dynamic> json) => _$ConfigConfigNtpSyncFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigNtpSyncToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

