//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blocking.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Blocking {
  /// Returns a new [Blocking] instance.
  Blocking({

     this.blocking,
  });

      /// Blocking status
  @JsonKey(
    
    name: r'blocking',
    required: false,
    includeIfNull: false,
  )


  final BlockingBlockingEnum? blocking;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Blocking &&
      other.blocking == blocking;

    @override
    int get hashCode =>
        blocking.hashCode;

  factory Blocking.fromJson(Map<String, dynamic> json) => _$BlockingFromJson(json);

  Map<String, dynamic> toJson() => _$BlockingToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// Blocking status
enum BlockingBlockingEnum {
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

const BlockingBlockingEnum(this.value);

final String value;

@override
String toString() => value;
}


