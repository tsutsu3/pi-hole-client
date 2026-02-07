//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Config {
  /// Returns a new [Config] instance.
  Config({

     this.config,
  });

  @JsonKey(
    
    name: r'config',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfig? config;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Config &&
      other.config == config;

    @override
    int get hashCode =>
        config.hashCode;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

