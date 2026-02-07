//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/host_host.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Host {
  /// Returns a new [Host] instance.
  Host({

     this.host,
  });

  @JsonKey(
    
    name: r'host',
    required: false,
    includeIfNull: false,
  )


  final HostHost? host;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Host &&
      other.host == host;

    @override
    int get hashCode =>
        host.hashCode;

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);

  Map<String, dynamic> toJson() => _$HostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

