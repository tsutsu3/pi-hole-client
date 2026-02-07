// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_payload.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NoPayloadCWProxy {
  NoPayload error(NoPayloadError? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NoPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NoPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  NoPayload call({NoPayloadError? error});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNoPayload.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNoPayload.copyWith.fieldName(...)`
class _$NoPayloadCWProxyImpl implements _$NoPayloadCWProxy {
  const _$NoPayloadCWProxyImpl(this._value);

  final NoPayload _value;

  @override
  NoPayload error(NoPayloadError? error) => this(error: error);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NoPayload(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NoPayload(...).copyWith(id: 12, name: "My name")
  /// ````
  NoPayload call({Object? error = const $CopyWithPlaceholder()}) {
    return NoPayload(
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as NoPayloadError?,
    );
  }
}

extension $NoPayloadCopyWith on NoPayload {
  /// Returns a callable class that can be used as follows: `instanceOfNoPayload.copyWith(...)` or like so:`instanceOfNoPayload.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NoPayloadCWProxy get copyWith => _$NoPayloadCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoPayload _$NoPayloadFromJson(Map<String, dynamic> json) =>
    $checkedCreate('NoPayload', json, ($checkedConvert) {
      final val = NoPayload(
        error: $checkedConvert(
          'error',
          (v) => v == null
              ? null
              : NoPayloadError.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NoPayloadToJson(NoPayload instance) => <String, dynamic>{
  'error': ?instance.error?.toJson(),
};
