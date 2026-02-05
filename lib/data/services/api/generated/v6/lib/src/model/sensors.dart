//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sensors_sensors.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sensors.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Sensors {
  /// Returns a new [Sensors] instance.
  Sensors({

     this.sensors,
  });

  @JsonKey(
    
    name: r'sensors',
    required: false,
    includeIfNull: false,
  )


  final SensorsSensors? sensors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Sensors &&
      other.sensors == sensors;

    @override
    int get hashCode =>
        sensors.hashCode;

  factory Sensors.fromJson(Map<String, dynamic> json) => _$SensorsFromJson(json);

  Map<String, dynamic> toJson() => _$SensorsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

