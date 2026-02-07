//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_history_history_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TotalHistoryHistoryInner {
  /// Returns a new [TotalHistoryHistoryInner] instance.
  TotalHistoryHistoryInner({

     this.timestamp,

     this.total,

     this.cached,

     this.blocked,

     this.forwarded,
  });

      /// Timestamp
  @JsonKey(
    
    name: r'timestamp',
    required: false,
    includeIfNull: false,
  )


  final num? timestamp;



      /// Total number of queries
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of cached queries
  @JsonKey(
    
    name: r'cached',
    required: false,
    includeIfNull: false,
  )


  final int? cached;



      /// Number of blocked queries
  @JsonKey(
    
    name: r'blocked',
    required: false,
    includeIfNull: false,
  )


  final int? blocked;



      /// Number of forwarded queries
  @JsonKey(
    
    name: r'forwarded',
    required: false,
    includeIfNull: false,
  )


  final int? forwarded;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TotalHistoryHistoryInner &&
      other.timestamp == timestamp &&
      other.total == total &&
      other.cached == cached &&
      other.blocked == blocked &&
      other.forwarded == forwarded;

    @override
    int get hashCode =>
        timestamp.hashCode +
        total.hashCode +
        cached.hashCode +
        blocked.hashCode +
        forwarded.hashCode;

  factory TotalHistoryHistoryInner.fromJson(Map<String, dynamic> json) => _$TotalHistoryHistoryInnerFromJson(json);

  Map<String, dynamic> toJson() => _$TotalHistoryHistoryInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

