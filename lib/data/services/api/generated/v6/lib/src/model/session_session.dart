//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionSession {
  /// Returns a new [SessionSession] instance.
  SessionSession({

    required  this.valid,

    required  this.totp,

    required  this.sid,

     this.csrf,

    required  this.validity,

    required  this.message,
  });

      /// Valid session indicator (client is authenticated)
  @JsonKey(
    
    name: r'valid',
    required: true,
    includeIfNull: false,
  )


  final bool valid;



      /// Whether 2FA (TOTP) is enabled on this Pi-hole
  @JsonKey(
    
    name: r'totp',
    required: true,
    includeIfNull: false,
  )


  final bool totp;



      /// Session ID
  @JsonKey(
    
    name: r'sid',
    required: true,
    includeIfNull: true,
  )


  final String? sid;



      /// CSRF token
  @JsonKey(
    
    name: r'csrf',
    required: false,
    includeIfNull: false,
  )


  final String? csrf;



      /// Remaining lifetime of this session unless refreshed (seconds)
  @JsonKey(
    
    name: r'validity',
    required: true,
    includeIfNull: false,
  )


  final int validity;



      /// Human-readable message describing the session status
  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: true,
  )


  final String? message;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionSession &&
      other.valid == valid &&
      other.totp == totp &&
      other.sid == sid &&
      other.csrf == csrf &&
      other.validity == validity &&
      other.message == message;

    @override
    int get hashCode =>
        valid.hashCode +
        totp.hashCode +
        (sid == null ? 0 : sid.hashCode) +
        (csrf == null ? 0 : csrf.hashCode) +
        validity.hashCode +
        (message == null ? 0 : message.hashCode);

  factory SessionSession.fromJson(Map<String, dynamic> json) => _$SessionSessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionSessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

