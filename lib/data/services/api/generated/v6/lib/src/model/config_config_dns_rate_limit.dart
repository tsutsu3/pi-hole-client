//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_rate_limit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsRateLimit {
  /// Returns a new [ConfigConfigDnsRateLimit] instance.
  ConfigConfigDnsRateLimit({

     this.count,

     this.interval,
  });

  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



  @JsonKey(
    
    name: r'interval',
    required: false,
    includeIfNull: false,
  )


  final int? interval;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsRateLimit &&
      other.count == count &&
      other.interval == interval;

    @override
    int get hashCode =>
        count.hashCode +
        interval.hashCode;

  factory ConfigConfigDnsRateLimit.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsRateLimitFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsRateLimitToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

