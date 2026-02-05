//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'name_maybe_array.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NameMaybeArray {
  /// Returns a new [NameMaybeArray] instance.
  NameMaybeArray({

     this.name,
  });

  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NameMaybeArray &&
      other.name == name;

    @override
    int get hashCode =>
        name.hashCode;

  factory NameMaybeArray.fromJson(Map<String, dynamic> json) => _$NameMaybeArrayFromJson(json);

  Map<String, dynamic> toJson() => _$NameMaybeArrayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

