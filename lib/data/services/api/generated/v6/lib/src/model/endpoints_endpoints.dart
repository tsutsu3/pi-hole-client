//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/endpoints_endpoints_get_inner.dart';
import 'package:pihole_v6_api/src/model/endpoints_endpoints_patch_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endpoints_endpoints.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EndpointsEndpoints {
  /// Returns a new [EndpointsEndpoints] instance.
  EndpointsEndpoints({

     this.get_,

     this.post,

     this.put,

     this.patch_,

     this.delete,
  });

  @JsonKey(
    
    name: r'get',
    required: false,
    includeIfNull: false,
  )


  final List<EndpointsEndpointsGetInner>? get_;



  @JsonKey(
    
    name: r'post',
    required: false,
    includeIfNull: false,
  )


  final List<EndpointsEndpointsGetInner>? post;



  @JsonKey(
    
    name: r'put',
    required: false,
    includeIfNull: false,
  )


  final List<EndpointsEndpointsGetInner>? put;



  @JsonKey(
    
    name: r'patch',
    required: false,
    includeIfNull: false,
  )


  final List<EndpointsEndpointsPatchInner>? patch_;



  @JsonKey(
    
    name: r'delete',
    required: false,
    includeIfNull: false,
  )


  final List<EndpointsEndpointsPatchInner>? delete;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EndpointsEndpoints &&
      other.get_ == get_ &&
      other.post == post &&
      other.put == put &&
      other.patch_ == patch_ &&
      other.delete == delete;

    @override
    int get hashCode =>
        get_.hashCode +
        post.hashCode +
        put.hashCode +
        patch_.hashCode +
        delete.hashCode;

  factory EndpointsEndpoints.fromJson(Map<String, dynamic> json) => _$EndpointsEndpointsFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointsEndpointsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

