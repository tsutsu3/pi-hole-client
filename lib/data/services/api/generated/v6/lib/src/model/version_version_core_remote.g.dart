// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_core_remote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionCoreRemoteCWProxy {
  VersionVersionCoreRemote version(String? version);

  VersionVersionCoreRemote hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCoreRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCoreRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCoreRemote call({String? version, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionCoreRemote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionCoreRemote.copyWith.fieldName(...)`
class _$VersionVersionCoreRemoteCWProxyImpl
    implements _$VersionVersionCoreRemoteCWProxy {
  const _$VersionVersionCoreRemoteCWProxyImpl(this._value);

  final VersionVersionCoreRemote _value;

  @override
  VersionVersionCoreRemote version(String? version) => this(version: version);

  @override
  VersionVersionCoreRemote hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCoreRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCoreRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCoreRemote call({
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionCoreRemote(
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

extension $VersionVersionCoreRemoteCopyWith on VersionVersionCoreRemote {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionCoreRemote.copyWith(...)` or like so:`instanceOfVersionVersionCoreRemote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionCoreRemoteCWProxy get copyWith =>
      _$VersionVersionCoreRemoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionCoreRemote _$VersionVersionCoreRemoteFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionCoreRemote', json, ($checkedConvert) {
  final val = VersionVersionCoreRemote(
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionCoreRemoteToJson(
  VersionVersionCoreRemote instance,
) => <String, dynamic>{'version': ?instance.version, 'hash': ?instance.hash};
