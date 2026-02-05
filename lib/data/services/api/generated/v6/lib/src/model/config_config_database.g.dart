// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_config_database.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ConfigConfigDatabaseCWProxy {
  ConfigConfigDatabase dBimport(bool? dBimport);

  ConfigConfigDatabase maxDBdays(int? maxDBdays);

  ConfigConfigDatabase dBinterval(int? dBinterval);

  ConfigConfigDatabase useWAL(bool? useWAL);

  ConfigConfigDatabase network(ConfigConfigDatabaseNetwork? network);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDatabase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDatabase(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDatabase call({
    bool? dBimport,
    int? maxDBdays,
    int? dBinterval,
    bool? useWAL,
    ConfigConfigDatabaseNetwork? network,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConfigConfigDatabase.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConfigConfigDatabase.copyWith.fieldName(...)`
class _$ConfigConfigDatabaseCWProxyImpl
    implements _$ConfigConfigDatabaseCWProxy {
  const _$ConfigConfigDatabaseCWProxyImpl(this._value);

  final ConfigConfigDatabase _value;

  @override
  ConfigConfigDatabase dBimport(bool? dBimport) => this(dBimport: dBimport);

  @override
  ConfigConfigDatabase maxDBdays(int? maxDBdays) => this(maxDBdays: maxDBdays);

  @override
  ConfigConfigDatabase dBinterval(int? dBinterval) =>
      this(dBinterval: dBinterval);

  @override
  ConfigConfigDatabase useWAL(bool? useWAL) => this(useWAL: useWAL);

  @override
  ConfigConfigDatabase network(ConfigConfigDatabaseNetwork? network) =>
      this(network: network);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ConfigConfigDatabase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ConfigConfigDatabase(...).copyWith(id: 12, name: "My name")
  /// ````
  ConfigConfigDatabase call({
    Object? dBimport = const $CopyWithPlaceholder(),
    Object? maxDBdays = const $CopyWithPlaceholder(),
    Object? dBinterval = const $CopyWithPlaceholder(),
    Object? useWAL = const $CopyWithPlaceholder(),
    Object? network = const $CopyWithPlaceholder(),
  }) {
    return ConfigConfigDatabase(
      dBimport: dBimport == const $CopyWithPlaceholder()
          ? _value.dBimport
          // ignore: cast_nullable_to_non_nullable
          : dBimport as bool?,
      maxDBdays: maxDBdays == const $CopyWithPlaceholder()
          ? _value.maxDBdays
          // ignore: cast_nullable_to_non_nullable
          : maxDBdays as int?,
      dBinterval: dBinterval == const $CopyWithPlaceholder()
          ? _value.dBinterval
          // ignore: cast_nullable_to_non_nullable
          : dBinterval as int?,
      useWAL: useWAL == const $CopyWithPlaceholder()
          ? _value.useWAL
          // ignore: cast_nullable_to_non_nullable
          : useWAL as bool?,
      network: network == const $CopyWithPlaceholder()
          ? _value.network
          // ignore: cast_nullable_to_non_nullable
          : network as ConfigConfigDatabaseNetwork?,
    );
  }
}

extension $ConfigConfigDatabaseCopyWith on ConfigConfigDatabase {
  /// Returns a callable class that can be used as follows: `instanceOfConfigConfigDatabase.copyWith(...)` or like so:`instanceOfConfigConfigDatabase.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConfigConfigDatabaseCWProxy get copyWith =>
      _$ConfigConfigDatabaseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigConfigDatabase _$ConfigConfigDatabaseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ConfigConfigDatabase',
  json,
  ($checkedConvert) {
    final val = ConfigConfigDatabase(
      dBimport: $checkedConvert('DBimport', (v) => v as bool?),
      maxDBdays: $checkedConvert('maxDBdays', (v) => (v as num?)?.toInt()),
      dBinterval: $checkedConvert('DBinterval', (v) => (v as num?)?.toInt()),
      useWAL: $checkedConvert('useWAL', (v) => v as bool?),
      network: $checkedConvert(
        'network',
        (v) => v == null
            ? null
            : ConfigConfigDatabaseNetwork.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'dBimport': 'DBimport', 'dBinterval': 'DBinterval'},
);

Map<String, dynamic> _$ConfigConfigDatabaseToJson(
  ConfigConfigDatabase instance,
) => <String, dynamic>{
  'DBimport': ?instance.dBimport,
  'maxDBdays': ?instance.maxDBdays,
  'DBinterval': ?instance.dBinterval,
  'useWAL': ?instance.useWAL,
  'network': ?instance.network?.toJson(),
};
