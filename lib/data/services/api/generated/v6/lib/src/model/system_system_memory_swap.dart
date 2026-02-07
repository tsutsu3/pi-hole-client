//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system_system_memory_swap.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SystemSystemMemorySwap {
  /// Returns a new [SystemSystemMemorySwap] instance.
  SystemSystemMemorySwap({

     this.total,

     this.used,

     this.free,

     this.percentUsed,
  });

      /// Total swap
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Used swap
  @JsonKey(
    
    name: r'used',
    required: false,
    includeIfNull: false,
  )


  final int? used;



      /// Total free swap memory
  @JsonKey(
    
    name: r'free',
    required: false,
    includeIfNull: false,
  )


  final int? free;



      /// Used swap in percent
  @JsonKey(
    
    name: r'%used',
    required: false,
    includeIfNull: false,
  )


  final num? percentUsed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SystemSystemMemorySwap &&
      other.total == total &&
      other.used == used &&
      other.free == free &&
      other.percentUsed == percentUsed;

    @override
    int get hashCode =>
        total.hashCode +
        used.hashCode +
        free.hashCode +
        percentUsed.hashCode;

  factory SystemSystemMemorySwap.fromJson(Map<String, dynamic> json) => _$SystemSystemMemorySwapFromJson(json);

  Map<String, dynamic> toJson() => _$SystemSystemMemorySwapToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

