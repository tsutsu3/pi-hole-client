//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/system_system_cpu_load.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_cpu.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemCpu {
  /// Returns a new [SystemSystemCpu] instance.
  SystemSystemCpu({

     this.nprocs,

     this.percentCpu,

     this.load,
  });

      /// Number of available processors
  @JsonKey(
    
    name: r'nprocs',
    required: false,
    includeIfNull: false,
  )


  final int? nprocs;



      /// Total CPU usage in percent (may be higher than 100% on multi-core systems and negative if the value cannot be computed)
  @JsonKey(
    
    name: r'%cpu',
    required: false,
    includeIfNull: false,
  )


  final num? percentCpu;



  @JsonKey(
    
    name: r'load',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemCpuLoad? load;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemCpu &&
      other.nprocs == nprocs &&
      other.percentCpu == percentCpu &&
      other.load == load;

    @override
    int get hashCode =>
        nprocs.hashCode +
        percentCpu.hashCode +
        load.hashCode;

  factory SystemSystemCpu.fromJson(Map<String, dynamic> json) => _$SystemSystemCpuFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemCpuToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

