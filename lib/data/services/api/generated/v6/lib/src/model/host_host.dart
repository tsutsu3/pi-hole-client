//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/host_host_dmi.dart';
import 'package:pihole_v6_api/src/model/host_host_uname.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_host.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HostHost {
  /// Returns a new [HostHost] instance.
  HostHost({

     this.uname,

     this.model,

     this.dmi,
  });

  @JsonKey(
    
    name: r'uname',
    required: false,
    includeIfNull: false,
  )


  final HostHostUname? uname;



      /// Device model (if available, `null` otherwise)
  @JsonKey(
    
    name: r'model',
    required: false,
    includeIfNull: false,
  )


  final String? model;



  @JsonKey(
    
    name: r'dmi',
    required: false,
    includeIfNull: false,
  )


  final HostHostDmi? dmi;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HostHost &&
      other.uname == uname &&
      other.model == model &&
      other.dmi == dmi;

    @override
    int get hashCode =>
        uname.hashCode +
        (model == null ? 0 : model.hashCode) +
        dmi.hashCode;

  factory HostHost.fromJson(Map<String, dynamic> json) => _$HostHostFromJson(json);

  Map<String, dynamic> toJson() => _$HostHostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

