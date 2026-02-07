//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components_schemas_enabled.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComponentsSchemasEnabled {
  /// Returns a new [ComponentsSchemasEnabled] instance.
  ComponentsSchemasEnabled({

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
    bool operator ==(Object other) => identical(this, other) || other is ComponentsSchemasEnabled &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        enabled.hashCode;

  factory ComponentsSchemasEnabled.fromJson(Map<String, dynamic> json) => _$ComponentsSchemasEnabledFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsSchemasEnabledToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

