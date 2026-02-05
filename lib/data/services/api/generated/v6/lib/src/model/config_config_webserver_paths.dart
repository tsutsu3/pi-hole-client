//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_paths.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverPaths {
  /// Returns a new [ConfigConfigWebserverPaths] instance.
  ConfigConfigWebserverPaths({

     this.webroot,

     this.webhome,

     this.prefix,
  });

  @JsonKey(
    
    name: r'webroot',
    required: false,
    includeIfNull: false,
  )


  final String? webroot;



  @JsonKey(
    
    name: r'webhome',
    required: false,
    includeIfNull: false,
  )


  final String? webhome;



  @JsonKey(
    
    name: r'prefix',
    required: false,
    includeIfNull: false,
  )


  final String? prefix;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverPaths &&
      other.webroot == webroot &&
      other.webhome == webhome &&
      other.prefix == prefix;

    @override
    int get hashCode =>
        webroot.hashCode +
        webhome.hashCode +
        prefix.hashCode;

  factory ConfigConfigWebserverPaths.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverPathsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverPathsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

