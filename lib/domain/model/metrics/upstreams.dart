import 'package:freezed_annotation/freezed_annotation.dart';

part 'upstreams.freezed.dart';
part 'upstreams.g.dart';

@freezed
sealed class DestinationStat with _$DestinationStat {
  const factory DestinationStat({
    required String destination,
    required double percentage,
    // v6-only field
    int? count,
  }) = _DestinationStat;

  factory DestinationStat.fromJson(Map<String, dynamic> json) =>
      _$DestinationStatFromJson(json);
}
