//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/headers_headers_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_client200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetClient200Response {
  /// Returns a new [GetClient200Response] instance.
  GetClient200Response({

     this.remoteAddr,

     this.httpVersion,

     this.method,

     this.headers,

     this.took,
  });

      /// Address of requesting client
  @JsonKey(
    
    name: r'remote_addr',
    required: false,
    includeIfNull: false,
  )


  final String? remoteAddr;



      /// HTTP version of request
  @JsonKey(
    
    name: r'http_version',
    required: false,
    includeIfNull: false,
  )


  final String? httpVersion;



      /// Request method
  @JsonKey(
    
    name: r'method',
    required: false,
    includeIfNull: false,
  )


  final String? method;



      /// Request headers
  @JsonKey(
    
    name: r'headers',
    required: false,
    includeIfNull: false,
  )


  final List<HeadersHeadersInner>? headers;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetClient200Response &&
      other.remoteAddr == remoteAddr &&
      other.httpVersion == httpVersion &&
      other.method == method &&
      other.headers == headers &&
      other.took == took;

    @override
    int get hashCode =>
        remoteAddr.hashCode +
        httpVersion.hashCode +
        method.hashCode +
        headers.hashCode +
        took.hashCode;

  factory GetClient200Response.fromJson(Map<String, dynamic> json) => _$GetClient200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetClient200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

