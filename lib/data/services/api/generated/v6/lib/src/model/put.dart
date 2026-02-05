//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'put.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Put {
  /// Returns a new [Put] instance.
  Put({

     this.type,

     this.kind,

     this.comment,

     this.groups,

     this.enabled = true,
  });

      /// String specifying domain type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final PutTypeEnum? type;



      /// String specifying domain kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final PutKindEnum? kind;



      /// User-provided free-text comment for this domain
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Array of group IDs
  @JsonKey(
    
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
    bool operator ==(Object other) => identical(this, other) || other is Put &&
      other.type == type &&
      other.kind == kind &&
      other.comment == comment &&
      other.groups == groups &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        type.hashCode +
        kind.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        enabled.hashCode;

  factory Put.fromJson(Map<String, dynamic> json) => _$PutFromJson(json);

  Map<String, dynamic> toJson() => _$PutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying domain type
enum PutTypeEnum {
    /// String specifying domain type
@JsonValue(r'allow')
allow(r'allow'),
    /// String specifying domain type
@JsonValue(r'deny')
deny(r'deny');

const PutTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// String specifying domain kind
enum PutKindEnum {
    /// String specifying domain kind
@JsonValue(r'exact')
exact(r'exact'),
    /// String specifying domain kind
@JsonValue(r'regex')
regex(r'regex');

const PutKindEnum(this.value);

final String value;

@override
String toString() => value;
}


