//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_sensors.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddSensors {
  /// Returns a new [PaddSensors] instance.
  PaddSensors({

     this.cpuTemp,

     this.hotLimit,

     this.unit,
  });

      /// CPU temperature
  @JsonKey(
    
    name: r'cpu_temp',
    required: false,
    includeIfNull: false,
  )


  final num? cpuTemp;



      /// Temperature limit
  @JsonKey(
    
    name: r'hot_limit',
    required: false,
    includeIfNull: false,
  )


  final num? hotLimit;



      /// Temperature unit
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddSensors &&
      other.cpuTemp == cpuTemp &&
      other.hotLimit == hotLimit &&
      other.unit == unit;

    @override
    int get hashCode =>
        (cpuTemp == null ? 0 : cpuTemp.hashCode) +
        hotLimit.hashCode +
        unit.hashCode;

  factory PaddSensors.fromJson(Map<String, dynamic> json) => _$PaddSensorsFromJson(json);

  Map<String, dynamic> toJson() => _$PaddSensorsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

