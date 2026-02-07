// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_queries_queries_inner_client.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasQueriesQueriesInnerClientCWProxy {
  SchemasQueriesQueriesInnerClient ip(String? ip);

  SchemasQueriesQueriesInnerClient name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerClient(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerClient call({String? ip, String? name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasQueriesQueriesInnerClient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasQueriesQueriesInnerClient.copyWith.fieldName(...)`
class _$SchemasQueriesQueriesInnerClientCWProxyImpl
    implements _$SchemasQueriesQueriesInnerClientCWProxy {
  const _$SchemasQueriesQueriesInnerClientCWProxyImpl(this._value);

  final SchemasQueriesQueriesInnerClient _value;

  @override
  SchemasQueriesQueriesInnerClient ip(String? ip) => this(ip: ip);

  @override
  SchemasQueriesQueriesInnerClient name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasQueriesQueriesInnerClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasQueriesQueriesInnerClient(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasQueriesQueriesInnerClient call({
    Object? ip = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return SchemasQueriesQueriesInnerClient(
      ip: ip == const $CopyWithPlaceholder()
          ? _value.ip
          // ignore: cast_nullable_to_non_nullable
          : ip as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $SchemasQueriesQueriesInnerClientCopyWith
    on SchemasQueriesQueriesInnerClient {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasQueriesQueriesInnerClient.copyWith(...)` or like so:`instanceOfSchemasQueriesQueriesInnerClient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasQueriesQueriesInnerClientCWProxy get copyWith =>
      _$SchemasQueriesQueriesInnerClientCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasQueriesQueriesInnerClient _$SchemasQueriesQueriesInnerClientFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('SchemasQueriesQueriesInnerClient', json, ($checkedConvert) {
      final val = SchemasQueriesQueriesInnerClient(
        ip: $checkedConvert('ip', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SchemasQueriesQueriesInnerClientToJson(
  SchemasQueriesQueriesInnerClient instance,
) => <String, dynamic>{'ip': ?instance.ip, 'name': ?instance.name};
