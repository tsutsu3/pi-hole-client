import 'package:freezed_annotation/freezed_annotation.dart';

part 'ftl.freezed.dart';
part 'ftl.g.dart';

@freezed
sealed class InfoFtl with _$InfoFtl {
  @JsonSerializable(explicitToJson: true)
  const factory InfoFtl({required int privacyLevel}) = _InfoFtl;

  factory InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);
}
