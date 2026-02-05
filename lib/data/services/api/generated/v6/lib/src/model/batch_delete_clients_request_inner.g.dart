// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_delete_clients_request_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BatchDeleteClientsRequestInnerCWProxy {
  BatchDeleteClientsRequestInner item(String item);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteClientsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteClientsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteClientsRequestInner call({String item});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBatchDeleteClientsRequestInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBatchDeleteClientsRequestInner.copyWith.fieldName(...)`
class _$BatchDeleteClientsRequestInnerCWProxyImpl
    implements _$BatchDeleteClientsRequestInnerCWProxy {
  const _$BatchDeleteClientsRequestInnerCWProxyImpl(this._value);

  final BatchDeleteClientsRequestInner _value;

  @override
  BatchDeleteClientsRequestInner item(String item) => this(item: item);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BatchDeleteClientsRequestInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BatchDeleteClientsRequestInner(...).copyWith(id: 12, name: "My name")
  /// ````
  BatchDeleteClientsRequestInner call({
    Object? item = const $CopyWithPlaceholder(),
  }) {
    return BatchDeleteClientsRequestInner(
      item: item == const $CopyWithPlaceholder()
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as String,
    );
  }
}

extension $BatchDeleteClientsRequestInnerCopyWith
    on BatchDeleteClientsRequestInner {
  /// Returns a callable class that can be used as follows: `instanceOfBatchDeleteClientsRequestInner.copyWith(...)` or like so:`instanceOfBatchDeleteClientsRequestInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BatchDeleteClientsRequestInnerCWProxy get copyWith =>
      _$BatchDeleteClientsRequestInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchDeleteClientsRequestInner _$BatchDeleteClientsRequestInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BatchDeleteClientsRequestInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['item']);
  final val = BatchDeleteClientsRequestInner(
    item: $checkedConvert('item', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$BatchDeleteClientsRequestInnerToJson(
  BatchDeleteClientsRequestInner instance,
) => <String, dynamic>{'item': instance.item};
