//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_iface_v4_rx_bytes.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddIfaceV4RxBytes {
  /// Returns a new [PaddIfaceV4RxBytes] instance.
  PaddIfaceV4RxBytes({

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
    bool operator ==(Object other) => identical(this, other) || other is PaddIfaceV4RxBytes &&
      other.value == value &&
      other.unit == unit;

    @override
    int get hashCode =>
        value.hashCode +
        unit.hashCode;

  factory PaddIfaceV4RxBytes.fromJson(Map<String, dynamic> json) => _$PaddIfaceV4RxBytesFromJson(json);

  Map<String, dynamic> toJson() => _$PaddIfaceV4RxBytesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

