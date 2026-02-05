//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_logininfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetLogininfo200Response {
  /// Returns a new [GetLogininfo200Response] instance.
  GetLogininfo200Response({

     this.httpsPort,

     this.dns,

     this.took,
  });

      /// HTTPS port of the Pi-hole webserver (0 if disabled)
  @JsonKey(
    
    name: r'https_port',
    required: false,
    includeIfNull: false,
  )


  final int? httpsPort;



      /// Whether the DNS server is up and running. False only in failed state
  @JsonKey(
    
    name: r'dns',
    required: false,
    includeIfNull: false,
  )


  final bool? dns;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetLogininfo200Response &&
      other.httpsPort == httpsPort &&
      other.dns == dns &&
      other.took == took;

    @override
    int get hashCode =>
        httpsPort.hashCode +
        dns.hashCode +
        took.hashCode;

  factory GetLogininfo200Response.fromJson(Map<String, dynamic> json) => _$GetLogininfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLogininfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

