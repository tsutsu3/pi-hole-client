// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_core.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionCoreCWProxy {
  VersionVersionCore local(VersionVersionCoreLocal? local);

  VersionVersionCore remote(VersionVersionCoreRemote? remote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCore(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCore(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCore call({
    VersionVersionCoreLocal? local,
    VersionVersionCoreRemote? remote,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionCore.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionCore.copyWith.fieldName(...)`
class _$VersionVersionCoreCWProxyImpl implements _$VersionVersionCoreCWProxy {
  const _$VersionVersionCoreCWProxyImpl(this._value);

  final VersionVersionCore _value;

  @override
  VersionVersionCore local(VersionVersionCoreLocal? local) =>
      this(local: local);

  @override
  VersionVersionCore remote(VersionVersionCoreRemote? remote) =>
      this(remote: remote);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionCore(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionCore(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionCore call({
    Object? local = const $CopyWithPlaceholder(),
    Object? remote = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionCore(
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as VersionVersionCoreLocal?,
      remote: remote == const $CopyWithPlaceholder()
          ? _value.remote
          // ignore: cast_nullable_to_non_nullable
          : remote as VersionVersionCoreRemote?,
    );
  }
}

extension $VersionVersionCoreCopyWith on VersionVersionCore {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionCore.copyWith(...)` or like so:`instanceOfVersionVersionCore.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionCoreCWProxy get copyWith =>
      _$VersionVersionCoreCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionCore _$VersionVersionCoreFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VersionVersionCore', json, ($checkedConvert) {
      final val = VersionVersionCore(
        local: $checkedConvert(
          'local',
          (v) => v == null
              ? null
              : VersionVersionCoreLocal.fromJson(v as Map<String, dynamic>),
        ),
        remote: $checkedConvert(
          'remote',
          (v) => v == null
              ? null
              : VersionVersionCoreRemote.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VersionVersionCoreToJson(VersionVersionCore instance) =>
    <String, dynamic>{
      'local': ?instance.local?.toJson(),
      'remote': ?instance.remote?.toJson(),
    };
