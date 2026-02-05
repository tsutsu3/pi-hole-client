//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'groups_put.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GroupsPut {
  /// Returns a new [GroupsPut] instance.
  GroupsPut({

     this.name,

     this.comment,

     this.enabled = true,
  });

      /// Group name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// User-provided free-text comment for this group
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Status of item
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GroupsPut &&
      other.name == name &&
      other.comment == comment &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        name.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        enabled.hashCode;

  factory GroupsPut.fromJson(Map<String, dynamic> json) => _$GroupsPutFromJson(json);

  Map<String, dynamic> toJson() => _$GroupsPutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

