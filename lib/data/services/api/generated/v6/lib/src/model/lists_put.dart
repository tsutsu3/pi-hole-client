//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_put.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsPut {
  /// Returns a new [ListsPut] instance.
  ListsPut({

     this.comment,

     this.type,

     this.groups = const [0],

     this.enabled = true,
  });

      /// User-provided free-text comment for this list
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Type of list
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final ListsPutTypeEnum? type;



      /// Array of group IDs
  @JsonKey(
    defaultValue: [0],
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;



      /// Status of domain
  @JsonKey(
    defaultValue: true,
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsPut &&
      other.comment == comment &&
      other.type == type &&
      other.groups == groups &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        (comment == null ? 0 : comment.hashCode) +
        type.hashCode +
        groups.hashCode +
        enabled.hashCode;

  factory ListsPut.fromJson(Map<String, dynamic> json) => _$ListsPutFromJson(json);

  Map<String, dynamic> toJson() => _$ListsPutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of list
enum ListsPutTypeEnum {
    /// Type of list
@JsonValue(r'allow')
allow(r'allow'),
    /// Type of list
@JsonValue(r'block')
block(r'block');

const ListsPutTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


