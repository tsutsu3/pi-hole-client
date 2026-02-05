// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_history_clients_value.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientHistoryClientsValueCWProxy {
  ClientHistoryClientsValue name(String? name);

  ClientHistoryClientsValue total(int? total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistoryClientsValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistoryClientsValue(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistoryClientsValue call({String? name, int? total});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientHistoryClientsValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientHistoryClientsValue.copyWith.fieldName(...)`
class _$ClientHistoryClientsValueCWProxyImpl
    implements _$ClientHistoryClientsValueCWProxy {
  const _$ClientHistoryClientsValueCWProxyImpl(this._value);

  final ClientHistoryClientsValue _value;

  @override
  ClientHistoryClientsValue name(String? name) => this(name: name);

  @override
  ClientHistoryClientsValue total(int? total) => this(total: total);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistoryClientsValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistoryClientsValue(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistoryClientsValue call({
    Object? name = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return ClientHistoryClientsValue(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
    );
  }
}

extension $ClientHistoryClientsValueCopyWith on ClientHistoryClientsValue {
  /// Returns a callable class that can be used as follows: `instanceOfClientHistoryClientsValue.copyWith(...)` or like so:`instanceOfClientHistoryClientsValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientHistoryClientsValueCWProxy get copyWith =>
      _$ClientHistoryClientsValueCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientHistoryClientsValue _$ClientHistoryClientsValueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientHistoryClientsValue', json, ($checkedConvert) {
  final val = ClientHistoryClientsValue(
    name: $checkedConvert('name', (v) => v as String?),
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$ClientHistoryClientsValueToJson(
  ClientHistoryClientsValue instance,
) => <String, dynamic>{'name': ?instance.name, 'total': ?instance.total};
