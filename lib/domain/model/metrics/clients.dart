import 'package:freezed_annotation/freezed_annotation.dart';

part 'clients.freezed.dart';
part 'clients.g.dart';

@freezed
sealed class Clients with _$Clients {
  @JsonSerializable(explicitToJson: true)
  const factory Clients({
    required List<Client> clients,
    required List<ClientOverTimeEntry> overTime,
  }) = _Clients;

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@freezed
sealed class Client with _$Client {
  const factory Client({required String ip, String? name}) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
sealed class ClientOverTimeEntry with _$ClientOverTimeEntry {
  const factory ClientOverTimeEntry({
    required DateTime time,
    required List<int> values,
  }) = _ClientOverTimeEntry;

  factory ClientOverTimeEntry.fromJson(Map<String, dynamic> json) =>
      _$ClientOverTimeEntryFromJson(json);
}
