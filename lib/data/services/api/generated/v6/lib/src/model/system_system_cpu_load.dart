//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_cpu_load.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemCpuLoad {
  /// Returns a new [SystemSystemCpuLoad] instance.
  SystemSystemCpuLoad({

     this.raw,

     this.percent,
  });

      /// raw values
  @JsonKey(
    
    name: r'raw',
    required: false,
    includeIfNull: false,
  )


  final List<num>? raw;



      /// raw values
  @JsonKey(
    
    name: r'percent',
    required: false,
    includeIfNull: false,
  )


  final List<num>? percent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemCpuLoad &&
      other.raw == raw &&
      other.percent == percent;

    @override
    int get hashCode =>
        raw.hashCode +
        percent.hashCode;

  factory SystemSystemCpuLoad.fromJson(Map<String, dynamic> json) => _$SystemSystemCpuLoadFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemCpuLoadToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

