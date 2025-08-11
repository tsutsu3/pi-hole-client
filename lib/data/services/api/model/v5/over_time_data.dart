import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/services/api/model/v5/json_converter.dart';

part 'over_time_data.freezed.dart';
part 'over_time_data.g.dart';

@freezed
sealed class OverTimeData with _$OverTimeData {
  @JsonSerializable(explicitToJson: true)
  const factory OverTimeData({
    @JsonKey(name: 'domains_over_time')
    required Map<String, int> domainsOverTime,
    @JsonKey(name: 'ads_over_time') required Map<String, int> adsOverTime,
    @MapOrEmptyListConverter() required List<Client> clients,
    @JsonKey(name: 'over_time')
    @MapListOrEmptyListConverter()
    required Map<String, List<int>> overTime,
  }) = _OverTimeData;

  factory OverTimeData.fromJson(Map<String, dynamic> json) =>
      _$OverTimeDataFromJson(json);
}

@freezed
sealed class Client with _$Client {
  const factory Client({
    required String name,
    required String ip,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
