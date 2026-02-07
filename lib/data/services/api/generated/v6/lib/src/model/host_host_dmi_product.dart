//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_dmi_product.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostDmiProduct {
  /// Returns a new [HostHostDmiProduct] instance.
  HostHostDmiProduct({

     this.name,

     this.version,

     this.family,
  });

      /// Product name (if available, `null` otherwise)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Product version (if available, `null` otherwise)
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;



      /// Product family (if available, `null` otherwise)
  @JsonKey(
    
    name: r'family',
    required: false,
    includeIfNull: false,
  )


  final String? family;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostDmiProduct &&
      other.name == name &&
      other.version == version &&
      other.family == family;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (version == null ? 0 : version.hashCode) +
        (family == null ? 0 : family.hashCode);

  factory HostHostDmiProduct.fromJson(Map<String, dynamic> json) => _$HostHostDmiProductFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostDmiProductToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

