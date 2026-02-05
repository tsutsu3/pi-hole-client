//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_domain.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsDomain {
  /// Returns a new [ConfigConfigDnsDomain] instance.
  ConfigConfigDnsDomain({

     this.name,

     this.local,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final bool? local;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsDomain &&
      other.name == name &&
      other.local == local;

    @override
    int get hashCode =>
        name.hashCode +
        local.hashCode;

  factory ConfigConfigDnsDomain.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsDomainFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsDomainToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

