//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sensors_sensors_list_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sensors_sensors.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SensorsSensors {
  /// Returns a new [SensorsSensors] instance.
  SensorsSensors({

     this.list,

     this.cpuTemp,

     this.hotLimit,

     this.unit,
  });

      /// Sensor information (temperature)
  @JsonKey(
    
    name: r'list',
    required: false,
    includeIfNull: false,
  )


  final List<SensorsSensorsListInner>? list;



      /// CPU temperature (best guess, may be *null* if no sensor can be reliably identified, please report if you encounter this)
  @JsonKey(
    
    name: r'cpu_temp',
    required: false,
    includeIfNull: false,
  )


  final num? cpuTemp;



      /// Limit defined in FTL's config beyond which the CPU should be considered hot
  @JsonKey(
    
    name: r'hot_limit',
    required: false,
    includeIfNull: false,
  )


  final num? hotLimit;



      /// Sensor value unit
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SensorsSensors &&
      other.list == list &&
      other.cpuTemp == cpuTemp &&
      other.hotLimit == hotLimit &&
      other.unit == unit;

    @override
    int get hashCode =>
        list.hashCode +
        (cpuTemp == null ? 0 : cpuTemp.hashCode) +
        hotLimit.hashCode +
        unit.hashCode;

  factory SensorsSensors.fromJson(Map<String, dynamic> json) => _$SensorsSensorsFromJson(json);

  Map<String, dynamic> toJson() => _$SensorsSensorsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

