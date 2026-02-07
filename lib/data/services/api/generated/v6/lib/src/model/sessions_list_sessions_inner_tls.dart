//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sessions_list_sessions_inner_tls.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SessionsListSessionsInnerTls {
  /// Returns a new [SessionsListSessionsInnerTls] instance.
  SessionsListSessionsInnerTls({

     this.login,

     this.mixed,
  });

      /// Indicator if TLS (end-to-end encryption) has been used during login for this session
  @JsonKey(
    
    name: r'login',
    required: false,
    includeIfNull: false,
  )


  final bool? login;



      /// Indicator if TLS (end-to-end encryption) is used only partially for this session
  @JsonKey(
    
    name: r'mixed',
    required: false,
    includeIfNull: false,
  )


  final bool? mixed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SessionsListSessionsInnerTls &&
      other.login == login &&
      other.mixed == mixed;

    @override
    int get hashCode =>
        login.hashCode +
        mixed.hashCode;

  factory SessionsListSessionsInnerTls.fromJson(Map<String, dynamic> json) => _$SessionsListSessionsInnerTlsFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsListSessionsInnerTlsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

