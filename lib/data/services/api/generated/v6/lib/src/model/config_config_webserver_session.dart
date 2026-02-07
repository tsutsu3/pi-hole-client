//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverSession {
  /// Returns a new [ConfigConfigWebserverSession] instance.
  ConfigConfigWebserverSession({

     this.timeout,

     this.restore,
  });

  @JsonKey(
    
    name: r'timeout',
    required: false,
    includeIfNull: false,
  )


  final int? timeout;



  @JsonKey(
    
    name: r'restore',
    required: false,
    includeIfNull: false,
  )


  final bool? restore;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverSession &&
      other.timeout == timeout &&
      other.restore == restore;

    @override
    int get hashCode =>
        timeout.hashCode +
        restore.hashCode;

  factory ConfigConfigWebserverSession.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverSessionFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverSessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

