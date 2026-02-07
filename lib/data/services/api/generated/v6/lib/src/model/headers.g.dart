// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headers.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HeadersCWProxy {
  Headers headers(List<HeadersHeadersInner>? headers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Headers(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Headers(...).copyWith(id: 12, name: "My name")
  /// ````
  Headers call({List<HeadersHeadersInner>? headers});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHeaders.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHeaders.copyWith.fieldName(...)`
class _$HeadersCWProxyImpl implements _$HeadersCWProxy {
  const _$HeadersCWProxyImpl(this._value);

  final Headers _value;

  @override
  Headers headers(List<HeadersHeadersInner>? headers) => this(headers: headers);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Headers(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Headers(...).copyWith(id: 12, name: "My name")
  /// ````
  Headers call({Object? headers = const $CopyWithPlaceholder()}) {
    return Headers(
      headers: headers == const $CopyWithPlaceholder()
          ? _value.headers
          // ignore: cast_nullable_to_non_nullable
          : headers as List<HeadersHeadersInner>?,
    );
  }
}

extension $HeadersCopyWith on Headers {
  /// Returns a callable class that can be used as follows: `instanceOfHeaders.copyWith(...)` or like so:`instanceOfHeaders.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HeadersCWProxy get copyWith => _$HeadersCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headers _$HeadersFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Headers', json, ($checkedConvert) {
      final val = Headers(
        headers: $checkedConvert(
          'headers',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => HeadersHeadersInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
  'headers': ?instance.headers?.map((e) => e.toJson()).toList(),
};
