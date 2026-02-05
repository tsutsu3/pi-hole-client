//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/search_search_results.dart';
import 'package:pihole_v6_api/src/model/search_search_gravity_inner.dart';
import 'package:pihole_v6_api/src/model/search_search_parameters.dart';
import 'package:pihole_v6_api/src/model/search_search_domains_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearch {
  /// Returns a new [SearchSearch] instance.
  SearchSearch({

     this.domains,

     this.gravity,

     this.parameters,

     this.results,
  });

  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final List<SearchSearchDomainsInner>? domains;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final List<SearchSearchGravityInner>? gravity;



  @JsonKey(
    
    name: r'parameters',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchParameters? parameters;



  @JsonKey(
    
    name: r'results',
    required: false,
    includeIfNull: false,
  )


  final SearchSearchResults? results;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearch &&
      other.domains == domains &&
      other.gravity == gravity &&
      other.parameters == parameters &&
      other.results == results;

    @override
    int get hashCode =>
        domains.hashCode +
        gravity.hashCode +
        parameters.hashCode +
        results.hashCode;

  factory SearchSearch.fromJson(Map<String, dynamic> json) => _$SearchSearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

