//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_gravity_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchGravityInner {
  /// Returns a new [SearchSearchGravityInner] instance.
  SearchSearchGravityInner({

     this.domain,

     this.address,

     this.comment,

     this.enabled,

     this.id,

     this.type,

     this.dateAdded,

     this.dateModified,

     this.dateUpdated,

     this.number,

     this.invalidDomains,

     this.abpEntries,

     this.status,

     this.groups,
  });

  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Address of the list this domain was found on
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



      /// Optional comment of the list
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Whether this list is enabled
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final bool? enabled;



      /// Database ID of the associated list
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// String specifying list type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchGravityInnerTypeEnum? type;



      /// Unix timestamp of list addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last list modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;



      /// Unix timestamp of last local update of this list
  @JsonKey(
    
    name: r'date_updated',
    required: false,
    includeIfNull: false,
  )


  final int? dateUpdated;



      /// Number of entries in the list
  @JsonKey(
    
    name: r'number',
    required: false,
    includeIfNull: false,
  )


  final int? number;



      /// Number of invalid domains in the list
  @JsonKey(
    
    name: r'invalid_domains',
    required: false,
    includeIfNull: false,
  )


  final int? invalidDomains;



      /// Number of ABP entries in the list
  @JsonKey(
    
    name: r'abp_entries',
    required: false,
    includeIfNull: false,
  )


  final int? abpEntries;



      /// Status of the list
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final int? status;



      /// Array of IDs corresponding to associated groups
  @JsonKey(
    
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchGravityInner &&
      other.domain == domain &&
      other.address == address &&
      other.comment == comment &&
      other.enabled == enabled &&
      other.id == id &&
      other.type == type &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified &&
      other.dateUpdated == dateUpdated &&
      other.number == number &&
      other.invalidDomains == invalidDomains &&
      other.abpEntries == abpEntries &&
      other.status == status &&
      other.groups == groups;

    @override
    int get hashCode =>
        domain.hashCode +
        address.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        enabled.hashCode +
        id.hashCode +
        type.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        dateUpdated.hashCode +
        number.hashCode +
        invalidDomains.hashCode +
        abpEntries.hashCode +
        status.hashCode +
        groups.hashCode;

  factory SearchSearchGravityInner.fromJson(Map<String, dynamic> json) => _$SearchSearchGravityInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchGravityInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying list type
enum SearchSearchGravityInnerTypeEnum {
    /// String specifying list type
@JsonValue(r'allow')
allow(r'allow'),
    /// String specifying list type
@JsonValue(r'block')
block(r'block');

const SearchSearchGravityInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


