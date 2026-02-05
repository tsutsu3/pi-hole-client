//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sensors_sensors_list_inner_temps_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sensors_sensors_list_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SensorsSensorsListInner {
  /// Returns a new [SensorsSensorsListInner] instance.
  SensorsSensorsListInner({

     this.name,

     this.path,

     this.source_,

     this.temps,
  });

      /// Description of temperature sensor (if available, `null` otherwise)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Short path of temperature sensor
  @JsonKey(
    
    name: r'path',
    required: false,
    includeIfNull: false,
  )


  final String? path;



      /// Path-like device description
  @JsonKey(
    
    name: r'source',
    required: false,
    includeIfNull: false,
  )


  final String? source_;



  @JsonKey(
    
    name: r'temps',
    required: false,
    includeIfNull: false,
  )


  final List<SensorsSensorsListInnerTempsInner>? temps;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SensorsSensorsListInner &&
      other.name == name &&
      other.path == path &&
      other.source_ == source_ &&
      other.temps == temps;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        path.hashCode +
        source_.hashCode +
        temps.hashCode;

  factory SensorsSensorsListInner.fromJson(Map<String, dynamic> json) => _$SensorsSensorsListInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SensorsSensorsListInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

