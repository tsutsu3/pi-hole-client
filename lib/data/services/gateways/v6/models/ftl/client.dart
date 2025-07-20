import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
sealed class Client with _$Client {
  const factory Client({
    @JsonKey(name: 'remote_addr') required String remoteAddr,
    @JsonKey(name: 'http_version') required String httpVersion,
    required String method,
    required List<Header> headers,
    required double took,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
sealed class Header with _$Header {
  const factory Header({
    required String name,
    required String value,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}
