// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_domains_allowed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseDomainsAllowedCWProxy {
  FtlFtlDatabaseDomainsAllowed total(int? total);

  FtlFtlDatabaseDomainsAllowed enabled(int? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomainsAllowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomainsAllowed(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomainsAllowed call({int? total, int? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseDomainsAllowed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseDomainsAllowed.copyWith.fieldName(...)`
class _$FtlFtlDatabaseDomainsAllowedCWProxyImpl
    implements _$FtlFtlDatabaseDomainsAllowedCWProxy {
  const _$FtlFtlDatabaseDomainsAllowedCWProxyImpl(this._value);

  final FtlFtlDatabaseDomainsAllowed _value;

  @override
  FtlFtlDatabaseDomainsAllowed total(int? total) => this(total: total);

  @override
  FtlFtlDatabaseDomainsAllowed enabled(int? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomainsAllowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomainsAllowed(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomainsAllowed call({
    Object? total = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseDomainsAllowed(
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as int?,
      enabled: enabled == const $CopyWithPlaceholder()
          ? _value.enabled
          // ignore: cast_nullable_to_non_nullable
          : enabled as int?,
    );
  }
}

extension $FtlFtlDatabaseDomainsAllowedCopyWith
    on FtlFtlDatabaseDomainsAllowed {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseDomainsAllowed.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseDomainsAllowed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseDomainsAllowedCWProxy get copyWith =>
      _$FtlFtlDatabaseDomainsAllowedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseDomainsAllowed _$FtlFtlDatabaseDomainsAllowedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FtlFtlDatabaseDomainsAllowed', json, ($checkedConvert) {
  final val = FtlFtlDatabaseDomainsAllowed(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    enabled: $checkedConvert('enabled', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$FtlFtlDatabaseDomainsAllowedToJson(
  FtlFtlDatabaseDomainsAllowed instance,
) => <String, dynamic>{'total': ?instance.total, 'enabled': ?instance.enabled};
