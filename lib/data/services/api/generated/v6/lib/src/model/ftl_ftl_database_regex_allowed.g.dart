// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_regex_allowed.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseRegexAllowedCWProxy {
  FtlFtlDatabaseRegexAllowed total(int? total);

  FtlFtlDatabaseRegexAllowed enabled(int? enabled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegexAllowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegexAllowed(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegexAllowed call({int? total, int? enabled});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseRegexAllowed.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseRegexAllowed.copyWith.fieldName(...)`
class _$FtlFtlDatabaseRegexAllowedCWProxyImpl
    implements _$FtlFtlDatabaseRegexAllowedCWProxy {
  const _$FtlFtlDatabaseRegexAllowedCWProxyImpl(this._value);

  final FtlFtlDatabaseRegexAllowed _value;

  @override
  FtlFtlDatabaseRegexAllowed total(int? total) => this(total: total);

  @override
  FtlFtlDatabaseRegexAllowed enabled(int? enabled) => this(enabled: enabled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegexAllowed(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegexAllowed(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegexAllowed call({
    Object? total = const $CopyWithPlaceholder(),
    Object? enabled = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseRegexAllowed(
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

extension $FtlFtlDatabaseRegexAllowedCopyWith on FtlFtlDatabaseRegexAllowed {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseRegexAllowed.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseRegexAllowed.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseRegexAllowedCWProxy get copyWith =>
      _$FtlFtlDatabaseRegexAllowedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseRegexAllowed _$FtlFtlDatabaseRegexAllowedFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FtlFtlDatabaseRegexAllowed', json, ($checkedConvert) {
  final val = FtlFtlDatabaseRegexAllowed(
    total: $checkedConvert('total', (v) => (v as num?)?.toInt()),
    enabled: $checkedConvert('enabled', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$FtlFtlDatabaseRegexAllowedToJson(
  FtlFtlDatabaseRegexAllowed instance,
) => <String, dynamic>{'total': ?instance.total, 'enabled': ?instance.enabled};
