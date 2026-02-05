//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_components_schemas_readonly.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsComponentsSchemasReadonly {
  /// Returns a new [ListsComponentsSchemasReadonly] instance.
  ListsComponentsSchemasReadonly({

     this.id,

     this.dateAdded,

     this.dateModified,

     this.dateUpdated,

     this.number,

     this.invalidDomains,

     this.abpEntries,

     this.status,
  });

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
    bool operator ==(Object other) => identical(this, other) || other is ListsComponentsSchemasReadonly &&
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
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        dateUpdated.hashCode +
        number.hashCode +
        invalidDomains.hashCode +
        abpEntries.hashCode +
        status.hashCode;

  factory ListsComponentsSchemasReadonly.fromJson(Map<String, dynamic> json) => _$ListsComponentsSchemasReadonlyFromJson(json);

  Map<String, dynamic> toJson() => _$ListsComponentsSchemasReadonlyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

