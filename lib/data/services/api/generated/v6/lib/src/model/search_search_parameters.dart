//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_parameters.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchParameters {
  /// Returns a new [SearchSearchParameters] instance.
  SearchSearchParameters({

     this.partial,

     this.N,

     this.domain,

     this.debug,
  });

      /// Whether partial matching was requested. Note that partial matching may not find complex regex entries.
  @JsonKey(
    
    name: r'partial',
    required: false,
    includeIfNull: false,
  )


  final bool? partial;



      /// Maximum number of results to be returned (per type)
  @JsonKey(
    
    name: r'N',
    required: false,
    includeIfNull: false,
  )


  final int? N;



      /// (Part of) domain to be searched for
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Whether debug information was requested
  @JsonKey(
    
    name: r'debug',
    required: false,
    includeIfNull: false,
  )


  final bool? debug;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchParameters &&
      other.partial == partial &&
      other.N == N &&
      other.domain == domain &&
      other.debug == debug;

    @override
    int get hashCode =>
        partial.hashCode +
        N.hashCode +
        domain.hashCode +
        debug.hashCode;

  factory SearchSearchParameters.fromJson(Map<String, dynamic> json) => _$SearchSearchParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchParametersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

