import 'package:freezed_annotation/freezed_annotation.dart';

part 'ftl.freezed.dart';
part 'ftl.g.dart';

@freezed
sealed class InfoFtl with _$InfoFtl {
  @JsonSerializable(explicitToJson: true)
  const factory InfoFtl({
    required int privacyLevel,
    // v6-only fields
    int? pid,
    double? uptime,
    double? percentMem,
    double? percentCpu,
    double? queryFrequency,
    bool? allowDestructive,
    FtlDatabase? database,
    FtlClients? clients,
  }) = _InfoFtl;

  factory InfoFtl.fromJson(Map<String, dynamic> json) =>
      _$InfoFtlFromJson(json);
}

@freezed
sealed class FtlDatabase with _$FtlDatabase {
  const factory FtlDatabase({
    required int gravityDomains,
    required int allowedExact,
    required int allowedRegex,
    required int deniedExact,
    required int deniedRegex,
  }) = _FtlDatabase;

  factory FtlDatabase.fromJson(Map<String, dynamic> json) =>
      _$FtlDatabaseFromJson(json);
}

@freezed
sealed class FtlClients with _$FtlClients {
  const factory FtlClients({
    required int total,
    required int active,
  }) = _FtlClients;

  factory FtlClients.fromJson(Map<String, dynamic> json) =>
      _$FtlClientsFromJson(json);
}
