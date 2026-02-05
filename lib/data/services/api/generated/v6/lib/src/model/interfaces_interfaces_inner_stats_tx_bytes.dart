//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces_interfaces_inner_stats_tx_bytes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InterfacesInterfacesInnerStatsTxBytes {
  /// Returns a new [InterfacesInterfacesInnerStatsTxBytes] instance.
  InterfacesInterfacesInnerStatsTxBytes({

     this.value,

     this.unit,
  });

      /// Number of transmitted bytes
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final num? value;



      /// Unit of the transmitted bytes
  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InterfacesInterfacesInnerStatsTxBytes &&
      other.value == value &&
      other.unit == unit;

    @override
    int get hashCode =>
        value.hashCode +
        unit.hashCode;

  factory InterfacesInterfacesInnerStatsTxBytes.fromJson(Map<String, dynamic> json) => _$InterfacesInterfacesInnerStatsTxBytesFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesInterfacesInnerStatsTxBytesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

