// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VersionCWProxy {
  Version version(VersionVersion? version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Version(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Version(...).copyWith(id: 12, name: "My name")
  /// ````
  Version call({VersionVersion? version});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVersion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVersion.copyWith.fieldName(...)`
class _$VersionCWProxyImpl implements _$VersionCWProxy {
  const _$VersionCWProxyImpl(this._value);

  final Version _value;

  @override
  Version version(VersionVersion? version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Version(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Version(...).copyWith(id: 12, name: "My name")
  /// ````
  Version call({Object? version = const $CopyWithPlaceholder()}) {
    return Version(
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as VersionVersion?,
    );
  }
}

extension $VersionCopyWith on Version {
  /// Returns a callable class that can be used as follows: `instanceOfVersion.copyWith(...)` or like so:`instanceOfVersion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VersionCWProxy get copyWith => _$VersionCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Version', json, ($checkedConvert) {
      final val = Version(
        version: $checkedConvert(
          'version',
          (v) => v == null
              ? null
              : VersionVersion.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
  'version': ?instance.version?.toJson(),
};
