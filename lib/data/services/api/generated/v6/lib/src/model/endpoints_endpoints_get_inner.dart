//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endpoints_endpoints_get_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EndpointsEndpointsGetInner {
  /// Returns a new [EndpointsEndpointsGetInner] instance.
  EndpointsEndpointsGetInner({

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
    bool operator ==(Object other) => identical(this, other) || other is EndpointsEndpointsGetInner &&
      other.uri == uri &&
      other.parameters == parameters;

    @override
    int get hashCode =>
        uri.hashCode +
        parameters.hashCode;

  factory EndpointsEndpointsGetInner.fromJson(Map<String, dynamic> json) => _$EndpointsEndpointsGetInnerFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointsEndpointsGetInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

