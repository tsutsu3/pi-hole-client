import 'package:freezed_annotation/freezed_annotation.dart';

part 'host.freezed.dart';
part 'host.g.dart';

@freezed
sealed class InfoHost with _$InfoHost {
  @JsonSerializable(explicitToJson: true)
  const factory InfoHost({
    required String domainName,
    required String arch,
    required String hostName,
    required String release,
    required String sysName,
    required String version,
    String? model,
  }) = _InfoHost;

  factory InfoHost.fromJson(Map<String, dynamic> json) =>
      _$InfoHostFromJson(json);
}
