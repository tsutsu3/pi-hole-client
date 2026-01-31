import 'package:freezed_annotation/freezed_annotation.dart';

part 'dns.freezed.dart';
part 'dns.g.dart';

@freezed
sealed class Blocking with _$Blocking {
  const factory Blocking({required String status}) = _Blocking;

  factory Blocking.fromJson(Map<String, dynamic> json) =>
      _$BlockingFromJson(json);
}
