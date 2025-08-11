import 'package:freezed_annotation/freezed_annotation.dart';

part 'system.freezed.dart';
part 'system.g.dart';

@freezed
sealed class InfoSystem with _$InfoSystem {
  @JsonSerializable(explicitToJson: true)
  const factory InfoSystem({
    required int uptime,
    required double ramUsage,
    required double cpuUsage,
  }) = _InfoSystem;

  factory InfoSystem.fromJson(Map<String, dynamic> json) =>
      _$InfoSystemFromJson(json);
}
