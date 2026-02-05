//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sessions_list_sessions_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_auth_sessions200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetAuthSessions200Response {
  /// Returns a new [GetAuthSessions200Response] instance.
  GetAuthSessions200Response({

     this.sessions,

     this.took,
  });

  @JsonKey(
    
    name: r'sessions',
    required: false,
    includeIfNull: false,
  )


  final List<SessionsListSessionsInner>? sessions;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetAuthSessions200Response &&
      other.sessions == sessions &&
      other.took == took;

    @override
    int get hashCode =>
        sessions.hashCode +
        took.hashCode;

  factory GetAuthSessions200Response.fromJson(Map<String, dynamic> json) => _$GetAuthSessions200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAuthSessions200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

