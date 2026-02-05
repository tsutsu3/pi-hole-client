//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/session_session.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Session {
  /// Returns a new [Session] instance.
  Session({

    required  this.session,
  });

  @JsonKey(
    
    name: r'session',
    required: true,
    includeIfNull: false,
  )


  final SessionSession session;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Session &&
      other.session == session;

    @override
    int get hashCode =>
        session.hashCode;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

