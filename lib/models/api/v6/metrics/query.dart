import 'package:freezed_annotation/freezed_annotation.dart';

part 'query.freezed.dart';
part 'query.g.dart';

@freezed
class Queries with _$Queries {
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
class Query with _$Query {
  const factory Query({
    required int id,
    required double time,
    required String type,
    required String domain,
    required Client client,
    required Reply reply,
    String? cname,
    String? status,
    String? dnssec,
    @JsonKey(name: 'list_id') int? listId,
    String? upstream,
  }) = _Query;

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
}

@freezed
class Client with _$Client {
  const factory Client({
    required String ip,
    String? name,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
class Reply with _$Reply {
  const factory Reply({
    required double time,
    String? type,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}
