//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host_dmi_board.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHostDmiBoard {
  /// Returns a new [HostHostDmiBoard] instance.
  HostHostDmiBoard({

     this.name,

     this.vendor,

     this.version,
  });

      /// Board name (if available, `null` otherwise)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Board vendor (if available, `null` otherwise)
  @JsonKey(
    
    name: r'vendor',
    required: false,
    includeIfNull: false,
  )


  final String? vendor;



      /// Board version (if available, `null` otherwise)
  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final String? version;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHostDmiBoard &&
      other.name == name &&
      other.vendor == vendor &&
      other.version == version;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        (vendor == null ? 0 : vendor.hashCode) +
        (version == null ? 0 : version.hashCode);

  factory HostHostDmiBoard.fromJson(Map<String, dynamic> json) => _$HostHostDmiBoardFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostDmiBoardToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

