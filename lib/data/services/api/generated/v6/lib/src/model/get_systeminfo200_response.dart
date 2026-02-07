//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/system_system.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_systeminfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetSysteminfo200Response {
  /// Returns a new [GetSysteminfo200Response] instance.
  GetSysteminfo200Response({

     this.system,

     this.took,
  });

  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final SystemSystem? system;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetSysteminfo200Response &&
      other.system == system &&
      other.took == took;

    @override
    int get hashCode =>
        system.hashCode +
        took.hashCode;

  factory GetSysteminfo200Response.fromJson(Map<String, dynamic> json) => _$GetSysteminfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSysteminfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

