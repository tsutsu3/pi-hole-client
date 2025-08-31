import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_dns.freezed.dart';
part 'local_dns.g.dart';

@freezed
sealed class LocalDns with _$LocalDns {
  const factory LocalDns({required String ip, required String name}) =
      _LocalDns;

  factory LocalDns.fromJson(Map<String, dynamic> json) =>
      _$LocalDnsFromJson(json);
}
