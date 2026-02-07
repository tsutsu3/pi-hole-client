// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_regex_denied.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseRegexDeniedCWProxy {
  FtlFtlDatabaseRegexDenied total(int? total);

  FtlFtlDatabaseRegexDenied enabled(int? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegexDenied(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegexDenied(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegexDenied call({int? total, int? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseRegexDenied.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseRegexDenied.copyWith.fieldName(...)`
class _$FtlFtlDatabaseRegexDeniedCWProxyImpl
    implements _$FtlFtlDatabaseRegexDeniedCWProxy {
  const _$FtlFtlDatabaseRegexDeniedCWProxyImpl(this._value);

  final FtlFtlDatabaseRegexDenied _value;

  @override
  FtlFtlDatabaseRegexDenied total(int? total) => this(total: total);

  @override
  FtlFtlDatabaseRegexDenied enabled(int? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegexDenied(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegexDenied(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegexDenied call({
    Object? total = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseRegexDenied(
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

extension $FtlFtlDatabaseRegexDeniedCopyWith on FtlFtlDatabaseRegexDenied {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseRegexDenied.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseRegexDenied.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseRegexDeniedCWProxy get copyWith =>
      _$FtlFtlDatabaseRegexDeniedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseRegexDenied _$FtlFtlDatabaseRegexDeniedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FtlFtlDatabaseRegexDenied', json, ($checkedConvert) {
  final val = FtlFtlDatabaseRegexDenied(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    enabled: $checkedConvert('enabled', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$FtlFtlDatabaseRegexDeniedToJson(
  FtlFtlDatabaseRegexDenied instance,
) => <String, dynamic>{'total': ?instance.total, 'enabled': ?instance.enabled};
