import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_clients.freezed.dart';
part 'top_clients.g.dart';

// @freezed
// sealed class TopClients with _$TopClients {
//   const factory TopClients({
//     required List<SourceStat> topSources,
//     required List<SourceStat> topSourcesBlocked,
//   }) = _TopClients;

//   factory TopClients.fromJson(Map<String, dynamic> json) =>
//       _$TopClientsFromJson(json);
// }

@freezed
sealed class SourceStat with _$SourceStat {
  const factory SourceStat({required String source, required int count}) =
      _SourceStat;

  factory SourceStat.fromJson(Map<String, dynamic> json) =>
      _$SourceStatFromJson(json);
}
