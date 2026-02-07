//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_history_history_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientHistoryHistoryInner {
  /// Returns a new [ClientHistoryHistoryInner] instance.
  ClientHistoryHistoryInner({

     this.timestamp,

     this.data,
  });

      /// Timestamp
  @JsonKey(
    
    name: r'timestamp',
    required: false,
    includeIfNull: false,
  )


  final num? timestamp;



      /// Data corresponding to the individual clients
  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Map<String, int>? data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientHistoryHistoryInner &&
      other.timestamp == timestamp &&
      other.data == data;

    @override
    int get hashCode =>
        timestamp.hashCode +
        data.hashCode;

  factory ClientHistoryHistoryInner.fromJson(Map<String, dynamic> json) => _$ClientHistoryHistoryInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ClientHistoryHistoryInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

