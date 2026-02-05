// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forbidden.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ForbiddenCWProxy {
  Forbidden error(ForbiddenError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Forbidden(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Forbidden(...).copyWith(id: 12, name: "My name")
  /// ````
  Forbidden call({ForbiddenError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfForbidden.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfForbidden.copyWith.fieldName(...)`
class _$ForbiddenCWProxyImpl implements _$ForbiddenCWProxy {
  const _$ForbiddenCWProxyImpl(this._value);

  final Forbidden _value;

  @override
  Forbidden error(ForbiddenError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Forbidden(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Forbidden(...).copyWith(id: 12, name: "My name")
  /// ````
  Forbidden call({Object? error = const $CopyWithPlaceholder()}) {
    return Forbidden(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as ForbiddenError?,
    );
  }
}

extension $ForbiddenCopyWith on Forbidden {
  /// Returns a callable class that can be used as follows: `instanceOfForbidden.copyWith(...)` or like so:`instanceOfForbidden.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ForbiddenCWProxy get copyWith => _$ForbiddenCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forbidden _$ForbiddenFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Forbidden', json, ($checkedConvert) {
      final val = Forbidden(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : ForbiddenError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ForbiddenToJson(Forbidden instance) => <String, dynamic>{
  'error': ?instance.error?.toJson(),
};
