//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_type.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasType {
  /// Returns a new [SchemasType] instance.
  SchemasType({

     this.type,
  });

      /// Type of list
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final SchemasTypeTypeEnum? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasType &&
      other.type == type;

    @override
    int get hashCode =>
        type.hashCode;

  factory SchemasType.fromJson(Map<String, dynamic> json) => _$SchemasTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasTypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of list
enum SchemasTypeTypeEnum {
    /// Type of list
@JsonValue(r'allow')
allow(r'allow'),
    /// Type of list
@JsonValue(r'block')
block(r'block');

const SchemasTypeTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


