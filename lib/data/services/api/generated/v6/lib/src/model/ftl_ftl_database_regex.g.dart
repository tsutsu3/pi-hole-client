// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_regex.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseRegexCWProxy {
  FtlFtlDatabaseRegex allowed(FtlFtlDatabaseRegexAllowed? allowed);

  FtlFtlDatabaseRegex denied(FtlFtlDatabaseRegexDenied? denied);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegex(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegex(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegex call({
    FtlFtlDatabaseRegexAllowed? allowed,
    FtlFtlDatabaseRegexDenied? denied,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseRegex.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseRegex.copyWith.fieldName(...)`
class _$FtlFtlDatabaseRegexCWProxyImpl implements _$FtlFtlDatabaseRegexCWProxy {
  const _$FtlFtlDatabaseRegexCWProxyImpl(this._value);

  final FtlFtlDatabaseRegex _value;

  @override
  FtlFtlDatabaseRegex allowed(FtlFtlDatabaseRegexAllowed? allowed) =>
      this(allowed: allowed);

  @override
  FtlFtlDatabaseRegex denied(FtlFtlDatabaseRegexDenied? denied) =>
      this(denied: denied);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseRegex(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseRegex(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseRegex call({
    Object? allowed = const $CopyWithPlaceholder(),
    Object? denied = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseRegex(
      allowed: allowed == const $CopyWithPlaceholder()
          ? _value.allowed
          // ignore: cast_nullable_to_non_nullable
          : allowed as FtlFtlDatabaseRegexAllowed?,
      denied: denied == const $CopyWithPlaceholder()
          ? _value.denied
          // ignore: cast_nullable_to_non_nullable
          : denied as FtlFtlDatabaseRegexDenied?,
    );
  }
}

extension $FtlFtlDatabaseRegexCopyWith on FtlFtlDatabaseRegex {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseRegex.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseRegex.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseRegexCWProxy get copyWith =>
      _$FtlFtlDatabaseRegexCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseRegex _$FtlFtlDatabaseRegexFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FtlFtlDatabaseRegex', json, ($checkedConvert) {
      final val = FtlFtlDatabaseRegex(
        allowed: $checkedConvert(
          'allowed',
          (v) => v == null
              ? null
              : FtlFtlDatabaseRegexAllowed.fromJson(v as Map<String, dynamic>),
        ),
        denied: $checkedConvert(
          'denied',
          (v) => v == null
              ? null
              : FtlFtlDatabaseRegexDenied.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FtlFtlDatabaseRegexToJson(
  FtlFtlDatabaseRegex instance,
) => <String, dynamic>{
  'allowed': ?instance.allowed?.toJson(),
  'denied': ?instance.denied?.toJson(),
};
