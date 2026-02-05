// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database_domains.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseDomainsCWProxy {
  FtlFtlDatabaseDomains allowed(FtlFtlDatabaseDomainsAllowed? allowed);

  FtlFtlDatabaseDomains denied(FtlFtlDatabaseDomainsDenied? denied);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomains call({
    FtlFtlDatabaseDomainsAllowed? allowed,
    FtlFtlDatabaseDomainsDenied? denied,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabaseDomains.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabaseDomains.copyWith.fieldName(...)`
class _$FtlFtlDatabaseDomainsCWProxyImpl
    implements _$FtlFtlDatabaseDomainsCWProxy {
  const _$FtlFtlDatabaseDomainsCWProxyImpl(this._value);

  final FtlFtlDatabaseDomains _value;

  @override
  FtlFtlDatabaseDomains allowed(FtlFtlDatabaseDomainsAllowed? allowed) =>
      this(allowed: allowed);

  @override
  FtlFtlDatabaseDomains denied(FtlFtlDatabaseDomainsDenied? denied) =>
      this(denied: denied);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabaseDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabaseDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabaseDomains call({
    Object? allowed = const $CopyWithPlaceholder(),
    Object? denied = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabaseDomains(
      allowed: allowed == const $CopyWithPlaceholder()
          ? _value.allowed
          // ignore: cast_nullable_to_non_nullable
          : allowed as FtlFtlDatabaseDomainsAllowed?,
      denied: denied == const $CopyWithPlaceholder()
          ? _value.denied
          // ignore: cast_nullable_to_non_nullable
          : denied as FtlFtlDatabaseDomainsDenied?,
    );
  }
}

extension $FtlFtlDatabaseDomainsCopyWith on FtlFtlDatabaseDomains {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabaseDomains.copyWith(...)` or like so:`instanceOfFtlFtlDatabaseDomains.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseDomainsCWProxy get copyWith =>
      _$FtlFtlDatabaseDomainsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabaseDomains _$FtlFtlDatabaseDomainsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('FtlFtlDatabaseDomains', json, ($checkedConvert) {
  final val = FtlFtlDatabaseDomains(
    allowed: $checkedConvert(
      'allowed',
      (v) => v == null
          ? null
          : FtlFtlDatabaseDomainsAllowed.fromJson(v as Map<String, dynamic>),
    ),
    denied: $checkedConvert(
      'denied',
      (v) => v == null
          ? null
          : FtlFtlDatabaseDomainsDenied.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$FtlFtlDatabaseDomainsToJson(
  FtlFtlDatabaseDomains instance,
) => <String, dynamic>{
  'allowed': ?instance.allowed?.toJson(),
  'denied': ?instance.denied?.toJson(),
};
