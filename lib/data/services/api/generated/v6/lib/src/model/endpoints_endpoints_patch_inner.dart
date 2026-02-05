//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endpoints_endpoints_patch_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EndpointsEndpointsPatchInner {
  /// Returns a new [EndpointsEndpointsPatchInner] instance.
  EndpointsEndpointsPatchInner({

     this.uri,

     this.parameters,
  });

      /// URI
  @JsonKey(
    
    name: r'uri',
    required: false,
    includeIfNull: false,
  )


  final String? uri;



      /// Parameters
  @JsonKey(
    
    name: r'parameters',
    required: false,
    includeIfNull: false,
  )


  final String? parameters;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EndpointsEndpointsPatchInner &&
      other.uri == uri &&
      other.parameters == parameters;

    @override
    int get hashCode =>
        uri.hashCode +
        parameters.hashCode;

  factory EndpointsEndpointsPatchInner.fromJson(Map<String, dynamic> json) => _$EndpointsEndpointsPatchInnerFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointsEndpointsPatchInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

