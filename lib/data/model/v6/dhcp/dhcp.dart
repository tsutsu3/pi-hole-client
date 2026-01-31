import 'package:freezed_annotation/freezed_annotation.dart';

part 'dhcp.freezed.dart';
part 'dhcp.g.dart';

@freezed
sealed class Dhcp with _$Dhcp {
  @JsonSerializable(explicitToJson: true)
  const factory Dhcp({required List<DhcpData> leases, required double took}) =
      _Dhcp;

  factory Dhcp.fromJson(Map<String, dynamic> json) => _$DhcpFromJson(json);
}

@freezed
sealed class DhcpData with _$DhcpData {
  const factory DhcpData({
    required int expires,
    required String name,
    required String hwaddr,
    required String ip,
    required String clientid,
  }) = _DhcpData;

  factory DhcpData.fromJson(Map<String, dynamic> json) =>
      _$DhcpDataFromJson(json);
}
