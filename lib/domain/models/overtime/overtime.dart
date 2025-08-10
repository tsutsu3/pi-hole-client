import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/models/metrics/clients.dart';
import 'package:pi_hole_client/domain/models/metrics/history.dart';

part 'overtime.freezed.dart';
part 'overtime.g.dart';

@freezed
sealed class OverTime with _$OverTime {
  @JsonSerializable(explicitToJson: true)
  factory OverTime({
    required List<HistoryEntry> domainsOverTime,
    required List<HistoryEntry> adsOverTime,
    required List<Client> clients,
    required List<ClientOverTimeEntry> overTime,
  }) = _OverTime;

  factory OverTime.fromJson(Map<String, dynamic> json) =>
      _$OverTimeFromJson(json);
}
