import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
sealed class InfoClient with _$InfoClient {
  const factory InfoClient({required String addr}) = _InfoClient;

  factory InfoClient.fromJson(Map<String, dynamic> json) =>
      _$InfoClientFromJson(json);
}
