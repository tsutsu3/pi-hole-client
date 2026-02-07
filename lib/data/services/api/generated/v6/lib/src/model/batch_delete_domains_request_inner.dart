//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_delete_domains_request_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BatchDeleteDomainsRequestInner {
  /// Returns a new [BatchDeleteDomainsRequestInner] instance.
  BatchDeleteDomainsRequestInner({

    required  this.item,

    required  this.type,

    required  this.kind,
  });

      /// Domain to delete
  @JsonKey(
    
    name: r'item',
    required: true,
    includeIfNull: false,
  )


  final String item;



      /// Type of domain to delete
  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final BatchDeleteDomainsRequestInnerTypeEnum type;



      /// Kind of domain to delete
  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final BatchDeleteDomainsRequestInnerKindEnum kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BatchDeleteDomainsRequestInner &&
      other.item == item &&
      other.type == type &&
      other.kind == kind;

    @override
    int get hashCode =>
        item.hashCode +
        type.hashCode +
        kind.hashCode;

  factory BatchDeleteDomainsRequestInner.fromJson(Map<String, dynamic> json) => _$BatchDeleteDomainsRequestInnerFromJson(json);

  Map<String, dynamic> toJson() => _$BatchDeleteDomainsRequestInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of domain to delete
enum BatchDeleteDomainsRequestInnerTypeEnum {
    /// Type of domain to delete
@JsonValue(r'allow')
allow(r'allow'),
    /// Type of domain to delete
@JsonValue(r'deny')
deny(r'deny');

const BatchDeleteDomainsRequestInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// Kind of domain to delete
enum BatchDeleteDomainsRequestInnerKindEnum {
    /// Kind of domain to delete
@JsonValue(r'exact')
exact(r'exact'),
    /// Kind of domain to delete
@JsonValue(r'regex')
regex(r'regex');

const BatchDeleteDomainsRequestInnerKindEnum(this.value);

final String value;

@override
String toString() => value;
}


