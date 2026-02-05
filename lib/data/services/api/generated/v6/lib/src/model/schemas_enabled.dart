//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_enabled.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasEnabled {
  /// Returns a new [SchemasEnabled] instance.
  SchemasEnabled({

     this.enabled = true,
  });

      /// Status of item
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasEnabled &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        enabled.hashCode;

  factory SchemasEnabled.fromJson(Map<String, dynamic> json) => _$SchemasEnabledFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasEnabledToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

