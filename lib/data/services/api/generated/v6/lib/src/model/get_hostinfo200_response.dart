//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/host_host.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_hostinfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetHostinfo200Response {
  /// Returns a new [GetHostinfo200Response] instance.
  GetHostinfo200Response({

     this.host,

     this.took,
  });

  @JsonKey(
    
    name: r'host',
    required: false,
    includeIfNull: false,
  )


  final HostHost? host;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetHostinfo200Response &&
      other.host == host &&
      other.took == took;

    @override
    int get hashCode =>
        host.hashCode +
        took.hashCode;

  factory GetHostinfo200Response.fromJson(Map<String, dynamic> json) => _$GetHostinfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetHostinfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

