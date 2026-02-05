//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_domains_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchDomainsInner {
  /// Returns a new [SearchSearchDomainsInner] instance.
  SearchSearchDomainsInner({

     this.domain,

     this.comment,

     this.enabled,

     this.type,

     this.kind,

     this.id,

     this.dateAdded,

     this.dateModified,

     this.groups,
  });

  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Optional comment
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Whether this entry is enabled
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;



      /// String specifying domain type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchDomainsInnerTypeEnum? type;



      /// String specifying domain kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchDomainsInnerKindEnum? kind;



      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;



      /// Array of IDs corresponding to associated groups
  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchDomainsInner &&
      other.domain == domain &&
      other.comment == comment &&
      other.enabled == enabled &&
      other.type == type &&
      other.kind == kind &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified &&
      other.groups == groups;

    @override
    int get hashCode =>
        domain.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        enabled.hashCode +
        type.hashCode +
        kind.hashCode +
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        groups.hashCode;

  factory SearchSearchDomainsInner.fromJson(Map<String, dynamic> json) => _$SearchSearchDomainsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchDomainsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying domain type
enum SearchSearchDomainsInnerTypeEnum {
    /// String specifying domain type
@JsonValue(r'allow')
allow(r'allow'),
    /// String specifying domain type
@JsonValue(r'deny')
deny(r'deny');

const SearchSearchDomainsInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


/// String specifying domain kind
enum SearchSearchDomainsInnerKindEnum {
    /// String specifying domain kind
@JsonValue(r'exact')
exact(r'exact'),
    /// String specifying domain kind
@JsonValue(r'regex')
regex(r'regex');

const SearchSearchDomainsInnerKindEnum(this.value);

final String value;

@override
String toString() => value;
}


