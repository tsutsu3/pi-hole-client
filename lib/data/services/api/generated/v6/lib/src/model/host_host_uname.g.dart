// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_host_uname.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HostHostUnameCWProxy {
  HostHostUname domainname(String? domainname);

  HostHostUname machine(String? machine);

  HostHostUname nodename(String? nodename);

  HostHostUname release(String? release);

  HostHostUname sysname(String? sysname);

  HostHostUname version(String? version);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostUname(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostUname(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostUname call({
    String? domainname,
    String? machine,
    String? nodename,
    String? release,
    String? sysname,
    String? version,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHostHostUname.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHostHostUname.copyWith.fieldName(...)`
class _$HostHostUnameCWProxyImpl implements _$HostHostUnameCWProxy {
  const _$HostHostUnameCWProxyImpl(this._value);

  final HostHostUname _value;

  @override
  HostHostUname domainname(String? domainname) => this(domainname: domainname);

  @override
  HostHostUname machine(String? machine) => this(machine: machine);

  @override
  HostHostUname nodename(String? nodename) => this(nodename: nodename);

  @override
  HostHostUname release(String? release) => this(release: release);

  @override
  HostHostUname sysname(String? sysname) => this(sysname: sysname);

  @override
  HostHostUname version(String? version) => this(version: version);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HostHostUname(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HostHostUname(...).copyWith(id: 12, name: "My name")
  /// ````
  HostHostUname call({
    Object? domainname = const $CopyWithPlaceholder(),
    Object? machine = const $CopyWithPlaceholder(),
    Object? nodename = const $CopyWithPlaceholder(),
    Object? release = const $CopyWithPlaceholder(),
    Object? sysname = const $CopyWithPlaceholder(),
    Object? version = const $CopyWithPlaceholder(),
  }) {
    return HostHostUname(
      domainname: domainname == const $CopyWithPlaceholder()
          ? _value.domainname
          // ignore: cast_nullable_to_non_nullable
          : domainname as String?,
      machine: machine == const $CopyWithPlaceholder()
          ? _value.machine
          // ignore: cast_nullable_to_non_nullable
          : machine as String?,
      nodename: nodename == const $CopyWithPlaceholder()
          ? _value.nodename
          // ignore: cast_nullable_to_non_nullable
          : nodename as String?,
      release: release == const $CopyWithPlaceholder()
          ? _value.release
          // ignore: cast_nullable_to_non_nullable
          : release as String?,
      sysname: sysname == const $CopyWithPlaceholder()
          ? _value.sysname
          // ignore: cast_nullable_to_non_nullable
          : sysname as String?,
      version: version == const $CopyWithPlaceholder()
          ? _value.version
          // ignore: cast_nullable_to_non_nullable
          : version as String?,
    );
  }
}

extension $HostHostUnameCopyWith on HostHostUname {
  /// Returns a callable class that can be used as follows: `instanceOfHostHostUname.copyWith(...)` or like so:`instanceOfHostHostUname.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HostHostUnameCWProxy get copyWith => _$HostHostUnameCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostHostUname _$HostHostUnameFromJson(Map<String, dynamic> json) =>
    $checkedCreate('HostHostUname', json, ($checkedConvert) {
      final val = HostHostUname(
        domainname: $checkedConvert('domainname', (v) => v as String?),
        machine: $checkedConvert('machine', (v) => v as String?),
        nodename: $checkedConvert('nodename', (v) => v as String?),
        release: $checkedConvert('release', (v) => v as String?),
        sysname: $checkedConvert('sysname', (v) => v as String?),
        version: $checkedConvert('version', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$HostHostUnameToJson(HostHostUname instance) =>
    <String, dynamic>{
      'domainname': ?instance.domainname,
      'machine': ?instance.machine,
      'nodename': ?instance.nodename,
      'release': ?instance.release,
      'sysname': ?instance.sysname,
      'version': ?instance.version,
    };
