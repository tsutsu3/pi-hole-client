import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/data/services/api/model/v5/json_converter.dart';

part 'queries.freezed.dart';
part 'queries.g.dart';

@freezed
sealed class Queries with _$Queries {
  const factory Queries({
    @ListOfListStringOrEmptyConverter() required List<List<String>> data,
  }) = _Queries;

  factory Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);
}
