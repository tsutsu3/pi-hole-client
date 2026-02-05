//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_blocking200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetBlocking200Response {
  /// Returns a new [GetBlocking200Response] instance.
  GetBlocking200Response({

     this.blocking,

     this.timer,

     this.took,
  });

      /// Blocking status
  @JsonKey(
    
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final GetBlocking200ResponseBlockingEnum? blocking;



      /// Remaining seconds until blocking mode is automatically changed
  @JsonKey(
    
    name: r'timer',
    required: false,
    includeIfNull: false,
  )


  final num? timer;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetBlocking200Response &&
      other.blocking == blocking &&
      other.timer == timer &&
      other.took == took;

    @override
    int get hashCode =>
        blocking.hashCode +
        (timer == null ? 0 : timer.hashCode) +
        took.hashCode;

  factory GetBlocking200Response.fromJson(Map<String, dynamic> json) => _$GetBlocking200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBlocking200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Blocking status
enum GetBlocking200ResponseBlockingEnum {
    /// Blocking status
@JsonValue(r'enabled')
enabled(r'enabled'),
    /// Blocking status
@JsonValue(r'disabled')
disabled(r'disabled'),
    /// Blocking status
@JsonValue(r'failed')
failed(r'failed'),
    /// Blocking status
@JsonValue(r'unknown')
unknown(r'unknown');

const GetBlocking200ResponseBlockingEnum(this.value);

final String value;

@override
String toString() => value;
}


