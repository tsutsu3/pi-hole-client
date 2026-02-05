//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/system_system_memory_swap.dart';
import 'package:pihole_v6_api/src/model/system_system_memory_ram.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_memory.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemMemory {
  /// Returns a new [SystemSystemMemory] instance.
  SystemSystemMemory({

     this.ram,

     this.swap,
  });

  @JsonKey(
    
    name: r'ram',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemMemoryRam? ram;



  @JsonKey(
    
    name: r'swap',
    required: false,
    includeIfNull: false,
  )


  final SystemSystemMemorySwap? swap;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemMemory &&
      other.ram == ram &&
      other.swap == swap;

    @override
    int get hashCode =>
        ram.hashCode +
        swap.hashCode;

  factory SystemSystemMemory.fromJson(Map<String, dynamic> json) => _$SystemSystemMemoryFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemMemoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

