// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_core_local.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionCoreLocalCWProxy {
  VersionVersionCoreLocal branch(String? branch);

  VersionVersionCoreLocal version(String? version);

  VersionVersionCoreLocal hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCoreLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCoreLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCoreLocal call({String? branch, String? version, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionCoreLocal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionCoreLocal.copyWith.fieldName(...)`
class _$VersionVersionCoreLocalCWProxyImpl
    implements _$VersionVersionCoreLocalCWProxy {
  const _$VersionVersionCoreLocalCWProxyImpl(this._value);

  final VersionVersionCoreLocal _value;

  @override
  VersionVersionCoreLocal branch(String? branch) => this(branch: branch);

  @override
  VersionVersionCoreLocal version(String? version) => this(version: version);

  @override
  VersionVersionCoreLocal hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCoreLocal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCoreLocal(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCoreLocal call({
    Object? branch = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionCoreLocal(
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

extension $VersionVersionCoreLocalCopyWith on VersionVersionCoreLocal {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionCoreLocal.copyWith(...)` or like so:`instanceOfVersionVersionCoreLocal.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionCoreLocalCWProxy get copyWith =>
      _$VersionVersionCoreLocalCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionCoreLocal _$VersionVersionCoreLocalFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionCoreLocal', json, ($checkedConvert) {
  final val = VersionVersionCoreLocal(
    branch: $checkedConvert('branch', (v) => v as String?),
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionCoreLocalToJson(
  VersionVersionCoreLocal instance,
) => <String, dynamic>{
  'branch': ?instance.branch,
  'version': ?instance.version,
  'hash': ?instance.hash,
};
