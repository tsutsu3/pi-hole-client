// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_ftl_local.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionFtlLocalCWProxy {
  VersionVersionFtlLocal branch(String? branch);

  VersionVersionFtlLocal version(String? version);

  VersionVersionFtlLocal hash(String? hash);

  VersionVersionFtlLocal date(String? date);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtlLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtlLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtlLocal call({
    String? branch,
    String? version,
    String? hash,
    String? date,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionFtlLocal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionFtlLocal.copyWith.fieldName(...)`
class _$VersionVersionFtlLocalCWProxyImpl
    implements _$VersionVersionFtlLocalCWProxy {
  const _$VersionVersionFtlLocalCWProxyImpl(this._value);

  final VersionVersionFtlLocal _value;

  @override
  VersionVersionFtlLocal branch(String? branch) => this(branch: branch);

  @override
  VersionVersionFtlLocal version(String? version) => this(version: version);

  @override
  VersionVersionFtlLocal hash(String? hash) => this(hash: hash);

  @override
  VersionVersionFtlLocal date(String? date) => this(date: date);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtlLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtlLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtlLocal call({
    Object? branch = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionFtlLocal(
      branch: branch == const $CopyWithPlaceholder()
          ? _value.branch
          // ignore: cast_nullable_to_non_nullable
          : branch as String?,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String?,
      hash: hash == const $CopyWithPlaceholder()
          ? _value.hash
          // ignore: cast_nullable_to_non_nullable
          : hash as String?,
      date: date == const $CopyWithPlaceholder()
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as String?,
    );
  }
}

extension $VersionVersionFtlLocalCopyWith on VersionVersionFtlLocal {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionFtlLocal.copyWith(...)` or like so:`instanceOfVersionVersionFtlLocal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionFtlLocalCWProxy get copyWith =>
      _$VersionVersionFtlLocalCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionFtlLocal _$VersionVersionFtlLocalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionFtlLocal', json, ($checkedConvert) {
  final val = VersionVersionFtlLocal(
    branch: $checkedConvert('branch', (v) => v as String?),
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
    date: $checkedConvert('date', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionFtlLocalToJson(
  VersionVersionFtlLocal instance,
) => <String, dynamic>{
  'branch': ?instance.branch,
  'version': ?instance.version,
  'hash': ?instance.hash,
  'date': ?instance.date,
};
