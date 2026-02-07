//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_suggestions_clients_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasSuggestionsClientsInner {
  /// Returns a new [SchemasSuggestionsClientsInner] instance.
  SchemasSuggestionsClientsInner({

     this.hwaddr,

     this.macVendor,

     this.lastQuery,

     this.addresses,

     this.names,
  });

  @JsonKey(
    
    name: r'hwaddr',
    required: false,
    includeIfNull: false,
  )


  final String? hwaddr;



  @JsonKey(
    
    name: r'macVendor',
    required: false,
    includeIfNull: false,
  )


  final String? macVendor;



  @JsonKey(
    
    name: r'lastQuery',
    required: false,
    includeIfNull: false,
  )


  final int? lastQuery;



      /// Comma-separated list of IP addresses
  @JsonKey(
    
    name: r'addresses',
    required: false,
    includeIfNull: false,
  )


  final String? addresses;



      /// Comma-separated list of hostnames (if available)
  @JsonKey(
    
    name: r'names',
    required: false,
    includeIfNull: false,
  )


  final String? names;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasSuggestionsClientsInner &&
      other.hwaddr == hwaddr &&
      other.macVendor == macVendor &&
      other.lastQuery == lastQuery &&
      other.addresses == addresses &&
      other.names == names;

    @override
    int get hashCode =>
        (hwaddr == null ? 0 : hwaddr.hashCode) +
        (macVendor == null ? 0 : macVendor.hashCode) +
        lastQuery.hashCode +
        (addresses == null ? 0 : addresses.hashCode) +
        (names == null ? 0 : names.hashCode);

  factory SchemasSuggestionsClientsInner.fromJson(Map<String, dynamic> json) => _$SchemasSuggestionsClientsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasSuggestionsClientsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

