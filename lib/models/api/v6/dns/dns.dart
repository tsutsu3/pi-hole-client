import 'package:freezed_annotation/freezed_annotation.dart';

part 'dns.freezed.dart';
part 'dns.g.dart';

@freezed
class Blocking with _$Blocking {
  factory Blocking({
    required String blocking,
    required int? timer,
    required double took,
  }) = _Blocking;

  factory Blocking.fromJson(Map<String, dynamic> json) =>
      _$BlockingFromJson(json);
}
