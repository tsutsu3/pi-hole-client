// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unauthorized.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnauthorizedCWProxy {
  Unauthorized error(UnauthorizedError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Unauthorized(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Unauthorized(...).copyWith(id: 12, name: "My name")
  /// ````
  Unauthorized call({UnauthorizedError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnauthorized.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnauthorized.copyWith.fieldName(...)`
class _$UnauthorizedCWProxyImpl implements _$UnauthorizedCWProxy {
  const _$UnauthorizedCWProxyImpl(this._value);

  final Unauthorized _value;

  @override
  Unauthorized error(UnauthorizedError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Unauthorized(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Unauthorized(...).copyWith(id: 12, name: "My name")
  /// ````
  Unauthorized call({Object? error = const $CopyWithPlaceholder()}) {
    return Unauthorized(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as UnauthorizedError?,
    );
  }
}

extension $UnauthorizedCopyWith on Unauthorized {
  /// Returns a callable class that can be used as follows: `instanceOfUnauthorized.copyWith(...)` or like so:`instanceOfUnauthorized.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnauthorizedCWProxy get copyWith => _$UnauthorizedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unauthorized _$UnauthorizedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Unauthorized', json, ($checkedConvert) {
      final val = Unauthorized(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : UnauthorizedError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UnauthorizedToJson(Unauthorized instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
