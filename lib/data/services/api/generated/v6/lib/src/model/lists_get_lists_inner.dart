//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_get_lists_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsGetListsInner {
  /// Returns a new [ListsGetListsInner] instance.
  ListsGetListsInner({

     this.address,

     this.type,

     this.comment,

     this.groups = const [0],

     this.enabled = true,

     this.id,

     this.dateAdded,

     this.dateModified,

     this.dateUpdated,

     this.number,

     this.invalidDomains,

     this.abpEntries,

     this.status,
  });

      /// Address of the list
  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



      /// Type of list
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final ListsGetListsInnerTypeEnum? type;



      /// User-provided free-text comment for this list
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



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



      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of item addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last item modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;



      /// Unix timestamp of last update of list content
  @JsonKey(
    
    name: r'date_updated',
    required: false,
    includeIfNull: false,
  )


  final int? dateUpdated;



      /// Number of VALID domains on this list
  @JsonKey(
    
    name: r'number',
    required: false,
    includeIfNull: false,
  )


  final int? number;



      /// Number of INVALID domains on this list
  @JsonKey(
    
    name: r'invalid_domains',
    required: false,
    includeIfNull: false,
  )


  final int? invalidDomains;



      /// Number of ABP entries on this list
  @JsonKey(
    
    name: r'abp_entries',
    required: false,
    includeIfNull: false,
  )


  final int? abpEntries;



      /// List status
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final int? status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsGetListsInner &&
      other.address == address &&
      other.type == type &&
      other.comment == comment &&
      other.groups == groups &&
      other.enabled == enabled &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified &&
      other.dateUpdated == dateUpdated &&
      other.number == number &&
      other.invalidDomains == invalidDomains &&
      other.abpEntries == abpEntries &&
      other.status == status;

    @override
    int get hashCode =>
        address.hashCode +
        type.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        enabled.hashCode +
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        dateUpdated.hashCode +
        number.hashCode +
        invalidDomains.hashCode +
        abpEntries.hashCode +
        status.hashCode;

  factory ListsGetListsInner.fromJson(Map<String, dynamic> json) => _$ListsGetListsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ListsGetListsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Type of list
enum ListsGetListsInnerTypeEnum {
    /// Type of list
@JsonValue(r'allow')
allow(r'allow'),
    /// Type of list
@JsonValue(r'block')
block(r'block');

const ListsGetListsInnerTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


