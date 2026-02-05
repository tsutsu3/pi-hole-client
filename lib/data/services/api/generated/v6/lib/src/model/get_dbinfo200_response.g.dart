// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dbinfo200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetDbinfo200ResponseCWProxy {
  GetDbinfo200Response size(int? size);

  GetDbinfo200Response type(String? type);

  GetDbinfo200Response mode(String? mode);

  GetDbinfo200Response atime(int? atime);

  GetDbinfo200Response mtime(int? mtime);

  GetDbinfo200Response ctime(int? ctime);

  GetDbinfo200Response owner(DatabaseOwner? owner);

  GetDbinfo200Response queries(int? queries);

  GetDbinfo200Response earliestTimestamp(num? earliestTimestamp);

  GetDbinfo200Response queriesDisk(int? queriesDisk);

  GetDbinfo200Response earliestTimestampDisk(num? earliestTimestampDisk);

  GetDbinfo200Response sqliteVersion(String? sqliteVersion);

  GetDbinfo200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDbinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDbinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDbinfo200Response call({
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
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetDbinfo200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetDbinfo200Response.copyWith.fieldName(...)`
class _$GetDbinfo200ResponseCWProxyImpl
    implements _$GetDbinfo200ResponseCWProxy {
  const _$GetDbinfo200ResponseCWProxyImpl(this._value);

  final GetDbinfo200Response _value;

  @override
  GetDbinfo200Response size(int? size) => this(size: size);

  @override
  GetDbinfo200Response type(String? type) => this(type: type);

  @override
  GetDbinfo200Response mode(String? mode) => this(mode: mode);

  @override
  GetDbinfo200Response atime(int? atime) => this(atime: atime);

  @override
  GetDbinfo200Response mtime(int? mtime) => this(mtime: mtime);

  @override
  GetDbinfo200Response ctime(int? ctime) => this(ctime: ctime);

  @override
  GetDbinfo200Response owner(DatabaseOwner? owner) => this(owner: owner);

  @override
  GetDbinfo200Response queries(int? queries) => this(queries: queries);

  @override
  GetDbinfo200Response earliestTimestamp(num? earliestTimestamp) =>
      this(earliestTimestamp: earliestTimestamp);

  @override
  GetDbinfo200Response queriesDisk(int? queriesDisk) =>
      this(queriesDisk: queriesDisk);

  @override
  GetDbinfo200Response earliestTimestampDisk(num? earliestTimestampDisk) =>
      this(earliestTimestampDisk: earliestTimestampDisk);

  @override
  GetDbinfo200Response sqliteVersion(String? sqliteVersion) =>
      this(sqliteVersion: sqliteVersion);

  @override
  GetDbinfo200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDbinfo200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDbinfo200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDbinfo200Response call({
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
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetDbinfo200Response(
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
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetDbinfo200ResponseCopyWith on GetDbinfo200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetDbinfo200Response.copyWith(...)` or like so:`instanceOfGetDbinfo200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetDbinfo200ResponseCWProxy get copyWith =>
      _$GetDbinfo200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDbinfo200Response _$GetDbinfo200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GetDbinfo200Response',
  json,
  ($checkedConvert) {
    final val = GetDbinfo200Response(
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
      took: $checkedConvert('took', (v) => v as num?),
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

Map<String, dynamic> _$GetDbinfo200ResponseToJson(
  GetDbinfo200Response instance,
) => <String, dynamic>{
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
  'took': ?instance.took,
};
