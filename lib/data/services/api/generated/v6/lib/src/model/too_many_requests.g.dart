// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'too_many_requests.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TooManyRequestsCWProxy {
  TooManyRequests error(TooManyRequestsError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TooManyRequests(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TooManyRequests(...).copyWith(id: 12, name: "My name")
  /// ````
  TooManyRequests call({TooManyRequestsError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTooManyRequests.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTooManyRequests.copyWith.fieldName(...)`
class _$TooManyRequestsCWProxyImpl implements _$TooManyRequestsCWProxy {
  const _$TooManyRequestsCWProxyImpl(this._value);

  final TooManyRequests _value;

  @override
  TooManyRequests error(TooManyRequestsError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TooManyRequests(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TooManyRequests(...).copyWith(id: 12, name: "My name")
  /// ````
  TooManyRequests call({Object? error = const $CopyWithPlaceholder()}) {
    return TooManyRequests(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as TooManyRequestsError?,
    );
  }
}

extension $TooManyRequestsCopyWith on TooManyRequests {
  /// Returns a callable class that can be used as follows: `instanceOfTooManyRequests.copyWith(...)` or like so:`instanceOfTooManyRequests.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TooManyRequestsCWProxy get copyWith => _$TooManyRequestsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TooManyRequests _$TooManyRequestsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TooManyRequests', json, ($checkedConvert) {
      final val = TooManyRequests(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : TooManyRequestsError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TooManyRequestsToJson(TooManyRequests instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
