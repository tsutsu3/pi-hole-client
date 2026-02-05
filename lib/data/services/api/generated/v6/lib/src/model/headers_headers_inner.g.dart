// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headers_headers_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HeadersHeadersInnerCWProxy {
  HeadersHeadersInner name(String? name);

  HeadersHeadersInner value(String? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeadersHeadersInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeadersHeadersInner(...).copyWith(id: 12, name: "My name")
  /// ````
  HeadersHeadersInner call({String? name, String? value});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHeadersHeadersInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHeadersHeadersInner.copyWith.fieldName(...)`
class _$HeadersHeadersInnerCWProxyImpl implements _$HeadersHeadersInnerCWProxy {
  const _$HeadersHeadersInnerCWProxyImpl(this._value);

  final HeadersHeadersInner _value;

  @override
  HeadersHeadersInner name(String? name) => this(name: name);

  @override
  HeadersHeadersInner value(String? value) => this(value: value);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HeadersHeadersInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HeadersHeadersInner(...).copyWith(id: 12, name: "My name")
  /// ````
  HeadersHeadersInner call({
    Object? name = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return HeadersHeadersInner(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
    );
  }
}

extension $HeadersHeadersInnerCopyWith on HeadersHeadersInner {
  /// Returns a callable class that can be used as follows: `instanceOfHeadersHeadersInner.copyWith(...)` or like so:`instanceOfHeadersHeadersInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HeadersHeadersInnerCWProxy get copyWith =>
      _$HeadersHeadersInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadersHeadersInner _$HeadersHeadersInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HeadersHeadersInner', json, ($checkedConvert) {
      final val = HeadersHeadersInner(
        name: $checkedConvert('name', (v) => v as String?),
        value: $checkedConvert('value', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HeadersHeadersInnerToJson(
  HeadersHeadersInner instance,
) => <String, dynamic>{'name': ?instance.name, 'value': ?instance.value};
