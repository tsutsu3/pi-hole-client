// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_version_web.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionVersionWebCWProxy {
  VersionVersionWeb local(VersionVersionWebLocal? local);

  VersionVersionWeb remote(VersionVersionWebRemote? remote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWeb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWeb(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWeb call({
    VersionVersionWebLocal? local,
    VersionVersionWebRemote? remote,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersionVersionWeb.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersionVersionWeb.copyWith.fieldName(...)`
class _$VersionVersionWebCWProxyImpl implements _$VersionVersionWebCWProxy {
  const _$VersionVersionWebCWProxyImpl(this._value);

  final VersionVersionWeb _value;

  @override
  VersionVersionWeb local(VersionVersionWebLocal? local) => this(local: local);

  @override
  VersionVersionWeb remote(VersionVersionWebRemote? remote) =>
      this(remote: remote);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VersionVersionWeb(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VersionVersionWeb(...).copyWith(id: 12, name: "My name")
  /// ````
  VersionVersionWeb call({
    Object? local = const $CopyWithPlaceholder(),
    Object? remote = const $CopyWithPlaceholder(),
  }) {
    return VersionVersionWeb(
      local: local == const $CopyWithPlaceholder()
          ? _value.local
          // ignore: cast_nullable_to_non_nullable
          : local as VersionVersionWebLocal?,
      remote: remote == const $CopyWithPlaceholder()
          ? _value.remote
          // ignore: cast_nullable_to_non_nullable
          : remote as VersionVersionWebRemote?,
    );
  }
}

extension $VersionVersionWebCopyWith on VersionVersionWeb {
  /// Returns a callable class that can be used as follows: `instanceOfVersionVersionWeb.copyWith(...)` or like so:`instanceOfVersionVersionWeb.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionVersionWebCWProxy get copyWith =>
      _$VersionVersionWebCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionVersionWeb _$VersionVersionWebFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VersionVersionWeb', json, ($checkedConvert) {
      final val = VersionVersionWeb(
        local: $checkedConvert(
          'local',
          (v) => v == null
              ? null
              : VersionVersionWebLocal.fromJson(v as Map<String, dynamic>),
        ),
        remote: $checkedConvert(
          'remote',
          (v) => v == null
              ? null
              : VersionVersionWebRemote.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VersionVersionWebToJson(VersionVersionWeb instance) =>
    <String, dynamic>{
      'local': ?instance.local?.toJson(),
      'remote': ?instance.remote?.toJson(),
    };
