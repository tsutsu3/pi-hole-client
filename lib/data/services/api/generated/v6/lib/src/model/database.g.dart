// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DatabaseCWProxy {
  Database size(int? size);

  Database type(String? type);

  Database mode(String? mode);

  Database atime(int? atime);

  Database mtime(int? mtime);

  Database ctime(int? ctime);

  Database owner(DatabaseOwner? owner);

  Database queries(int? queries);

  Database earliestTimestamp(num? earliestTimestamp);

  Database queriesDisk(int? queriesDisk);

  Database earliestTimestampDisk(num? earliestTimestampDisk);

  Database sqliteVersion(String? sqliteVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Database(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Database(...).copyWith(id: 12, name: "My name")
  /// ````
  Database call({
    int? size,
    String? type,
    String? mode,
    int? atime,
    int? mtime,
    int? ctime,
    DatabaseOwner? owner,
    int? queries,
    num? earliestTimestamp,
    int? queriesDisk,
    num? earliestTimestampDisk,
    String? sqliteVersion,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDatabase.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDatabase.copyWith.fieldName(...)`
class _$DatabaseCWProxyImpl implements _$DatabaseCWProxy {
  const _$DatabaseCWProxyImpl(this._value);

  final Database _value;

  @override
  Database size(int? size) => this(size: size);

  @override
  Database type(String? type) => this(type: type);

  @override
  Database mode(String? mode) => this(mode: mode);

  @override
  Database atime(int? atime) => this(atime: atime);

  @override
  Database mtime(int? mtime) => this(mtime: mtime);

  @override
  Database ctime(int? ctime) => this(ctime: ctime);

  @override
  Database owner(DatabaseOwner? owner) => this(owner: owner);

  @override
  Database queries(int? queries) => this(queries: queries);

  @override
  Database earliestTimestamp(num? earliestTimestamp) =>
      this(earliestTimestamp: earliestTimestamp);

  @override
  Database queriesDisk(int? queriesDisk) => this(queriesDisk: queriesDisk);

  @override
  Database earliestTimestampDisk(num? earliestTimestampDisk) =>
      this(earliestTimestampDisk: earliestTimestampDisk);

  @override
  Database sqliteVersion(String? sqliteVersion) =>
      this(sqliteVersion: sqliteVersion);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Database(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Database(...).copyWith(id: 12, name: "My name")
  /// ````
  Database call({
    Object? size = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? mode = const $CopyWithPlaceholder(),
    Object? atime = const $CopyWithPlaceholder(),
    Object? mtime = const $CopyWithPlaceholder(),
    Object? ctime = const $CopyWithPlaceholder(),
    Object? owner = const $CopyWithPlaceholder(),
    Object? queries = const $CopyWithPlaceholder(),
    Object? earliestTimestamp = const $CopyWithPlaceholder(),
    Object? queriesDisk = const $CopyWithPlaceholder(),
    Object? earliestTimestampDisk = const $CopyWithPlaceholder(),
    Object? sqliteVersion = const $CopyWithPlaceholder(),
  }) {
    return Database(
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      mode: mode == const $CopyWithPlaceholder()
          ? _value.mode
          // ignore: cast_nullable_to_non_nullable
          : mode as String?,
      atime: atime == const $CopyWithPlaceholder()
          ? _value.atime
          // ignore: cast_nullable_to_non_nullable
          : atime as int?,
      mtime: mtime == const $CopyWithPlaceholder()
          ? _value.mtime
          // ignore: cast_nullable_to_non_nullable
          : mtime as int?,
      ctime: ctime == const $CopyWithPlaceholder()
          ? _value.ctime
          // ignore: cast_nullable_to_non_nullable
          : ctime as int?,
      owner: owner == const $CopyWithPlaceholder()
          ? _value.owner
          // ignore: cast_nullable_to_non_nullable
          : owner as DatabaseOwner?,
      queries: queries == const $CopyWithPlaceholder()
          ? _value.queries
          // ignore: cast_nullable_to_non_nullable
          : queries as int?,
      earliestTimestamp: earliestTimestamp == const $CopyWithPlaceholder()
          ? _value.earliestTimestamp
          // ignore: cast_nullable_to_non_nullable
          : earliestTimestamp as num?,
      queriesDisk: queriesDisk == const $CopyWithPlaceholder()
          ? _value.queriesDisk
          // ignore: cast_nullable_to_non_nullable
          : queriesDisk as int?,
      earliestTimestampDisk:
          earliestTimestampDisk == const $CopyWithPlaceholder()
          ? _value.earliestTimestampDisk
          // ignore: cast_nullable_to_non_nullable
          : earliestTimestampDisk as num?,
      sqliteVersion: sqliteVersion == const $CopyWithPlaceholder()
          ? _value.sqliteVersion
          // ignore: cast_nullable_to_non_nullable
          : sqliteVersion as String?,
    );
  }
}

extension $DatabaseCopyWith on Database {
  /// Returns a callable class that can be used as follows: `instanceOfDatabase.copyWith(...)` or like so:`instanceOfDatabase.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DatabaseCWProxy get copyWith => _$DatabaseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Database _$DatabaseFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Database',
  json,
  ($checkedConvert) {
    final val = Database(
      size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
      type: $checkedConvert('type', (v) => v as String?),
      mode: $checkedConvert('mode', (v) => v as String?),
      atime: $checkedConvert('atime', (v) => (v as num?)?.toInt()),
      mtime: $checkedConvert('mtime', (v) => (v as num?)?.toInt()),
      ctime: $checkedConvert('ctime', (v) => (v as num?)?.toInt()),
      owner: $checkedConvert(
        'owner',
        (v) => v == null
            ? null
            : DatabaseOwner.fromJson(v as Map<String, dynamic>),
      ),
      queries: $checkedConvert('queries', (v) => (v as num?)?.toInt()),
      earliestTimestamp: $checkedConvert(
        'earliest_timestamp',
        (v) => v as num?,
      ),
      queriesDisk: $checkedConvert('queries_disk', (v) => (v as num?)?.toInt()),
      earliestTimestampDisk: $checkedConvert(
        'earliest_timestamp_disk',
        (v) => v as num?,
      ),
      sqliteVersion: $checkedConvert('sqlite_version', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'earliestTimestamp': 'earliest_timestamp',
    'queriesDisk': 'queries_disk',
    'earliestTimestampDisk': 'earliest_timestamp_disk',
    'sqliteVersion': 'sqlite_version',
  },
);

Map<String, dynamic> _$DatabaseToJson(Database instance) => <String, dynamic>{
  'size': ?instance.size,
  'type': ?instance.type,
  'mode': ?instance.mode,
  'atime': ?instance.atime,
  'mtime': ?instance.mtime,
  'ctime': ?instance.ctime,
  'owner': ?instance.owner?.toJson(),
  'queries': ?instance.queries,
  'earliest_timestamp': ?instance.earliestTimestamp,
  'queries_disk': ?instance.queriesDisk,
  'earliest_timestamp_disk': ?instance.earliestTimestampDisk,
  'sqlite_version': ?instance.sqliteVersion,
};
