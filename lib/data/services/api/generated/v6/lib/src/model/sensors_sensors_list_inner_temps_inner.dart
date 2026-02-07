//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sensors_sensors_list_inner_temps_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SensorsSensorsListInnerTempsInner {
  /// Returns a new [SensorsSensorsListInnerTempsInner] instance.
  SensorsSensorsListInnerTempsInner({

     this.name,

     this.value,

     this.max,

     this.crit,

     this.sensor,
  });

      /// Description of temperature sensor (if available, `null` otherwise)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Sensor value
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final num? value;



      /// Maximum sensor value (if available, `null` otherwise)
  @JsonKey(
    
    name: r'max',
    required: false,
    includeIfNull: false,
  )


  final num? max;



      /// Critical sensor value (if available, `null` otherwise)
  @JsonKey(
    
    name: r'crit',
    required: false,
    includeIfNull: false,
  )


  final num? crit;



      /// Short path of temperature sensor
  @JsonKey(
    
    name: r'sensor',
    required: false,
    includeIfNull: false,
  )


  final String? sensor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SensorsSensorsListInnerTempsInner &&
      other.name == name &&
      other.value == value &&
      other.max == max &&
      other.crit == crit &&
      other.sensor == sensor;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        value.hashCode +
        (max == null ? 0 : max.hashCode) +
        (crit == null ? 0 : crit.hashCode) +
        sensor.hashCode;

  factory SensorsSensorsListInnerTempsInner.fromJson(Map<String, dynamic> json) => _$SensorsSensorsListInnerTempsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SensorsSensorsListInnerTempsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

