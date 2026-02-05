//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_database_network.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDatabaseNetwork {
  /// Returns a new [ConfigConfigDatabaseNetwork] instance.
  ConfigConfigDatabaseNetwork({

     this.parseARPcache,

     this.expire,
  });

  @JsonKey(
    
    name: r'parseARPcache',
    required: false,
    includeIfNull: false,
  )


  final bool? parseARPcache;



  @JsonKey(
    
    name: r'expire',
    required: false,
    includeIfNull: false,
  )


  final int? expire;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDatabaseNetwork &&
      other.parseARPcache == parseARPcache &&
      other.expire == expire;

    @override
    int get hashCode =>
        parseARPcache.hashCode +
        expire.hashCode;

  factory ConfigConfigDatabaseNetwork.fromJson(Map<String, dynamic> json) => _$ConfigConfigDatabaseNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDatabaseNetworkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

