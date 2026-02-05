// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestions.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SuggestionsCWProxy {
  Suggestions suggestions(SuggestionsSuggestions? suggestions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Suggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Suggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  Suggestions call({SuggestionsSuggestions? suggestions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuggestions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuggestions.copyWith.fieldName(...)`
class _$SuggestionsCWProxyImpl implements _$SuggestionsCWProxy {
  const _$SuggestionsCWProxyImpl(this._value);

  final Suggestions _value;

  @override
  Suggestions suggestions(SuggestionsSuggestions? suggestions) =>
      this(suggestions: suggestions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Suggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Suggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  Suggestions call({Object? suggestions = const $CopyWithPlaceholder()}) {
    return Suggestions(
      suggestions: suggestions == const $CopyWithPlaceholder()
          ? _value.suggestions
          // ignore: cast_nullable_to_non_nullable
          : suggestions as SuggestionsSuggestions?,
    );
  }
}

extension $SuggestionsCopyWith on Suggestions {
  /// Returns a callable class that can be used as follows: `instanceOfSuggestions.copyWith(...)` or like so:`instanceOfSuggestions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuggestionsCWProxy get copyWith => _$SuggestionsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suggestions _$SuggestionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Suggestions', json, ($checkedConvert) {
      final val = Suggestions(
        suggestions: $checkedConvert(
          'suggestions',
          (v) => v == null
              ? null
              : SuggestionsSuggestions.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SuggestionsToJson(Suggestions instance) =>
    <String, dynamic>{'suggestions': ?instance.suggestions?.toJson()};
