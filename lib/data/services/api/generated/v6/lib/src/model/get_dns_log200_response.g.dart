// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dns_log200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetDnsLog200ResponseCWProxy {
  GetDnsLog200Response log(List<LogLogInner>? log);

  GetDnsLog200Response nextID(int? nextID);

  GetDnsLog200Response pid(int? pid);

  GetDnsLog200Response file(String? file);

  GetDnsLog200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDnsLog200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDnsLog200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDnsLog200Response call({
    List<LogLogInner>? log,
    int? nextID,
    int? pid,
    String? file,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetDnsLog200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetDnsLog200Response.copyWith.fieldName(...)`
class _$GetDnsLog200ResponseCWProxyImpl
    implements _$GetDnsLog200ResponseCWProxy {
  const _$GetDnsLog200ResponseCWProxyImpl(this._value);

  final GetDnsLog200Response _value;

  @override
  GetDnsLog200Response log(List<LogLogInner>? log) => this(log: log);

  @override
  GetDnsLog200Response nextID(int? nextID) => this(nextID: nextID);

  @override
  GetDnsLog200Response pid(int? pid) => this(pid: pid);

  @override
  GetDnsLog200Response file(String? file) => this(file: file);

  @override
  GetDnsLog200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetDnsLog200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetDnsLog200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetDnsLog200Response call({
    Object? log = const $CopyWithPlaceholder(),
    Object? nextID = const $CopyWithPlaceholder(),
    Object? pid = const $CopyWithPlaceholder(),
    Object? file = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetDnsLog200Response(
      log: log == const $CopyWithPlaceholder()
          ? _value.log
          // ignore: cast_nullable_to_non_nullable
          : log as List<LogLogInner>?,
      nextID: nextID == const $CopyWithPlaceholder()
          ? _value.nextID
          // ignore: cast_nullable_to_non_nullable
          : nextID as int?,
      pid: pid == const $CopyWithPlaceholder()
          ? _value.pid
          // ignore: cast_nullable_to_non_nullable
          : pid as int?,
      file: file == const $CopyWithPlaceholder()
          ? _value.file
          // ignore: cast_nullable_to_non_nullable
          : file as String?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetDnsLog200ResponseCopyWith on GetDnsLog200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetDnsLog200Response.copyWith(...)` or like so:`instanceOfGetDnsLog200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetDnsLog200ResponseCWProxy get copyWith =>
      _$GetDnsLog200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDnsLog200Response _$GetDnsLog200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetDnsLog200Response', json, ($checkedConvert) {
  final val = GetDnsLog200Response(
    log: $checkedConvert(
      'log',
      (v) => (v as List<dynamic>?)
          ?.map((e) => LogLogInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    nextID: $checkedConvert('nextID', (v) => (v as num?)?.toInt()),
    pid: $checkedConvert('pid', (v) => (v as num?)?.toInt()),
    file: $checkedConvert('file', (v) => v as String?),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetDnsLog200ResponseToJson(
  GetDnsLog200Response instance,
) => <String, dynamic>{
  'log': ?instance.log?.map((e) => e.toJson()).toList(),
  'nextID': ?instance.nextID,
  'pid': ?instance.pid,
  'file': ?instance.file,
  'took': ?instance.took,
};
