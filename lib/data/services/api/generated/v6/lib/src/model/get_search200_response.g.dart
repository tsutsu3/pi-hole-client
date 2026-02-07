// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetSearch200ResponseCWProxy {
  GetSearch200Response search(SearchSearch? search);

  GetSearch200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSearch200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSearch200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSearch200Response call({SearchSearch? search, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetSearch200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetSearch200Response.copyWith.fieldName(...)`
class _$GetSearch200ResponseCWProxyImpl
    implements _$GetSearch200ResponseCWProxy {
  const _$GetSearch200ResponseCWProxyImpl(this._value);

  final GetSearch200Response _value;

  @override
  GetSearch200Response search(SearchSearch? search) => this(search: search);

  @override
  GetSearch200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetSearch200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetSearch200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetSearch200Response call({
    Object? search = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetSearch200Response(
      search: search == const $CopyWithPlaceholder()
          ? _value.search
          // ignore: cast_nullable_to_non_nullable
          : search as SearchSearch?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetSearch200ResponseCopyWith on GetSearch200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetSearch200Response.copyWith(...)` or like so:`instanceOfGetSearch200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetSearch200ResponseCWProxy get copyWith =>
      _$GetSearch200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearch200Response _$GetSearch200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetSearch200Response', json, ($checkedConvert) {
  final val = GetSearch200Response(
    search: $checkedConvert(
      'search',
      (v) =>
          v == null ? null : SearchSearch.fromJson(v as Map<String, dynamic>),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetSearch200ResponseToJson(
  GetSearch200Response instance,
) => <String, dynamic>{
  'search': ?instance.search?.toJson(),
  'took': ?instance.took,
};
