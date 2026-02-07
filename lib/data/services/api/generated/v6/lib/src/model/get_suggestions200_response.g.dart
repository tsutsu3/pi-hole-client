// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_suggestions200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetSuggestions200ResponseCWProxy {
  GetSuggestions200Response suggestions(SuggestionsSuggestions? suggestions);

  GetSuggestions200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSuggestions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSuggestions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSuggestions200Response call({
    SuggestionsSuggestions? suggestions,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetSuggestions200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetSuggestions200Response.copyWith.fieldName(...)`
class _$GetSuggestions200ResponseCWProxyImpl
    implements _$GetSuggestions200ResponseCWProxy {
  const _$GetSuggestions200ResponseCWProxyImpl(this._value);

  final GetSuggestions200Response _value;

  @override
  GetSuggestions200Response suggestions(SuggestionsSuggestions? suggestions) =>
      this(suggestions: suggestions);

  @override
  GetSuggestions200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSuggestions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSuggestions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSuggestions200Response call({
    Object? suggestions = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetSuggestions200Response(
      suggestions: suggestions == const $CopyWithPlaceholder()
          ? _value.suggestions
          // ignore: cast_nullable_to_non_nullable
          : suggestions as SuggestionsSuggestions?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetSuggestions200ResponseCopyWith on GetSuggestions200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetSuggestions200Response.copyWith(...)` or like so:`instanceOfGetSuggestions200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetSuggestions200ResponseCWProxy get copyWith =>
      _$GetSuggestions200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSuggestions200Response _$GetSuggestions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetSuggestions200Response', json, ($checkedConvert) {
  final val = GetSuggestions200Response(
    suggestions: $checkedConvert(
      'suggestions',
      (v) => v == null
          ? null
          : SuggestionsSuggestions.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetSuggestions200ResponseToJson(
  GetSuggestions200Response instance,
) => <String, dynamic>{
  'suggestions': ?instance.suggestions?.toJson(),
  'took': ?instance.took,
};
