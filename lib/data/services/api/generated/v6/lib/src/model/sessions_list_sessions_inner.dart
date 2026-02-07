//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/sessions_list_sessions_inner_tls.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sessions_list_sessions_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionsListSessionsInner {
  /// Returns a new [SessionsListSessionsInner] instance.
  SessionsListSessionsInner({

     this.id,

     this.currentSession,

     this.valid,

     this.tls,

     this.app,

     this.cli,

     this.loginAt,

     this.lastActive,

     this.validUntil,

     this.remoteAddr,

     this.userAgent,

     this.xForwardedFor,
  });

      /// Session ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final num? id;



      /// Indicator if this is the current session
  @JsonKey(
    
    name: r'current_session',
    required: false,
    includeIfNull: false,
  )


  final bool? currentSession;



      /// Valid session indicator (existing sessions may be invalid due to timeout)
  @JsonKey(
    
    name: r'valid',
    required: false,
    includeIfNull: false,
  )


  final bool? valid;



  @JsonKey(
    
    name: r'tls',
    required: false,
    includeIfNull: false,
  )


  final SessionsListSessionsInnerTls? tls;



      /// Indicator if this session was initiated using an application password
  @JsonKey(
    
    name: r'app',
    required: false,
    includeIfNull: false,
  )


  final bool? app;



      /// Indicator if this session was initiated using the command-line interface (CLI)
  @JsonKey(
    
    name: r'cli',
    required: false,
    includeIfNull: false,
  )


  final bool? cli;



      /// Timestamp of login (seconds since epoch)
  @JsonKey(
    
    name: r'login_at',
    required: false,
    includeIfNull: false,
  )


  final int? loginAt;



      /// Timestamp of last activity (seconds since epoch)
  @JsonKey(
    
    name: r'last_active',
    required: false,
    includeIfNull: false,
  )


  final int? lastActive;



      /// Timestamp of session expiration (seconds since epoch)
  @JsonKey(
    
    name: r'valid_until',
    required: false,
    includeIfNull: false,
  )


  final int? validUntil;



      /// IP address of the client
  @JsonKey(
    
    name: r'remote_addr',
    required: false,
    includeIfNull: false,
  )


  final String? remoteAddr;



      /// User agent of the client (optional)
  @JsonKey(
    
    name: r'user_agent',
    required: false,
    includeIfNull: false,
  )


  final String? userAgent;



      /// IP address of the client (if behind a proxy, optional)
  @JsonKey(
    
    name: r'x_forwarded_for',
    required: false,
    includeIfNull: false,
  )


  final String? xForwardedFor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionsListSessionsInner &&
      other.id == id &&
      other.currentSession == currentSession &&
      other.valid == valid &&
      other.tls == tls &&
      other.app == app &&
      other.cli == cli &&
      other.loginAt == loginAt &&
      other.lastActive == lastActive &&
      other.validUntil == validUntil &&
      other.remoteAddr == remoteAddr &&
      other.userAgent == userAgent &&
      other.xForwardedFor == xForwardedFor;

    @override
    int get hashCode =>
        id.hashCode +
        currentSession.hashCode +
        valid.hashCode +
        tls.hashCode +
        app.hashCode +
        cli.hashCode +
        loginAt.hashCode +
        lastActive.hashCode +
        validUntil.hashCode +
        remoteAddr.hashCode +
        (userAgent == null ? 0 : userAgent.hashCode) +
        (xForwardedFor == null ? 0 : xForwardedFor.hashCode);

  factory SessionsListSessionsInner.fromJson(Map<String, dynamic> json) => _$SessionsListSessionsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsListSessionsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

