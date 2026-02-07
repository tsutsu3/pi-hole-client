// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_bad_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorsBadRequestCWProxy {
  ErrorsBadRequest error(ErrorsBadRequestError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorsBadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorsBadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorsBadRequest call({ErrorsBadRequestError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorsBadRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorsBadRequest.copyWith.fieldName(...)`
class _$ErrorsBadRequestCWProxyImpl implements _$ErrorsBadRequestCWProxy {
  const _$ErrorsBadRequestCWProxyImpl(this._value);

  final ErrorsBadRequest _value;

  @override
  ErrorsBadRequest error(ErrorsBadRequestError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorsBadRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorsBadRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorsBadRequest call({Object? error = const $CopyWithPlaceholder()}) {
    return ErrorsBadRequest(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ErrorsBadRequestError?,
    );
  }
}

extension $ErrorsBadRequestCopyWith on ErrorsBadRequest {
  /// Returns a callable class that can be used as follows: `instanceOfErrorsBadRequest.copyWith(...)` or like so:`instanceOfErrorsBadRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorsBadRequestCWProxy get copyWith => _$ErrorsBadRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorsBadRequest _$ErrorsBadRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorsBadRequest', json, ($checkedConvert) {
      final val = ErrorsBadRequest(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : ErrorsBadRequestError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ErrorsBadRequestToJson(ErrorsBadRequest instance) =>
    <String, dynamic>{'error': ?instance.error?.toJson()};
