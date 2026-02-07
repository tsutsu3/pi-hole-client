//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_ntp_sync_rtc.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigNtpSyncRtc {
  /// Returns a new [ConfigConfigNtpSyncRtc] instance.
  ConfigConfigNtpSyncRtc({

     this.set_,

     this.device,

     this.utc,
  });

  @JsonKey(
    
    name: r'set',
    required: false,
    includeIfNull: false,
  )


  final bool? set_;



  @JsonKey(
    
    name: r'device',
    required: false,
    includeIfNull: false,
  )


  final String? device;



  @JsonKey(
    
    name: r'utc',
    required: false,
    includeIfNull: false,
  )


  final bool? utc;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigNtpSyncRtc &&
      other.set_ == set_ &&
      other.device == device &&
      other.utc == utc;

    @override
    int get hashCode =>
        set_.hashCode +
        device.hashCode +
        utc.hashCode;

  factory ConfigConfigNtpSyncRtc.fromJson(Map<String, dynamic> json) => _$ConfigConfigNtpSyncRtcFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigNtpSyncRtcToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

