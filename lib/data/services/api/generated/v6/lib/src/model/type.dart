//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Type {
  /// Returns a new [Type] instance.
  Type({

     this.type,
  });

      /// String specifying domain type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final TypeTypeEnum? type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Type &&
      other.type == type;

    @override
    int get hashCode =>
        type.hashCode;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying domain type
enum TypeTypeEnum {
    /// String specifying domain type
@JsonValue(r'allow')
allow(r'allow'),
    /// String specifying domain type
@JsonValue(r'deny')
deny(r'deny');

const TypeTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


