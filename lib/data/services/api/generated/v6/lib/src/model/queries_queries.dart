//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/queries_queries_types.dart';
import 'package:pihole_v6_api/src/model/queries_queries_status.dart';
import 'package:pihole_v6_api/src/model/queries_queries_replies.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_queries.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesQueries {
  /// Returns a new [QueriesQueries] instance.
  QueriesQueries({

     this.total,

     this.blocked,

     this.percentBlocked,

     this.uniqueDomains,

     this.forwarded,

     this.cached,

     this.frequency,

     this.types,

     this.status,

     this.replies,
  });

      /// Total number of queries
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of blocked queries
  @JsonKey(
    
    name: r'blocked',
    required: false,
    includeIfNull: false,
  )


  final int? blocked;



      /// Percent of blocked queries
  @JsonKey(
    
    name: r'percent_blocked',
    required: false,
    includeIfNull: false,
  )


  final num? percentBlocked;



      /// Number of unique domains FTL knows
  @JsonKey(
    
    name: r'unique_domains',
    required: false,
    includeIfNull: false,
  )


  final int? uniqueDomains;



      /// Number of queries that have been forwarded upstream
  @JsonKey(
    
    name: r'forwarded',
    required: false,
    includeIfNull: false,
  )


  final int? forwarded;



      /// Number of queries replied to from cache or local configuration
  @JsonKey(
    
    name: r'cached',
    required: false,
    includeIfNull: false,
  )


  final int? cached;



      /// Average number of queries per second
  @JsonKey(
    
    name: r'frequency',
    required: false,
    includeIfNull: false,
  )


  final num? frequency;



  @JsonKey(
    
    name: r'types',
    required: false,
    includeIfNull: false,
  )


  final QueriesQueriesTypes? types;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final QueriesQueriesStatus? status;



  @JsonKey(
    
    name: r'replies',
    required: false,
    includeIfNull: false,
  )


  final QueriesQueriesReplies? replies;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesQueries &&
      other.total == total &&
      other.blocked == blocked &&
      other.percentBlocked == percentBlocked &&
      other.uniqueDomains == uniqueDomains &&
      other.forwarded == forwarded &&
      other.cached == cached &&
      other.frequency == frequency &&
      other.types == types &&
      other.status == status &&
      other.replies == replies;

    @override
    int get hashCode =>
        total.hashCode +
        blocked.hashCode +
        percentBlocked.hashCode +
        uniqueDomains.hashCode +
        forwarded.hashCode +
        cached.hashCode +
        frequency.hashCode +
        types.hashCode +
        status.hashCode +
        replies.hashCode;

  factory QueriesQueries.fromJson(Map<String, dynamic> json) => _$QueriesQueriesFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesQueriesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

