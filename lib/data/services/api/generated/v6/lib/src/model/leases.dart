//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/leases_leases_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leases.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Leases {
  /// Returns a new [Leases] instance.
  Leases({

     this.leases,
  });

      /// DHCP leases
  @JsonKey(
    
    name: r'leases',
    required: false,
    includeIfNull: false,
  )


  final List<LeasesLeasesInner>? leases;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Leases &&
      other.leases == leases;

    @override
    int get hashCode =>
        leases.hashCode;

  factory Leases.fromJson(Map<String, dynamic> json) => _$LeasesFromJson(json);

  Map<String, dynamic> toJson() => _$LeasesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

