//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_object.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddressObject {
  /// Returns a new [AddressObject] instance.
  AddressObject({

     this.address,
  });

      /// Address of the list
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddressObject &&
      other.address == address;

    @override
    int get hashCode =>
        address.hashCode;

  factory AddressObject.fromJson(Map<String, dynamic> json) => _$AddressObjectFromJson(json);

  Map<String, dynamic> toJson() => _$AddressObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

