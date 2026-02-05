// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_ftl.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionFtlCWProxy {
  VersionVersionFtl local(VersionVersionFtlLocal? local);

  VersionVersionFtl remote(VersionVersionFtlRemote? remote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtl call({
    VersionVersionFtlLocal? local,
    VersionVersionFtlRemote? remote,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionFtl.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionFtl.copyWith.fieldName(...)`
class _$VersionVersionFtlCWProxyImpl implements _$VersionVersionFtlCWProxy {
  const _$VersionVersionFtlCWProxyImpl(this._value);

  final VersionVersionFtl _value;

  @override
  VersionVersionFtl local(VersionVersionFtlLocal? local) => this(local: local);

  @override
  VersionVersionFtl remote(VersionVersionFtlRemote? remote) =>
      this(remote: remote);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionFtl(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionFtl(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionFtl call({
    Object? local = const $CopyWithPlaceholder(),
    Object? remote = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionFtl(
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as VersionVersionFtlLocal?,
      remote: remote == const $CopyWithPlaceholder()
          ? _value.remote
          // ignore: cast_nullable_to_non_nullable
          : remote as VersionVersionFtlRemote?,
    );
  }
}

extension $VersionVersionFtlCopyWith on VersionVersionFtl {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionFtl.copyWith(...)` or like so:`instanceOfVersionVersionFtl.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionFtlCWProxy get copyWith =>
      _$VersionVersionFtlCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionFtl _$VersionVersionFtlFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VersionVersionFtl', json, ($checkedConvert) {
      final val = VersionVersionFtl(
        local: $checkedConvert(
          'local',
          (v) => v == null
              ? null
              : VersionVersionFtlLocal.fromJson(v as Map<String, dynamic>),
        ),
        remote: $checkedConvert(
          'remote',
          (v) => v == null
              ? null
              : VersionVersionFtlRemote.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VersionVersionFtlToJson(VersionVersionFtl instance) =>
    <String, dynamic>{
      'local': ?instance.local?.toJson(),
      'remote': ?instance.remote?.toJson(),
    };
