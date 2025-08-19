import 'package:freezed_annotation/freezed_annotation.dart';

part 'query.freezed.dart';
part 'query.g.dart';

@freezed
sealed class Queries with _$Queries {
  @JsonSerializable(explicitToJson: true)
  const factory Queries({
    required List<Query> queries,
    required int cursor,
    required int recordsTotal,
    required int recordsFiltered,
    required int draw,
    required double took,
  }) = _Queries;

  factory Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);
}

@freezed
sealed class Query with _$Query {
  @JsonSerializable(explicitToJson: true)
  const factory Query({
    required int id,
    required double time,
    required String type,
    required String domain,
    required QueryClient client,
    required Reply reply,
    required Ede ede,
    String? cname,
    String? status,
    String? dnssec,
    @JsonKey(name: 'list_id') int? listId,
    String? upstream,
  }) = _Query;

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
}

@freezed
sealed class QueryClient with _$QueryClient {
  const factory QueryClient({required String ip, String? name}) = _QueryClient;

  factory QueryClient.fromJson(Map<String, dynamic> json) =>
      _$QueryClientFromJson(json);
}

@freezed
sealed class Reply with _$Reply {
  const factory Reply({required double time, String? type}) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}

@freezed
sealed class Ede with _$Ede {
  const factory Ede({required int code, String? text}) = _Ede;

  factory Ede.fromJson(Map<String, dynamic> json) => _$EdeFromJson(json);
}
