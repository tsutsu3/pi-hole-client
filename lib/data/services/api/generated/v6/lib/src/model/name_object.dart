//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'name_object.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NameObject {
  /// Returns a new [NameObject] instance.
  NameObject({

     this.name,
  });

      /// Group name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NameObject &&
      other.name == name;

    @override
    int get hashCode =>
        name.hashCode;

  factory NameObject.fromJson(Map<String, dynamic> json) => _$NameObjectFromJson(json);

  Map<String, dynamic> toJson() => _$NameObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

