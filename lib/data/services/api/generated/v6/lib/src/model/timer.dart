//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timer.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Timer {
  /// Returns a new [Timer] instance.
  Timer({

     this.timer,
  });

      /// Remaining seconds until blocking mode is automatically changed
  @JsonKey(
    
    name: r'timer',
    required: false,
    includeIfNull: false,
  )


  final num? timer;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Timer &&
      other.timer == timer;

    @override
    int get hashCode =>
        (timer == null ? 0 : timer.hashCode);

  factory Timer.fromJson(Map<String, dynamic> json) => _$TimerFromJson(json);

  Map<String, dynamic> toJson() => _$TimerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

