//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enabled.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Enabled {
  /// Returns a new [Enabled] instance.
  Enabled({

     this.enabled = true,
  });

      /// Status of domain
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Enabled &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        enabled.hashCode;

  factory Enabled.fromJson(Map<String, dynamic> json) => _$EnabledFromJson(json);

  Map<String, dynamic> toJson() => _$EnabledToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

