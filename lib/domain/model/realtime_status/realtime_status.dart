import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/summary.dart';
import 'package:pi_hole_client/domain/model/metrics/top_clients.dart';
import 'package:pi_hole_client/domain/model/metrics/top_domains.dart';
import 'package:pi_hole_client/domain/model/metrics/upstreams.dart';

part 'realtime_status.freezed.dart';
part 'realtime_status.g.dart';

@freezed
sealed class RealtimeStatus with _$RealtimeStatus {
  @JsonSerializable(explicitToJson: true)
  factory RealtimeStatus({
    required Summary summary,
    required DnsBlockingStatus status,
    required int privacyLevel,
    required TopDomains topDomains,
    required TopClients topClients,
    required List<DestinationStat> forwardDestinations,
    required List<QueryTypeStat> queryTypes,
  }) = _RealtimeStatus;

  factory RealtimeStatus.fromJson(Map<String, dynamic> json) =>
      _$RealtimeStatusFromJson(json);
}
