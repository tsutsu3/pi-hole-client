//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/metrics_metrics_dhcp_leases.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metrics_metrics_dhcp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MetricsMetricsDhcp {
  /// Returns a new [MetricsMetricsDhcp] instance.
  MetricsMetricsDhcp({

     this.ack,

     this.nak,

     this.decline,

     this.offer,

     this.discover,

     this.inform,

     this.request,

     this.release,

     this.noanswer,

     this.bootp,

     this.pxe,

     this.leases,
  });

      /// Number of DHCP ACKs
  @JsonKey(
    
    name: r'ack',
    required: false,
    includeIfNull: false,
  )


  final int? ack;



      /// Number of DHCP NAKs
  @JsonKey(
    
    name: r'nak',
    required: false,
    includeIfNull: false,
  )


  final int? nak;



      /// Number of DHCP declines
  @JsonKey(
    
    name: r'decline',
    required: false,
    includeIfNull: false,
  )


  final int? decline;



      /// Number of DHCP offers
  @JsonKey(
    
    name: r'offer',
    required: false,
    includeIfNull: false,
  )


  final int? offer;



      /// Number of DHCP discovers
  @JsonKey(
    
    name: r'discover',
    required: false,
    includeIfNull: false,
  )


  final int? discover;



      /// Number of DHCP informs
  @JsonKey(
    
    name: r'inform',
    required: false,
    includeIfNull: false,
  )


  final int? inform;



      /// Number of DHCP requests
  @JsonKey(
    
    name: r'request',
    required: false,
    includeIfNull: false,
  )


  final int? request;



      /// Number of DHCP releases
  @JsonKey(
    
    name: r'release',
    required: false,
    includeIfNull: false,
  )


  final int? release;



      /// Number of DHCP requests without answer
  @JsonKey(
    
    name: r'noanswer',
    required: false,
    includeIfNull: false,
  )


  final int? noanswer;



      /// Number of BOOTP requests
  @JsonKey(
    
    name: r'bootp',
    required: false,
    includeIfNull: false,
  )


  final int? bootp;



      /// Number of PXE requests
  @JsonKey(
    
    name: r'pxe',
    required: false,
    includeIfNull: false,
  )


  final int? pxe;



  @JsonKey(
    
    name: r'leases',
    required: false,
    includeIfNull: false,
  )


  final MetricsMetricsDhcpLeases? leases;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MetricsMetricsDhcp &&
      other.ack == ack &&
      other.nak == nak &&
      other.decline == decline &&
      other.offer == offer &&
      other.discover == discover &&
      other.inform == inform &&
      other.request == request &&
      other.release == release &&
      other.noanswer == noanswer &&
      other.bootp == bootp &&
      other.pxe == pxe &&
      other.leases == leases;

    @override
    int get hashCode =>
        ack.hashCode +
        nak.hashCode +
        decline.hashCode +
        offer.hashCode +
        discover.hashCode +
        inform.hashCode +
        request.hashCode +
        release.hashCode +
        noanswer.hashCode +
        bootp.hashCode +
        pxe.hashCode +
        leases.hashCode;

  factory MetricsMetricsDhcp.fromJson(Map<String, dynamic> json) => _$MetricsMetricsDhcpFromJson(json);

  Map<String, dynamic> toJson() => _$MetricsMetricsDhcpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

