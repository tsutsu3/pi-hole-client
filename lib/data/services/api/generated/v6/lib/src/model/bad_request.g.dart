// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bad_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BadRequestCWProxy {
  BadRequest error(BadRequestError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  BadRequest call({BadRequestError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBadRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBadRequest.copyWith.fieldName(...)`
class _$BadRequestCWProxyImpl implements _$BadRequestCWProxy {
  const _$BadRequestCWProxyImpl(this._value);

  final BadRequest _value;

  @override
  BadRequest error(BadRequestError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  BadRequest call({Object? error = const $CopyWithPlaceholder()}) {
    return BadRequest(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as BadRequestError?,
    );
  }
}

extension $BadRequestCopyWith on BadRequest {
  /// Returns a callable class that can be used as follows: `instanceOfBadRequest.copyWith(...)` or like so:`instanceOfBadRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BadRequestCWProxy get copyWith => _$BadRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadRequest _$BadRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('BadRequest', json, ($checkedConvert) {
      final val = BadRequest(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : BadRequestError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$BadRequestToJson(BadRequest instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
