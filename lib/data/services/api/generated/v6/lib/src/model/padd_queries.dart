//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_queries.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddQueries {
  /// Returns a new [PaddQueries] instance.
  PaddQueries({

     this.total,

     this.blocked,

     this.percentBlocked,
  });

      /// Total number of queries within the last 24 hours
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



      /// Percentage of blocked queries
  @JsonKey(
    
    name: r'percent_blocked',
    required: false,
    includeIfNull: false,
  )


  final num? percentBlocked;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddQueries &&
      other.total == total &&
      other.blocked == blocked &&
      other.percentBlocked == percentBlocked;

    @override
    int get hashCode =>
        total.hashCode +
        blocked.hashCode +
        percentBlocked.hashCode;

  factory PaddQueries.fromJson(Map<String, dynamic> json) => _$PaddQueriesFromJson(json);

  Map<String, dynamic> toJson() => _$PaddQueriesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

