//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sensors_sensors.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_sensors200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetSensors200Response {
  /// Returns a new [GetSensors200Response] instance.
  GetSensors200Response({

     this.sensors,

     this.took,
  });

  @JsonKey(
    
    name: r'sensors',
    required: false,
    includeIfNull: false,
  )


  final SensorsSensors? sensors;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetSensors200Response &&
      other.sensors == sensors &&
      other.took == took;

    @override
    int get hashCode =>
        sensors.hashCode +
        took.hashCode;

  factory GetSensors200Response.fromJson(Map<String, dynamic> json) => _$GetSensors200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSensors200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

