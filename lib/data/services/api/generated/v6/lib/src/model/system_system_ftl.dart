//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_ftl.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemFtl {
  /// Returns a new [SystemSystemFtl] instance.
  SystemSystemFtl({

     this.percentMem,

     this.percentCpu,
  });

      /// Percentage of total RAM memory used by FTL
  @JsonKey(
    
    name: r'%mem',
    required: false,
    includeIfNull: false,
  )


  final num? percentMem;



      /// Percentage of total CPU used by FTL
  @JsonKey(
    
    name: r'%cpu',
    required: false,
    includeIfNull: false,
  )


  final num? percentCpu;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemFtl &&
      other.percentMem == percentMem &&
      other.percentCpu == percentCpu;

    @override
    int get hashCode =>
        percentMem.hashCode +
        percentCpu.hashCode;

  factory SystemSystemFtl.fromJson(Map<String, dynamic> json) => _$SystemSystemFtlFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemFtlToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

