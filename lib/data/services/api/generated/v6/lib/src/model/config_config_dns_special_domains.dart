//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_special_domains.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsSpecialDomains {
  /// Returns a new [ConfigConfigDnsSpecialDomains] instance.
  ConfigConfigDnsSpecialDomains({

     this.mozillaCanary,

     this.iCloudPrivateRelay,

     this.designatedResolver,
  });

  @JsonKey(
    
    name: r'mozillaCanary',
    required: false,
    includeIfNull: false,
  )


  final bool? mozillaCanary;



  @JsonKey(
    
    name: r'iCloudPrivateRelay',
    required: false,
    includeIfNull: false,
  )


  final bool? iCloudPrivateRelay;



  @JsonKey(
    
    name: r'designatedResolver',
    required: false,
    includeIfNull: false,
  )


  final bool? designatedResolver;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsSpecialDomains &&
      other.mozillaCanary == mozillaCanary &&
      other.iCloudPrivateRelay == iCloudPrivateRelay &&
      other.designatedResolver == designatedResolver;

    @override
    int get hashCode =>
        mozillaCanary.hashCode +
        iCloudPrivateRelay.hashCode +
        designatedResolver.hashCode;

  factory ConfigConfigDnsSpecialDomains.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsSpecialDomainsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsSpecialDomainsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

