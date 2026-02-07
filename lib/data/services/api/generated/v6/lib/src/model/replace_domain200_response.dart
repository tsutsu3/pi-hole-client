//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/get_domains_inner.dart';
import 'package:pihole_v6_api/src/model/lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replace_domain200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReplaceDomain200Response {
  /// Returns a new [ReplaceDomain200Response] instance.
  ReplaceDomain200Response({

     this.domains,

     this.processed,

     this.took,
  });

      /// Array of domains
  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final List<GetDomainsInner>? domains;



  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final ListsProcessedProcessed? processed;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReplaceDomain200Response &&
      other.domains == domains &&
      other.processed == processed &&
      other.took == took;

    @override
    int get hashCode =>
        domains.hashCode +
        (processed == null ? 0 : processed.hashCode) +
        took.hashCode;

  factory ReplaceDomain200Response.fromJson(Map<String, dynamic> json) => _$ReplaceDomain200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceDomain200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

