// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invalid_zip.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$InvalidZipCWProxy {
  InvalidZip error(InvalidZipError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvalidZip(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvalidZip(...).copyWith(id: 12, name: "My name")
  /// ````
  InvalidZip call({InvalidZipError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfInvalidZip.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfInvalidZip.copyWith.fieldName(...)`
class _$InvalidZipCWProxyImpl implements _$InvalidZipCWProxy {
  const _$InvalidZipCWProxyImpl(this._value);

  final InvalidZip _value;

  @override
  InvalidZip error(InvalidZipError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `InvalidZip(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// InvalidZip(...).copyWith(id: 12, name: "My name")
  /// ````
  InvalidZip call({Object? error = const $CopyWithPlaceholder()}) {
    return InvalidZip(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as InvalidZipError?,
    );
  }
}

extension $InvalidZipCopyWith on InvalidZip {
  /// Returns a callable class that can be used as follows: `instanceOfInvalidZip.copyWith(...)` or like so:`instanceOfInvalidZip.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$InvalidZipCWProxy get copyWith => _$InvalidZipCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvalidZip _$InvalidZipFromJson(Map<String, dynamic> json) =>
    $checkedCreate('InvalidZip', json, ($checkedConvert) {
      final val = InvalidZip(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : InvalidZipError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$InvalidZipToJson(InvalidZip instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
