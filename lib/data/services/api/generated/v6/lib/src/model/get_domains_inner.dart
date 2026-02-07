//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_domains_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDomainsInner {
  /// Returns a new [GetDomainsInner] instance.
  GetDomainsInner({

     this.domain,

     this.unicode,

     this.type,

     this.kind,

     this.comment,

     this.groups,

     this.enabled = true,

     this.id,

     this.dateAdded,

     this.dateModified,
  });

      /// Domain
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Unicode domain (may be different from `domain` if punycode-encoding is used)
  @JsonKey(
    
    name: r'unicode',
    required: false,
    includeIfNull: false,
  )


  final String? unicode;



      /// String specifying domain type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final GetDomainsInnerTypeEnum? type;



      /// String specifying domain kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final GetDomainsInnerKindEnum? kind;



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



      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of domain addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last domain modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDomainsInner &&
      other.domain == domain &&
      other.unicode == unicode &&
      other.type == type &&
      other.kind == kind &&
      other.comment == comment &&
      other.groups == groups &&
      other.enabled == enabled &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified;

    @override
    int get hashCode =>
        domain.hashCode +
        unicode.hashCode +
        type.hashCode +
        kind.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        enabled.hashCode +
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode;

  factory GetDomainsInner.fromJson(Map<String, dynamic> json) => _$GetDomainsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$GetDomainsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying domain type
enum GetDomainsInnerTypeEnum {
    /// String specifying domain type
@JsonValue(r'allow')
allow(r'allow'),
    /// String specifying domain type
@JsonValue(r'deny')
deny(r'deny');

const GetDomainsInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// String specifying domain kind
enum GetDomainsInnerKindEnum {
    /// String specifying domain kind
@JsonValue(r'exact')
exact(r'exact'),
    /// String specifying domain kind
@JsonValue(r'regex')
regex(r'regex');

const GetDomainsInnerKindEnum(this.value);

final String value;

@override
String toString() => value;
}


