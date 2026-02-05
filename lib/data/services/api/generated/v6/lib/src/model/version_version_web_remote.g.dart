// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_web_remote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionWebRemoteCWProxy {
  VersionVersionWebRemote version(String? version);

  VersionVersionWebRemote hash(String? hash);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWebRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWebRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWebRemote call({String? version, String? hash});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionWebRemote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionWebRemote.copyWith.fieldName(...)`
class _$VersionVersionWebRemoteCWProxyImpl
    implements _$VersionVersionWebRemoteCWProxy {
  const _$VersionVersionWebRemoteCWProxyImpl(this._value);

  final VersionVersionWebRemote _value;

  @override
  VersionVersionWebRemote version(String? version) => this(version: version);

  @override
  VersionVersionWebRemote hash(String? hash) => this(hash: hash);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWebRemote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWebRemote(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWebRemote call({
    Object? version = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionWebRemote(
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

extension $VersionVersionWebRemoteCopyWith on VersionVersionWebRemote {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionWebRemote.copyWith(...)` or like so:`instanceOfVersionVersionWebRemote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionWebRemoteCWProxy get copyWith =>
      _$VersionVersionWebRemoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionWebRemote _$VersionVersionWebRemoteFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionWebRemote', json, ($checkedConvert) {
  final val = VersionVersionWebRemote(
    version: $checkedConvert('version', (v) => v as String?),
    hash: $checkedConvert('hash', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionWebRemoteToJson(
  VersionVersionWebRemote instance,
) => <String, dynamic>{'version': ?instance.version, 'hash': ?instance.hash};
