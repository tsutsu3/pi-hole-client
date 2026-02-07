// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SuccessCWProxy {
  Success status(String? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Success(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Success(...).copyWith(id: 12, name: "My name")
  /// ````
  Success call({String? status});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSuccess.copyWith.fieldName(...)`
class _$SuccessCWProxyImpl implements _$SuccessCWProxy {
  const _$SuccessCWProxyImpl(this._value);

  final Success _value;

  @override
  Success status(String? status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Success(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Success(...).copyWith(id: 12, name: "My name")
  /// ````
  Success call({Object? status = const $CopyWithPlaceholder()}) {
    return Success(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String?,
    );
  }
}

extension $SuccessCopyWith on Success {
  /// Returns a callable class that can be used as follows: `instanceOfSuccess.copyWith(...)` or like so:`instanceOfSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SuccessCWProxy get copyWith => _$SuccessCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Success _$SuccessFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Success',
  json,
  ($checkedConvert) {
    final val = Success(status: $checkedConvert('status', (v) => v as String?));
    return val;
  },
);

Map<String, dynamic> _$SuccessToJson(Success instance) => <String, dynamic>{
  'status': ?instance.status,
};
