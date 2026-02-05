//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/config_config_database_network.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_database.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDatabase {
  /// Returns a new [ConfigConfigDatabase] instance.
  ConfigConfigDatabase({

     this.dBimport,

     this.maxDBdays,

     this.dBinterval,

     this.useWAL,

     this.network,
  });

  @JsonKey(
    
    name: r'DBimport',
    required: false,
    includeIfNull: false,
  )


  final bool? dBimport;



  @JsonKey(
    
    name: r'maxDBdays',
    required: false,
    includeIfNull: false,
  )


  final int? maxDBdays;



  @JsonKey(
    
    name: r'DBinterval',
    required: false,
    includeIfNull: false,
  )


  final int? dBinterval;



  @JsonKey(
    
    name: r'useWAL',
    required: false,
    includeIfNull: false,
  )


  final bool? useWAL;



  @JsonKey(
    
    name: r'network',
    required: false,
    includeIfNull: false,
  )


  final ConfigConfigDatabaseNetwork? network;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDatabase &&
      other.dBimport == dBimport &&
      other.maxDBdays == maxDBdays &&
      other.dBinterval == dBinterval &&
      other.useWAL == useWAL &&
      other.network == network;

    @override
    int get hashCode =>
        dBimport.hashCode +
        maxDBdays.hashCode +
        dBinterval.hashCode +
        useWAL.hashCode +
        network.hashCode;

  factory ConfigConfigDatabase.fromJson(Map<String, dynamic> json) => _$ConfigConfigDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDatabaseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

