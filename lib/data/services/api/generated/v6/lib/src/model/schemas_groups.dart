//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_groups.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasGroups {
  /// Returns a new [SchemasGroups] instance.
  SchemasGroups({

     this.groups = const [0],
  });

      /// Array of group IDs
  @JsonKey(
    defaultValue: [0],
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasGroups &&
      other.groups == groups;

    @override
    int get hashCode =>
        groups.hashCode;

  factory SchemasGroups.fromJson(Map<String, dynamic> json) => _$SchemasGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasGroupsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

