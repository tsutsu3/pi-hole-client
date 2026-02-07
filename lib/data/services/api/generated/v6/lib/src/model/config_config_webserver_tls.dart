//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_tls.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverTls {
  /// Returns a new [ConfigConfigWebserverTls] instance.
  ConfigConfigWebserverTls({

     this.cert,

     this.validity,
  });

  @JsonKey(
    
    name: r'cert',
    required: false,
    includeIfNull: false,
  )


  final String? cert;



  @JsonKey(
    
    name: r'validity',
    required: false,
    includeIfNull: false,
  )


  final int? validity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverTls &&
      other.cert == cert &&
      other.validity == validity;

    @override
    int get hashCode =>
        cert.hashCode +
        validity.hashCode;

  factory ConfigConfigWebserverTls.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverTlsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverTlsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

