import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';
part 'history.g.dart';

// api/history
@freezed
sealed class History with _$History {
  const factory History({
    required List<HistoryData> history,
    required double took,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

@freezed
sealed class HistoryData with _$HistoryData {
  const factory HistoryData({
    required double timestamp,
    required int total,
    required int cached,
    required int blocked,
    required int forwarded,
  }) = _HistoryData;

  factory HistoryData.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataFromJson(json);
}

// api/history/clients
@freezed
sealed class HistoryClients with _$HistoryClients {
  const factory HistoryClients({
    required Map<String, Client> clients,
    required List<HistoryEntry> history,
    required double took,
  }) = _HistoryClients;

  factory HistoryClients.fromJson(Map<String, dynamic> json) =>
      _$HistoryClientsFromJson(json);
}

@freezed
sealed class Client with _$Client {
  const factory Client({
    required String? name, // Nullable since "name" can be null
    required int total,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
sealed class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required double timestamp,
    required Map<String, int> data,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryFromJson(json);
}
