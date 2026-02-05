//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_memory_ram.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemMemoryRam {
  /// Returns a new [SystemSystemMemoryRam] instance.
  SystemSystemMemoryRam({

     this.total,

     this.free,

     this.used,

     this.available,

     this.percentUsed,
  });

      /// Total RAM
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Total free RAM
  @JsonKey(
    
    name: r'free',
    required: false,
    includeIfNull: false,
  )


  final int? free;



      /// Used RAM
  @JsonKey(
    
    name: r'used',
    required: false,
    includeIfNull: false,
  )


  final int? used;



      /// Total available RAM
  @JsonKey(
    
    name: r'available',
    required: false,
    includeIfNull: false,
  )


  final int? available;



      /// Used RAM in percent
  @JsonKey(
    
    name: r'%used',
    required: false,
    includeIfNull: false,
  )


  final num? percentUsed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemMemoryRam &&
      other.total == total &&
      other.free == free &&
      other.used == used &&
      other.available == available &&
      other.percentUsed == percentUsed;

    @override
    int get hashCode =>
        total.hashCode +
        free.hashCode +
        used.hashCode +
        available.hashCode +
        percentUsed.hashCode;

  factory SystemSystemMemoryRam.fromJson(Map<String, dynamic> json) => _$SystemSystemMemoryRamFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemMemoryRamToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

