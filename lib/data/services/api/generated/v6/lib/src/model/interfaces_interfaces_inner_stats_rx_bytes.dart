//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces_interfaces_inner_stats_rx_bytes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InterfacesInterfacesInnerStatsRxBytes {
  /// Returns a new [InterfacesInterfacesInnerStatsRxBytes] instance.
  InterfacesInterfacesInnerStatsRxBytes({

     this.value,

     this.unit,
  });

      /// Number of received bytes
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final num? value;



      /// Unit of the received bytes
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InterfacesInterfacesInnerStatsRxBytes &&
      other.value == value &&
      other.unit == unit;

    @override
    int get hashCode =>
        value.hashCode +
        unit.hashCode;

  factory InterfacesInterfacesInnerStatsRxBytes.fromJson(Map<String, dynamic> json) => _$InterfacesInterfacesInnerStatsRxBytesFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesInterfacesInnerStatsRxBytesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

