//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/routes_routes_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'routes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Routes {
  /// Returns a new [Routes] instance.
  Routes({

     this.routes,
  });

      /// Array of routes
  @JsonKey(
    
    name: r'routes',
    required: false,
    includeIfNull: false,
  )


  final List<RoutesRoutesInner>? routes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Routes &&
      other.routes == routes;

    @override
    int get hashCode =>
        routes.hashCode;

  factory Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

