// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_clients.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlClientsCWProxy {
  FtlFtlClients total(int? total);

  FtlFtlClients active(int? active);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlClients(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlClients call({int? total, int? active});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlClients.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlClients.copyWith.fieldName(...)`
class _$FtlFtlClientsCWProxyImpl implements _$FtlFtlClientsCWProxy {
  const _$FtlFtlClientsCWProxyImpl(this._value);

  final FtlFtlClients _value;

  @override
  FtlFtlClients total(int? total) => this(total: total);

  @override
  FtlFtlClients active(int? active) => this(active: active);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlClients(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlClients call({
    Object? total = const $CopyWithPlaceholder(),
    Object? active = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlClients(
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as int?,
    );
  }
}

extension $FtlFtlClientsCopyWith on FtlFtlClients {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlClients.copyWith(...)` or like so:`instanceOfFtlFtlClients.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlClientsCWProxy get copyWith => _$FtlFtlClientsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlClients _$FtlFtlClientsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FtlFtlClients', json, ($checkedConvert) {
      final val = FtlFtlClients(
        total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
        active: $checkedConvert('active', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$FtlFtlClientsToJson(FtlFtlClients instance) =>
    <String, dynamic>{'total': ?instance.total, 'active': ?instance.active};
