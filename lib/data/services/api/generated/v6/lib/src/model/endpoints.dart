//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/endpoints_endpoints.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endpoints.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Endpoints {
  /// Returns a new [Endpoints] instance.
  Endpoints({

     this.endpoints,
  });

  @JsonKey(
    
    name: r'endpoints',
    required: false,
    includeIfNull: false,
  )


  final EndpointsEndpoints? endpoints;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Endpoints &&
      other.endpoints == endpoints;

    @override
    int get hashCode =>
        endpoints.hashCode;

  factory Endpoints.fromJson(Map<String, dynamic> json) => _$EndpointsFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

