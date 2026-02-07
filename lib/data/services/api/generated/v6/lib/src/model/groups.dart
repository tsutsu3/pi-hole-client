//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'groups.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Groups {
  /// Returns a new [Groups] instance.
  Groups({

     this.groups,
  });

      /// Array of group IDs
  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Groups &&
      other.groups == groups;

    @override
    int get hashCode =>
        groups.hashCode;

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

