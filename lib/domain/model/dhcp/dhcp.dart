import 'package:freezed_annotation/freezed_annotation.dart';

part 'dhcp.freezed.dart';
part 'dhcp.g.dart';

@freezed
sealed class DhcpLease with _$DhcpLease {
  const factory DhcpLease({
    required String name,
    required String hwaddr,
    required String ip,
    required String clientid,
    DateTime? expires,
  }) = _DhcpLease;

  factory DhcpLease.fromJson(Map<String, dynamic> json) =>
      _$DhcpLeaseFromJson(json);
}
