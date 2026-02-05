//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_iface_v4_tx_bytes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddIfaceV4TxBytes {
  /// Returns a new [PaddIfaceV4TxBytes] instance.
  PaddIfaceV4TxBytes({

     this.value,

     this.unit,
  });

  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final num? value;



  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final String? unit;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddIfaceV4TxBytes &&
      other.value == value &&
      other.unit == unit;

    @override
    int get hashCode =>
        value.hashCode +
        unit.hashCode;

  factory PaddIfaceV4TxBytes.fromJson(Map<String, dynamic> json) => _$PaddIfaceV4TxBytesFromJson(json);

  Map<String, dynamic> toJson() => _$PaddIfaceV4TxBytesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

