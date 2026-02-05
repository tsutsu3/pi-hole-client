//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/session_session.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_auth200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetAuth200Response {
  /// Returns a new [GetAuth200Response] instance.
  GetAuth200Response({

    required  this.session,

     this.took,
  });

  @JsonKey(
    
    name: r'session',
    required: true,
    includeIfNull: false,
  )


  final SessionSession session;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetAuth200Response &&
      other.session == session &&
      other.took == took;

    @override
    int get hashCode =>
        session.hashCode +
        took.hashCode;

  factory GetAuth200Response.fromJson(Map<String, dynamic> json) => _$GetAuth200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAuth200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

