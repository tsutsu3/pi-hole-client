// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_docker.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionDockerCWProxy {
  VersionVersionDocker local(String? local);

  VersionVersionDocker remote(String? remote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionDocker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionDocker(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionDocker call({String? local, String? remote});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionDocker.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionDocker.copyWith.fieldName(...)`
class _$VersionVersionDockerCWProxyImpl
    implements _$VersionVersionDockerCWProxy {
  const _$VersionVersionDockerCWProxyImpl(this._value);

  final VersionVersionDocker _value;

  @override
  VersionVersionDocker local(String? local) => this(local: local);

  @override
  VersionVersionDocker remote(String? remote) => this(remote: remote);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionDocker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionDocker(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionDocker call({
    Object? local = const $CopyWithPlaceholder(),
    Object? remote = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionDocker(
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as String?,
      remote: remote == const $CopyWithPlaceholder()
          ? _value.remote
          // ignore: cast_nullable_to_non_nullable
          : remote as String?,
    );
  }
}

extension $VersionVersionDockerCopyWith on VersionVersionDocker {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionDocker.copyWith(...)` or like so:`instanceOfVersionVersionDocker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionDockerCWProxy get copyWith =>
      _$VersionVersionDockerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionDocker _$VersionVersionDockerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VersionVersionDocker', json, ($checkedConvert) {
  final val = VersionVersionDocker(
    local: $checkedConvert('local', (v) => v as String?),
    remote: $checkedConvert('remote', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$VersionVersionDockerToJson(
  VersionVersionDocker instance,
) => <String, dynamic>{'local': ?instance.local, 'remote': ?instance.remote};
