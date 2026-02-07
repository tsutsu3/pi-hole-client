//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dns_blocking.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDnsBlocking {
  /// Returns a new [ConfigConfigDnsBlocking] instance.
  ConfigConfigDnsBlocking({

     this.active,

     this.mode,

     this.edns,
  });

  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



  @JsonKey(
    
    name: r'mode',
    required: false,
    includeIfNull: false,
  )


  final String? mode;



  @JsonKey(
    
    name: r'edns',
    required: false,
    includeIfNull: false,
  )


  final String? edns;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDnsBlocking &&
      other.active == active &&
      other.mode == mode &&
      other.edns == edns;

    @override
    int get hashCode =>
        active.hashCode +
        mode.hashCode +
        edns.hashCode;

  factory ConfigConfigDnsBlocking.fromJson(Map<String, dynamic> json) => _$ConfigConfigDnsBlockingFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDnsBlockingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

