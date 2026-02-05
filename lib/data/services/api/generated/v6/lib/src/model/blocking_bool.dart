//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blocking_bool.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BlockingBool {
  /// Returns a new [BlockingBool] instance.
  BlockingBool({

     this.blocking = true,
  });

      /// Blocking status
  @JsonKey(
    defaultValue: true,
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final bool? blocking;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BlockingBool &&
      other.blocking == blocking;

    @override
    int get hashCode =>
        blocking.hashCode;

  factory BlockingBool.fromJson(Map<String, dynamic> json) => _$BlockingBoolFromJson(json);

  Map<String, dynamic> toJson() => _$BlockingBoolToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

