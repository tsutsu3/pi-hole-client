// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_teleporter_request_import.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostTeleporterRequestImportCWProxy {
  PostTeleporterRequestImport config(bool? config);

  PostTeleporterRequestImport dhcpLeases(bool? dhcpLeases);

  PostTeleporterRequestImport gravity(
    PostTeleporterRequestImportGravity? gravity,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporterRequestImport(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporterRequestImport(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporterRequestImport call({
    bool? config,
    bool? dhcpLeases,
    PostTeleporterRequestImportGravity? gravity,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostTeleporterRequestImport.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostTeleporterRequestImport.copyWith.fieldName(...)`
class _$PostTeleporterRequestImportCWProxyImpl
    implements _$PostTeleporterRequestImportCWProxy {
  const _$PostTeleporterRequestImportCWProxyImpl(this._value);

  final PostTeleporterRequestImport _value;

  @override
  PostTeleporterRequestImport config(bool? config) => this(config: config);

  @override
  PostTeleporterRequestImport dhcpLeases(bool? dhcpLeases) =>
      this(dhcpLeases: dhcpLeases);

  @override
  PostTeleporterRequestImport gravity(
    PostTeleporterRequestImportGravity? gravity,
  ) => this(gravity: gravity);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporterRequestImport(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporterRequestImport(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporterRequestImport call({
    Object? config = const $CopyWithPlaceholder(),
    Object? dhcpLeases = const $CopyWithPlaceholder(),
    Object? gravity = const $CopyWithPlaceholder(),
  }) {
    return PostTeleporterRequestImport(
      config: config == const $CopyWithPlaceholder()
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as bool?,
      dhcpLeases: dhcpLeases == const $CopyWithPlaceholder()
          ? _value.dhcpLeases
          // ignore: cast_nullable_to_non_nullable
          : dhcpLeases as bool?,
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as PostTeleporterRequestImportGravity?,
    );
  }
}

extension $PostTeleporterRequestImportCopyWith on PostTeleporterRequestImport {
  /// Returns a callable class that can be used as follows: `instanceOfPostTeleporterRequestImport.copyWith(...)` or like so:`instanceOfPostTeleporterRequestImport.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostTeleporterRequestImportCWProxy get copyWith =>
      _$PostTeleporterRequestImportCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTeleporterRequestImport _$PostTeleporterRequestImportFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PostTeleporterRequestImport',
  json,
  ($checkedConvert) {
    final val = PostTeleporterRequestImport(
      config: $checkedConvert('config', (v) => v as bool?),
      dhcpLeases: $checkedConvert('dhcp_leases', (v) => v as bool?),
      gravity: $checkedConvert(
        'gravity',
        (v) => v == null
            ? null
            : PostTeleporterRequestImportGravity.fromJson(
                v as Map<String, dynamic>,
              ),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'dhcpLeases': 'dhcp_leases'},
);

Map<String, dynamic> _$PostTeleporterRequestImportToJson(
  PostTeleporterRequestImport instance,
) => <String, dynamic>{
  'config': ?instance.config,
  'dhcp_leases': ?instance.dhcpLeases,
  'gravity': ?instance.gravity?.toJson(),
};
