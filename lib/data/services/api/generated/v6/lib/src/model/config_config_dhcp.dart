//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_dhcp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigDhcp {
  /// Returns a new [ConfigConfigDhcp] instance.
  ConfigConfigDhcp({

     this.active,

     this.start,

     this.end,

     this.router,

     this.netmask,

     this.leaseTime,

     this.ipv6,

     this.rapidCommit,

     this.multiDNS,

     this.logging,

     this.ignoreUnknownClients,

     this.hosts,
  });

  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



  @JsonKey(
    
    name: r'start',
    required: false,
    includeIfNull: false,
  )


  final String? start;



  @JsonKey(
    
    name: r'end',
    required: false,
    includeIfNull: false,
  )


  final String? end;



  @JsonKey(
    
    name: r'router',
    required: false,
    includeIfNull: false,
  )


  final String? router;



  @JsonKey(
    
    name: r'netmask',
    required: false,
    includeIfNull: false,
  )


  final String? netmask;



  @JsonKey(
    
    name: r'leaseTime',
    required: false,
    includeIfNull: false,
  )


  final String? leaseTime;



  @JsonKey(
    
    name: r'ipv6',
    required: false,
    includeIfNull: false,
  )


  final bool? ipv6;



  @JsonKey(
    
    name: r'rapidCommit',
    required: false,
    includeIfNull: false,
  )


  final bool? rapidCommit;



  @JsonKey(
    
    name: r'multiDNS',
    required: false,
    includeIfNull: false,
  )


  final bool? multiDNS;



  @JsonKey(
    
    name: r'logging',
    required: false,
    includeIfNull: false,
  )


  final bool? logging;



  @JsonKey(
    
    name: r'ignoreUnknownClients',
    required: false,
    includeIfNull: false,
  )


  final bool? ignoreUnknownClients;



  @JsonKey(
    
    name: r'hosts',
    required: false,
    includeIfNull: false,
  )


  final List<String>? hosts;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigDhcp &&
      other.active == active &&
      other.start == start &&
      other.end == end &&
      other.router == router &&
      other.netmask == netmask &&
      other.leaseTime == leaseTime &&
      other.ipv6 == ipv6 &&
      other.rapidCommit == rapidCommit &&
      other.multiDNS == multiDNS &&
      other.logging == logging &&
      other.ignoreUnknownClients == ignoreUnknownClients &&
      other.hosts == hosts;

    @override
    int get hashCode =>
        active.hashCode +
        start.hashCode +
        end.hashCode +
        router.hashCode +
        netmask.hashCode +
        leaseTime.hashCode +
        ipv6.hashCode +
        rapidCommit.hashCode +
        multiDNS.hashCode +
        logging.hashCode +
        ignoreUnknownClients.hashCode +
        hosts.hashCode;

  factory ConfigConfigDhcp.fromJson(Map<String, dynamic> json) => _$ConfigConfigDhcpFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigDhcpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

