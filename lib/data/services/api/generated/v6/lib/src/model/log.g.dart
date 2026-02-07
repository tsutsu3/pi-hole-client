// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LogCWProxy {
  Log log(List<LogLogInner>? log);

  Log nextID(int? nextID);

  Log pid(int? pid);

  Log file(String? file);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Log(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Log(...).copyWith(id: 12, name: "My name")
  /// ````
  Log call({List<LogLogInner>? log, int? nextID, int? pid, String? file});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLog.copyWith.fieldName(...)`
class _$LogCWProxyImpl implements _$LogCWProxy {
  const _$LogCWProxyImpl(this._value);

  final Log _value;

  @override
  Log log(List<LogLogInner>? log) => this(log: log);

  @override
  Log nextID(int? nextID) => this(nextID: nextID);

  @override
  Log pid(int? pid) => this(pid: pid);

  @override
  Log file(String? file) => this(file: file);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Log(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Log(...).copyWith(id: 12, name: "My name")
  /// ````
  Log call({
    Object? log = const $CopyWithPlaceholder(),
    Object? nextID = const $CopyWithPlaceholder(),
    Object? pid = const $CopyWithPlaceholder(),
    Object? file = const $CopyWithPlaceholder(),
  }) {
    return Log(
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
    );
  }
}

extension $LogCopyWith on Log {
  /// Returns a callable class that can be used as follows: `instanceOfLog.copyWith(...)` or like so:`instanceOfLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LogCWProxy get copyWith => _$LogCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Log', json, ($checkedConvert) {
      final val = Log(
        log: $checkedConvert(
          'log',
          (v) => (v as List<dynamic>?)
              ?.map((e) => LogLogInner.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        nextID: $checkedConvert('nextID', (v) => (v as num?)?.toInt()),
        pid: $checkedConvert('pid', (v) => (v as num?)?.toInt()),
        file: $checkedConvert('file', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
  'log': ?instance.log?.map((e) => e.toJson()).toList(),
  'nextID': ?instance.nextID,
  'pid': ?instance.pid,
  'file': ?instance.file,
};
