//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_blocking_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SetBlockingRequest {
  /// Returns a new [SetBlockingRequest] instance.
  SetBlockingRequest({

     this.blocking = true,

     this.timer,
  });

      /// Blocking status
  @JsonKey(
    defaultValue: true,
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final bool? blocking;



      /// Remaining seconds until blocking mode is automatically changed
  @JsonKey(
    
    name: r'timer',
    required: false,
    includeIfNull: false,
  )


  final num? timer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SetBlockingRequest &&
      other.blocking == blocking &&
      other.timer == timer;

    @override
    int get hashCode =>
        blocking.hashCode +
        (timer == null ? 0 : timer.hashCode);

  factory SetBlockingRequest.fromJson(Map<String, dynamic> json) => _$SetBlockingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SetBlockingRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

