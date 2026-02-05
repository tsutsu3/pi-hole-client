//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sessions_list_sessions_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sessions_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionsList {
  /// Returns a new [SessionsList] instance.
  SessionsList({

     this.sessions,
  });

  @JsonKey(
    
    name: r'sessions',
    required: false,
    includeIfNull: false,
  )


  final List<SessionsListSessionsInner>? sessions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionsList &&
      other.sessions == sessions;

    @override
    int get hashCode =>
        sessions.hashCode;

  factory SessionsList.fromJson(Map<String, dynamic> json) => _$SessionsListFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

