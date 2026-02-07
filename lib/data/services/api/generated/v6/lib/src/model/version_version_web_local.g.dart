// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_web_local.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionWebLocalCWProxy {
  VersionVersionWebLocal branch(String? branch);

  VersionVersionWebLocal version(String? version);

  VersionVersionWebLocal hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWebLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWebLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWebLocal call({String? branch, String? version, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionWebLocal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionWebLocal.copyWith.fieldName(...)`
class _$VersionVersionWebLocalCWProxyImpl
    implements _$VersionVersionWebLocalCWProxy {
  const _$VersionVersionWebLocalCWProxyImpl(this._value);

  final VersionVersionWebLocal _value;

  @override
  VersionVersionWebLocal branch(String? branch) => this(branch: branch);

  @override
  VersionVersionWebLocal version(String? version) => this(version: version);

  @override
  VersionVersionWebLocal hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWebLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWebLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWebLocal call({
    Object? branch = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionWebLocal(
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
    );
  }
}

extension $VersionVersionWebLocalCopyWith on VersionVersionWebLocal {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionWebLocal.copyWith(...)` or like so:`instanceOfVersionVersionWebLocal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionWebLocalCWProxy get copyWith =>
      _$VersionVersionWebLocalCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionWebLocal _$VersionVersionWebLocalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionWebLocal', json, ($checkedConvert) {
  final val = VersionVersionWebLocal(
    branch: $checkedConvert('branch', (v) => v as String?),
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionWebLocalToJson(
  VersionVersionWebLocal instance,
) => <String, dynamic>{
  'branch': ?instance.branch,
  'version': ?instance.version,
  'hash': ?instance.hash,
};
