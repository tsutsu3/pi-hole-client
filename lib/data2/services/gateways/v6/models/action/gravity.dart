import 'package:freezed_annotation/freezed_annotation.dart';

part 'gravity.freezed.dart';
part 'gravity.g.dart';

@freezed
sealed class Gravity with _$Gravity {
  const factory Gravity({
    @Default([]) List<GravityEntry> entries,
  }) = _Gravity;

  factory Gravity.fromJson(Map<String, dynamic> json) =>
      _$GravityFromJson(json);
}

@freezed
sealed class GravityEntry with _$GravityEntry {
  const factory GravityEntry({
    required String message,
  }) = _GravityEntry;

  factory GravityEntry.fromJson(Map<String, dynamic> json) =>
      _$GravityEntryFromJson(json);
}
