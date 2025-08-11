import 'package:json_annotation/json_annotation.dart';

enum RouteFamily {
  @JsonValue('inet')
  inet,
  @JsonValue('inet6')
  inet6,
  @JsonValue('link')
  link,
  @JsonValue('mpls')
  mpls,
  @JsonValue('bridge')
  bridge,
  @JsonValue('unknown')
  unknown,
}
