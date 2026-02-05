// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ftl_ftl_database.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FtlFtlDatabaseCWProxy {
  FtlFtlDatabase gravity(int? gravity);

  FtlFtlDatabase groups(int? groups);

  FtlFtlDatabase lists(int? lists);

  FtlFtlDatabase clients(int? clients);

  FtlFtlDatabase domains(FtlFtlDatabaseDomains? domains);

  FtlFtlDatabase regex(FtlFtlDatabaseRegex? regex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabase(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabase call({
    int? gravity,
    int? groups,
    int? lists,
    int? clients,
    FtlFtlDatabaseDomains? domains,
    FtlFtlDatabaseRegex? regex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFtlFtlDatabase.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFtlFtlDatabase.copyWith.fieldName(...)`
class _$FtlFtlDatabaseCWProxyImpl implements _$FtlFtlDatabaseCWProxy {
  const _$FtlFtlDatabaseCWProxyImpl(this._value);

  final FtlFtlDatabase _value;

  @override
  FtlFtlDatabase gravity(int? gravity) => this(gravity: gravity);

  @override
  FtlFtlDatabase groups(int? groups) => this(groups: groups);

  @override
  FtlFtlDatabase lists(int? lists) => this(lists: lists);

  @override
  FtlFtlDatabase clients(int? clients) => this(clients: clients);

  @override
  FtlFtlDatabase domains(FtlFtlDatabaseDomains? domains) =>
      this(domains: domains);

  @override
  FtlFtlDatabase regex(FtlFtlDatabaseRegex? regex) => this(regex: regex);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FtlFtlDatabase(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FtlFtlDatabase(...).copyWith(id: 12, name: "My name")
  /// ````
  FtlFtlDatabase call({
    Object? gravity = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? lists = const $CopyWithPlaceholder(),
    Object? clients = const $CopyWithPlaceholder(),
    Object? domains = const $CopyWithPlaceholder(),
    Object? regex = const $CopyWithPlaceholder(),
  }) {
    return FtlFtlDatabase(
      gravity: gravity == const $CopyWithPlaceholder()
          ? _value.gravity
          // ignore: cast_nullable_to_non_nullable
          : gravity as int?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as int?,
      lists: lists == const $CopyWithPlaceholder()
          ? _value.lists
          // ignore: cast_nullable_to_non_nullable
          : lists as int?,
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as int?,
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as FtlFtlDatabaseDomains?,
      regex: regex == const $CopyWithPlaceholder()
          ? _value.regex
          // ignore: cast_nullable_to_non_nullable
          : regex as FtlFtlDatabaseRegex?,
    );
  }
}

extension $FtlFtlDatabaseCopyWith on FtlFtlDatabase {
  /// Returns a callable class that can be used as follows: `instanceOfFtlFtlDatabase.copyWith(...)` or like so:`instanceOfFtlFtlDatabase.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FtlFtlDatabaseCWProxy get copyWith => _$FtlFtlDatabaseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FtlFtlDatabase _$FtlFtlDatabaseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('FtlFtlDatabase', json, ($checkedConvert) {
      final val = FtlFtlDatabase(
        gravity: $checkedConvert('gravity', (v) => (v as num?)?.toInt()),
        groups: $checkedConvert('groups', (v) => (v as num?)?.toInt()),
        lists: $checkedConvert('lists', (v) => (v as num?)?.toInt()),
        clients: $checkedConvert('clients', (v) => (v as num?)?.toInt()),
        domains: $checkedConvert(
          'domains',
          (v) => v == null
              ? null
              : FtlFtlDatabaseDomains.fromJson(v as Map<String, dynamic>),
        ),
        regex: $checkedConvert(
          'regex',
          (v) => v == null
              ? null
              : FtlFtlDatabaseRegex.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$FtlFtlDatabaseToJson(FtlFtlDatabase instance) =>
    <String, dynamic>{
      'gravity': ?instance.gravity,
      'groups': ?instance.groups,
      'lists': ?instance.lists,
      'clients': ?instance.clients,
      'domains': ?instance.domains?.toJson(),
      'regex': ?instance.regex?.toJson(),
    };
