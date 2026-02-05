//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/search_search_results_domains.dart';
import 'package:pihole_v6_api/src/model/search_search_results_gravity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_results.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchResults {
  /// Returns a new [SearchSearchResults] instance.
  SearchSearchResults({

     this.domains,

     this.gravity,

     this.total,
  });

  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchResultsDomains? domains;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchResultsGravity? gravity;



      /// Total number of matches
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchResults &&
      other.domains == domains &&
      other.gravity == gravity &&
      other.total == total;

    @override
    int get hashCode =>
        domains.hashCode +
        gravity.hashCode +
        total.hashCode;

  factory SearchSearchResults.fromJson(Map<String, dynamic> json) => _$SearchSearchResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchResultsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

