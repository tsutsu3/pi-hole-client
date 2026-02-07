//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'database_summary.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DatabaseSummary {
  /// Returns a new [DatabaseSummary] instance.
  DatabaseSummary({

     this.sumQueries,

     this.sumBlocked,

     this.percentBlocked,

     this.totalClients,
  });

      /// Total number of queries
  @JsonKey(
    
    name: r'sum_queries',
    required: false,
    includeIfNull: false,
  )


  final int? sumQueries;



      /// Total number of blocked queries
  @JsonKey(
    
    name: r'sum_blocked',
    required: false,
    includeIfNull: false,
  )


  final int? sumBlocked;



      /// Percentage of blocked queries
  @JsonKey(
    
    name: r'percent_blocked',
    required: false,
    includeIfNull: false,
  )


  final num? percentBlocked;



      /// Total number of clients
  @JsonKey(
    
    name: r'total_clients',
    required: false,
    includeIfNull: false,
  )


  final int? totalClients;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DatabaseSummary &&
      other.sumQueries == sumQueries &&
      other.sumBlocked == sumBlocked &&
      other.percentBlocked == percentBlocked &&
      other.totalClients == totalClients;

    @override
    int get hashCode =>
        sumQueries.hashCode +
        sumBlocked.hashCode +
        percentBlocked.hashCode +
        totalClients.hashCode;

  factory DatabaseSummary.fromJson(Map<String, dynamic> json) => _$DatabaseSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

