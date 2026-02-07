//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/routes_routes_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_routes200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetRoutes200Response {
  /// Returns a new [GetRoutes200Response] instance.
  GetRoutes200Response({

     this.routes,

     this.took,
  });

      /// Array of routes
  @JsonKey(
    
    name: r'routes',
    required: false,
    includeIfNull: false,
  )


  final List<RoutesRoutesInner>? routes;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetRoutes200Response &&
      other.routes == routes &&
      other.took == took;

    @override
    int get hashCode =>
        routes.hashCode +
        took.hashCode;

  factory GetRoutes200Response.fromJson(Map<String, dynamic> json) => _$GetRoutes200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRoutes200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

