import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/config/enums.dart';

part 'dns.freezed.dart';
part 'dns.g.dart';

@freezed
sealed class Blocking with _$Blocking {
  factory Blocking({
    required DnsBlockingStatus status,
    required int? timer,
    required double took,
  }) = _Blocking;

  factory Blocking.fromJson(Map<String, dynamic> json) =>
      _$BlockingFromJson(json);
}
