//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version_web_local.dart';
import 'package:pihole_v6_api/src/model/version_version_web_remote.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version_version_web.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VersionVersionWeb {
  /// Returns a new [VersionVersionWeb] instance.
  VersionVersionWeb({

     this.local,

     this.remote,
  });

  @JsonKey(
    
    name: r'local',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionWebLocal? local;



  @JsonKey(
    
    name: r'remote',
    required: false,
    includeIfNull: false,
  )


  final VersionVersionWebRemote? remote;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VersionVersionWeb &&
      other.local == local &&
      other.remote == remote;

    @override
    int get hashCode =>
        local.hashCode +
        remote.hashCode;

  factory VersionVersionWeb.fromJson(Map<String, dynamic> json) => _$VersionVersionWebFromJson(json);

  Map<String, dynamic> toJson() => _$VersionVersionWebToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

