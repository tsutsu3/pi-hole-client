//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_resolver.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigResolver {
  /// Returns a new [ConfigConfigResolver] instance.
  ConfigConfigResolver({

     this.resolveIPv4,

     this.resolveIPv6,

     this.networkNames,

     this.refreshNames,
  });

  @JsonKey(
    
    name: r'resolveIPv4',
    required: false,
    includeIfNull: false,
  )


  final bool? resolveIPv4;



  @JsonKey(
    
    name: r'resolveIPv6',
    required: false,
    includeIfNull: false,
  )


  final bool? resolveIPv6;



  @JsonKey(
    
    name: r'networkNames',
    required: false,
    includeIfNull: false,
  )


  final bool? networkNames;



  @JsonKey(
    
    name: r'refreshNames',
    required: false,
    includeIfNull: false,
  )


  final String? refreshNames;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigResolver &&
      other.resolveIPv4 == resolveIPv4 &&
      other.resolveIPv6 == resolveIPv6 &&
      other.networkNames == networkNames &&
      other.refreshNames == refreshNames;

    @override
    int get hashCode =>
        resolveIPv4.hashCode +
        resolveIPv6.hashCode +
        networkNames.hashCode +
        refreshNames.hashCode;

  factory ConfigConfigResolver.fromJson(Map<String, dynamic> json) => _$ConfigConfigResolverFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigResolverToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

