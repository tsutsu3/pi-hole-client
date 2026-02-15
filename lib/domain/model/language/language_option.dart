import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_option.freezed.dart';

@freezed
sealed class LanguageOption with _$LanguageOption {
  const factory LanguageOption({
    required String key,
    required int index,
    required String displayName,
  }) = _LanguageOption;
}
