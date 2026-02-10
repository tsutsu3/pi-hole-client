import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
sealed class FtlClient with _$FtlClient {
  const factory FtlClient({required String addr}) = _FtlClient;

  factory FtlClient.fromJson(Map<String, dynamic> json) =>
      _$FtlClientFromJson(json);
}
