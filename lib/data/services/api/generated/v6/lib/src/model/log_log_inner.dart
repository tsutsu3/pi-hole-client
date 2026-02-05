//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_log_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LogLogInner {
  /// Returns a new [LogLogInner] instance.
  LogLogInner({

     this.timestamp,

     this.message,

     this.prio,
  });

      /// Unix timestamp of log line creation (server time)
  @JsonKey(
    
    name: r'timestamp',
    required: false,
    includeIfNull: false,
  )


  final num? timestamp;



      /// Log line content
  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



      /// Log line priority (if available)
  @JsonKey(
    
    name: r'prio',
    required: false,
    includeIfNull: false,
  )


  final String? prio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LogLogInner &&
      other.timestamp == timestamp &&
      other.message == message &&
      other.prio == prio;

    @override
    int get hashCode =>
        timestamp.hashCode +
        message.hashCode +
        (prio == null ? 0 : prio.hashCode);

  factory LogLogInner.fromJson(Map<String, dynamic> json) => _$LogLogInnerFromJson(json);

  Map<String, dynamic> toJson() => _$LogLogInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

