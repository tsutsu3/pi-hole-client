//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Interfaces {
  /// Returns a new [Interfaces] instance.
  Interfaces({

     this.interfaces,
  });

      /// Interface information
  @JsonKey(
    
    name: r'interfaces',
    required: false,
    includeIfNull: false,
  )


  final List<InterfacesInterfacesInner>? interfaces;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Interfaces &&
      other.interfaces == interfaces;

    @override
    int get hashCode =>
        interfaces.hashCode;

  factory Interfaces.fromJson(Map<String, dynamic> json) => _$InterfacesFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

