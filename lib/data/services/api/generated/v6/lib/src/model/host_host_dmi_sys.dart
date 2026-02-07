//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_dmi_sys.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostDmiSys {
  /// Returns a new [HostHostDmiSys] instance.
  HostHostDmiSys({

     this.vendor,
  });

      /// System vendor (if available, `null` otherwise)
  @JsonKey(
    
    name: r'vendor',
    required: false,
    includeIfNull: false,
  )


  final String? vendor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostDmiSys &&
      other.vendor == vendor;

    @override
    int get hashCode =>
        (vendor == null ? 0 : vendor.hashCode);

  factory HostHostDmiSys.fromJson(Map<String, dynamic> json) => _$HostHostDmiSysFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostDmiSysToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

