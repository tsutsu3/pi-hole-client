//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_api_temp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverApiTemp {
  /// Returns a new [ConfigConfigWebserverApiTemp] instance.
  ConfigConfigWebserverApiTemp({

     this.limit,

     this.unit,
  });

  @JsonKey(
    
    name: r'limit',
    required: false,
    includeIfNull: false,
  )


  final num? limit;



  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverApiTemp &&
      other.limit == limit &&
      other.unit == unit;

    @override
    int get hashCode =>
        limit.hashCode +
        unit.hashCode;

  factory ConfigConfigWebserverApiTemp.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverApiTempFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverApiTempToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

