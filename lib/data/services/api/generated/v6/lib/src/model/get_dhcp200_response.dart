//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/leases_leases_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dhcp200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDhcp200Response {
  /// Returns a new [GetDhcp200Response] instance.
  GetDhcp200Response({

     this.leases,

     this.took,
  });

      /// DHCP leases
  @JsonKey(
    
    name: r'leases',
    required: false,
    includeIfNull: false,
  )


  final List<LeasesLeasesInner>? leases;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDhcp200Response &&
      other.leases == leases &&
      other.took == took;

    @override
    int get hashCode =>
        leases.hashCode +
        took.hashCode;

  factory GetDhcp200Response.fromJson(Map<String, dynamic> json) => _$GetDhcp200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDhcp200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

