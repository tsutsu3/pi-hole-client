//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_results_domains.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchResultsDomains {
  /// Returns a new [SearchSearchResultsDomains] instance.
  SearchSearchResultsDomains({

     this.exact,

     this.regex,
  });

      /// Number of exactly matching domains
  @JsonKey(
    
    name: r'exact',
    required: false,
    includeIfNull: false,
  )


  final int? exact;



      /// Number of regex matching domains
  @JsonKey(
    
    name: r'regex',
    required: false,
    includeIfNull: false,
  )


  final int? regex;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchResultsDomains &&
      other.exact == exact &&
      other.regex == regex;

    @override
    int get hashCode =>
        exact.hashCode +
        regex.hashCode;

  factory SearchSearchResultsDomains.fromJson(Map<String, dynamic> json) => _$SearchSearchResultsDomainsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchResultsDomainsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

