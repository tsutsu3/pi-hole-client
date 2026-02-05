//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_maybe_array.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddressMaybeArray {
  /// Returns a new [AddressMaybeArray] instance.
  AddressMaybeArray({

     this.address,
  });

  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? address;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddressMaybeArray &&
      other.address == address;

    @override
    int get hashCode =>
        address.hashCode;

  factory AddressMaybeArray.fromJson(Map<String, dynamic> json) => _$AddressMaybeArrayFromJson(json);

  Map<String, dynamic> toJson() => _$AddressMaybeArrayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

