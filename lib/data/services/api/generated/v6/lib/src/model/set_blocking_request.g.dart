// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_blocking_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetBlockingRequestCWProxy {
  SetBlockingRequest blocking(bool? blocking);

  SetBlockingRequest timer(num? timer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetBlockingRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetBlockingRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetBlockingRequest call({bool? blocking, num? timer});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetBlockingRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetBlockingRequest.copyWith.fieldName(...)`
class _$SetBlockingRequestCWProxyImpl implements _$SetBlockingRequestCWProxy {
  const _$SetBlockingRequestCWProxyImpl(this._value);

  final SetBlockingRequest _value;

  @override
  SetBlockingRequest blocking(bool? blocking) => this(blocking: blocking);

  @override
  SetBlockingRequest timer(num? timer) => this(timer: timer);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetBlockingRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetBlockingRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetBlockingRequest call({
    Object? blocking = const $CopyWithPlaceholder(),
    Object? timer = const $CopyWithPlaceholder(),
  }) {
    return SetBlockingRequest(
      blocking: blocking == const $CopyWithPlaceholder()
          ? _value.blocking
          // ignore: cast_nullable_to_non_nullable
          : blocking as bool?,
      timer: timer == const $CopyWithPlaceholder()
          ? _value.timer
          // ignore: cast_nullable_to_non_nullable
          : timer as num?,
    );
  }
}

extension $SetBlockingRequestCopyWith on SetBlockingRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSetBlockingRequest.copyWith(...)` or like so:`instanceOfSetBlockingRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetBlockingRequestCWProxy get copyWith =>
      _$SetBlockingRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetBlockingRequest _$SetBlockingRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SetBlockingRequest', json, ($checkedConvert) {
      final val = SetBlockingRequest(
        blocking: $checkedConvert('blocking', (v) => v as bool? ?? true),
        timer: $checkedConvert('timer', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$SetBlockingRequestToJson(SetBlockingRequest instance) =>
    <String, dynamic>{'blocking': ?instance.blocking, 'timer': ?instance.timer};
