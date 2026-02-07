// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_clients.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueriesClientsCWProxy {
  QueriesClients active(int? active);

  QueriesClients total(int? total);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesClients(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesClients call({int? active, int? total});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueriesClients.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueriesClients.copyWith.fieldName(...)`
class _$QueriesClientsCWProxyImpl implements _$QueriesClientsCWProxy {
  const _$QueriesClientsCWProxyImpl(this._value);

  final QueriesClients _value;

  @override
  QueriesClients active(int? active) => this(active: active);

  @override
  QueriesClients total(int? total) => this(total: total);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesClients(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesClients call({
    Object? active = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
  }) {
    return QueriesClients(
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as int?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
    );
  }
}

extension $QueriesClientsCopyWith on QueriesClients {
  /// Returns a callable class that can be used as follows: `instanceOfQueriesClients.copyWith(...)` or like so:`instanceOfQueriesClients.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueriesClientsCWProxy get copyWith => _$QueriesClientsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesClients _$QueriesClientsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('QueriesClients', json, ($checkedConvert) {
      final val = QueriesClients(
        active: $checkedConvert('active', (v) => (v as num?)?.toInt()),
        total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$QueriesClientsToJson(QueriesClients instance) =>
    <String, dynamic>{'active': ?instance.active, 'total': ?instance.total};
