//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/system_system_cpu.dart';
import 'package:pihole_v6_api/src/model/system_system_memory.dart';
import 'package:pihole_v6_api/src/model/system_system_ftl.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystem {
  /// Returns a new [SystemSystem] instance.
  SystemSystem({

     this.uptime,

     this.memory,

     this.procs,

     this.cpu,

     this.ftl,
  });

      /// How long the system has been running (seconds)
  @JsonKey(
    
    name: r'uptime',
    required: false,
    includeIfNull: false,
  )


  final int? uptime;



  @JsonKey(
    
    name: r'memory',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemMemory? memory;



      /// Number of current processes
  @JsonKey(
    
    name: r'procs',
    required: false,
    includeIfNull: false,
  )


  final int? procs;



  @JsonKey(
    
    name: r'cpu',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemCpu? cpu;



  @JsonKey(
    
    name: r'ftl',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemFtl? ftl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystem &&
      other.uptime == uptime &&
      other.memory == memory &&
      other.procs == procs &&
      other.cpu == cpu &&
      other.ftl == ftl;

    @override
    int get hashCode =>
        uptime.hashCode +
        memory.hashCode +
        procs.hashCode +
        cpu.hashCode +
        ftl.hashCode;

  factory SystemSystem.fromJson(Map<String, dynamic> json) => _$SystemSystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

