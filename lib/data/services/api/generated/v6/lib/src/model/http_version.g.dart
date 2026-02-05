// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_version.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HttpVersionCWProxy {
  HttpVersion httpVersion(String? httpVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HttpVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HttpVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  HttpVersion call({String? httpVersion});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHttpVersion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHttpVersion.copyWith.fieldName(...)`
class _$HttpVersionCWProxyImpl implements _$HttpVersionCWProxy {
  const _$HttpVersionCWProxyImpl(this._value);

  final HttpVersion _value;

  @override
  HttpVersion httpVersion(String? httpVersion) =>
      this(httpVersion: httpVersion);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HttpVersion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HttpVersion(...).copyWith(id: 12, name: "My name")
  /// ````
  HttpVersion call({Object? httpVersion = const $CopyWithPlaceholder()}) {
    return HttpVersion(
      httpVersion: httpVersion == const $CopyWithPlaceholder()
          ? _value.httpVersion
          // ignore: cast_nullable_to_non_nullable
          : httpVersion as String?,
    );
  }
}

extension $HttpVersionCopyWith on HttpVersion {
  /// Returns a callable class that can be used as follows: `instanceOfHttpVersion.copyWith(...)` or like so:`instanceOfHttpVersion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HttpVersionCWProxy get copyWith => _$HttpVersionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HttpVersion _$HttpVersionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HttpVersion', json, ($checkedConvert) {
      final val = HttpVersion(
        httpVersion: $checkedConvert('http_version', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'httpVersion': 'http_version'});

Map<String, dynamic> _$HttpVersionToJson(HttpVersion instance) =>
    <String, dynamic>{'http_version': ?instance.httpVersion};
