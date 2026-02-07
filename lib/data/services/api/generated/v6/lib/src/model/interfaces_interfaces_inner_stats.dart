//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats_tx_bytes.dart';
import 'package:pihole_v6_api/src/model/interfaces_interfaces_inner_stats_rx_bytes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interfaces_interfaces_inner_stats.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class InterfacesInterfacesInnerStats {
  /// Returns a new [InterfacesInterfacesInnerStats] instance.
  InterfacesInterfacesInnerStats({

     this.rxBytes,

     this.txBytes,
  });

  @JsonKey(
    
    name: r'rx_bytes',
    required: false,
    includeIfNull: false,
  )


  final InterfacesInterfacesInnerStatsRxBytes? rxBytes;



  @JsonKey(
    
    name: r'tx_bytes',
    required: false,
    includeIfNull: false,
  )


  final InterfacesInterfacesInnerStatsTxBytes? txBytes;





    @override
    bool operator ==(Object other) => identical(this, other) || other is InterfacesInterfacesInnerStats &&
      other.rxBytes == rxBytes &&
      other.txBytes == txBytes;

    @override
    int get hashCode =>
        rxBytes.hashCode +
        txBytes.hashCode;

  factory InterfacesInterfacesInnerStats.fromJson(Map<String, dynamic> json) => _$InterfacesInterfacesInnerStatsFromJson(json);

  Map<String, dynamic> toJson() => _$InterfacesInterfacesInnerStatsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

