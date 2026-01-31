import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';
part 'history.g.dart';

@freezed
sealed class History with _$History {
  const factory History({
    required List<HistoryEntry> domainsOverTime,
    required List<HistoryEntry> adsOverTime,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

@freezed
sealed class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required DateTime timestamp,
    required int count,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryFromJson(json);
}
