import 'package:freezed_annotation/freezed_annotation.dart';

part 'managed_client.freezed.dart';
part 'managed_client.g.dart';

/// A client entry managed by Pi-hole's group management system.
///
/// Represents a device (identified by IP address, MAC address, or hostname)
/// that has been explicitly registered in Pi-hole for per-client blocking
/// policy via group assignments.
@freezed
sealed class ManagedClient with _$ManagedClient {
  const factory ManagedClient({
    required int id,
    required String client,
    required List<int> groups,
    required DateTime dateAdded,
    required DateTime dateModified,
    String? name,
    String? comment,
  }) = _ManagedClient;

  factory ManagedClient.fromJson(Map<String, dynamic> json) =>
      _$ManagedClientFromJson(json);
}
