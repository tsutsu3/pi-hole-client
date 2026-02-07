// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_domains_denied.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseDomainsDeniedCWProxy {
  FtlFtlDatabaseDomainsDenied total(int? total);

  FtlFtlDatabaseDomainsDenied enabled(int? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomainsDenied(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomainsDenied(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomainsDenied call({int? total, int? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseDomainsDenied.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseDomainsDenied.copyWith.fieldName(...)`
class _$FtlFtlDatabaseDomainsDeniedCWProxyImpl
    implements _$FtlFtlDatabaseDomainsDeniedCWProxy {
  const _$FtlFtlDatabaseDomainsDeniedCWProxyImpl(this._value);

  final FtlFtlDatabaseDomainsDenied _value;

  @override
  FtlFtlDatabaseDomainsDenied total(int? total) => this(total: total);

  @override
  FtlFtlDatabaseDomainsDenied enabled(int? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomainsDenied(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomainsDenied(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomainsDenied call({
    Object? total = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseDomainsDenied(
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

extension $FtlFtlDatabaseDomainsDeniedCopyWith on FtlFtlDatabaseDomainsDenied {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseDomainsDenied.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseDomainsDenied.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseDomainsDeniedCWProxy get copyWith =>
      _$FtlFtlDatabaseDomainsDeniedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseDomainsDenied _$FtlFtlDatabaseDomainsDeniedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FtlFtlDatabaseDomainsDenied', json, ($checkedConvert) {
  final val = FtlFtlDatabaseDomainsDenied(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    enabled: $checkedConvert('enabled', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$FtlFtlDatabaseDomainsDeniedToJson(
  FtlFtlDatabaseDomainsDenied instance,
) => <String, dynamic>{'total': ?instance.total, 'enabled': ?instance.enabled};
