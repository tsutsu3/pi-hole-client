//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/totp_totp.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_auth_totp200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetAuthTotp200Response {
  /// Returns a new [GetAuthTotp200Response] instance.
  GetAuthTotp200Response({

     this.totp,

     this.took,
  });

  @JsonKey(
    
    name: r'totp',
    required: false,
    includeIfNull: false,
  )


  final TotpTotp? totp;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetAuthTotp200Response &&
      other.totp == totp &&
      other.took == took;

    @override
    int get hashCode =>
        totp.hashCode +
        took.hashCode;

  factory GetAuthTotp200Response.fromJson(Map<String, dynamic> json) => _$GetAuthTotp200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAuthTotp200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

