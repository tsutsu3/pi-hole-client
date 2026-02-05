// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_ftl_remote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionFtlRemoteCWProxy {
  VersionVersionFtlRemote version(String? version);

  VersionVersionFtlRemote hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtlRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtlRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtlRemote call({String? version, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionFtlRemote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionFtlRemote.copyWith.fieldName(...)`
class _$VersionVersionFtlRemoteCWProxyImpl
    implements _$VersionVersionFtlRemoteCWProxy {
  const _$VersionVersionFtlRemoteCWProxyImpl(this._value);

  final VersionVersionFtlRemote _value;

  @override
  VersionVersionFtlRemote version(String? version) => this(version: version);

  @override
  VersionVersionFtlRemote hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtlRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtlRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtlRemote call({
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionFtlRemote(
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

extension $VersionVersionFtlRemoteCopyWith on VersionVersionFtlRemote {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionFtlRemote.copyWith(...)` or like so:`instanceOfVersionVersionFtlRemote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionFtlRemoteCWProxy get copyWith =>
      _$VersionVersionFtlRemoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionFtlRemote _$VersionVersionFtlRemoteFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionFtlRemote', json, ($checkedConvert) {
  final val = VersionVersionFtlRemote(
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionFtlRemoteToJson(
  VersionVersionFtlRemote instance,
) => <String, dynamic>{'version': ?instance.version, 'hash': ?instance.hash};
