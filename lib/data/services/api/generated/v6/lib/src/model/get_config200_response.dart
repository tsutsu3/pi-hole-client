//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_config200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetConfig200Response {
  /// Returns a new [GetConfig200Response] instance.
  GetConfig200Response({

     this.config,

     this.took,
  });

  @JsonKey(
    
    name: r'config',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfig? config;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetConfig200Response &&
      other.config == config &&
      other.took == took;

    @override
    int get hashCode =>
        config.hashCode +
        took.hashCode;

  factory GetConfig200Response.fromJson(Map<String, dynamic> json) => _$GetConfig200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetConfig200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

