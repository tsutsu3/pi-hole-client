//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/top_domains_domains_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_domains.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TopDomains {
  /// Returns a new [TopDomains] instance.
  TopDomains({

     this.domains,

     this.totalQueries,

     this.blockedQueries,
  });

      /// Array of domains
  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final List<TopDomainsDomainsInner>? domains;



      /// Total number of queries
  @JsonKey(
    
    name: r'total_queries',
    required: false,
    includeIfNull: false,
  )


  final int? totalQueries;



      /// Number of blocked queries
  @JsonKey(
    
    name: r'blocked_queries',
    required: false,
    includeIfNull: false,
  )


  final int? blockedQueries;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TopDomains &&
      other.domains == domains &&
      other.totalQueries == totalQueries &&
      other.blockedQueries == blockedQueries;

    @override
    int get hashCode =>
        domains.hashCode +
        totalQueries.hashCode +
        blockedQueries.hashCode;

  factory TopDomains.fromJson(Map<String, dynamic> json) => _$TopDomainsFromJson(json);

  Map<String, dynamic> toJson() => _$TopDomainsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

