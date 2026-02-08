import 'package:freezed_annotation/freezed_annotation.dart';

part 'pihole_client.freezed.dart';
part 'pihole_client.g.dart';

@freezed
sealed class PiholeClient with _$PiholeClient {
  const factory PiholeClient({
    required int id,
    required String client,
    required List<int> groups,
    required DateTime dateAdded,
    required DateTime dateModified,
    String? name,
    String? comment,
  }) = _PiholeClient;

  factory PiholeClient.fromJson(Map<String, dynamic> json) =>
      _$PiholeClientFromJson(json);
}
