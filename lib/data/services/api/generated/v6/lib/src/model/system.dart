//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/system_system.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'system.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class System {
  /// Returns a new [System] instance.
  System({

     this.system,
  });

  @JsonKey(
    
    name: r'system',
    required: false,
    includeIfNull: false,
  )


  final SystemSystem? system;





    @override
    bool operator ==(Object other) => identical(this, other) || other is System &&
      other.system == system;

    @override
    int get hashCode =>
        system.hashCode;

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  Map<String, dynamic> toJson() => _$SystemToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

