//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_misc_check.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigMiscCheck {
  /// Returns a new [ConfigConfigMiscCheck] instance.
  ConfigConfigMiscCheck({

     this.load,

     this.shmem,

     this.disk,
  });

  @JsonKey(
    
    name: r'load',
    required: false,
    includeIfNull: false,
  )


  final bool? load;



  @JsonKey(
    
    name: r'shmem',
    required: false,
    includeIfNull: false,
  )


  final int? shmem;



  @JsonKey(
    
    name: r'disk',
    required: false,
    includeIfNull: false,
  )


  final int? disk;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigMiscCheck &&
      other.load == load &&
      other.shmem == shmem &&
      other.disk == disk;

    @override
    int get hashCode =>
        load.hashCode +
        shmem.hashCode +
        disk.hashCode;

  factory ConfigConfigMiscCheck.fromJson(Map<String, dynamic> json) => _$ConfigConfigMiscCheckFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigMiscCheckToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

