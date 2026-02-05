// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_clients.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TopClientsCWProxy {
  TopClients clients(List<TopClientsClientsInner>? clients);

  TopClients totalQueries(int? totalQueries);

  TopClients blockedQueries(int? blockedQueries);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopClients(...).copyWith(id: 12, name: "My name")
  /// ````
  TopClients call({
    List<TopClientsClientsInner>? clients,
    int? totalQueries,
    int? blockedQueries,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTopClients.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTopClients.copyWith.fieldName(...)`
class _$TopClientsCWProxyImpl implements _$TopClientsCWProxy {
  const _$TopClientsCWProxyImpl(this._value);

  final TopClients _value;

  @override
  TopClients clients(List<TopClientsClientsInner>? clients) =>
      this(clients: clients);

  @override
  TopClients totalQueries(int? totalQueries) =>
      this(totalQueries: totalQueries);

  @override
  TopClients blockedQueries(int? blockedQueries) =>
      this(blockedQueries: blockedQueries);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopClients(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopClients(...).copyWith(id: 12, name: "My name")
  /// ````
  TopClients call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
    Object? blockedQueries = const $CopyWithPlaceholder(),
  }) {
    return TopClients(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<TopClientsClientsInner>?,
      totalQueries: totalQueries == const $CopyWithPlaceholder()
          ? _value.totalQueries
          // ignore: cast_nullable_to_non_nullable
          : totalQueries as int?,
      blockedQueries: blockedQueries == const $CopyWithPlaceholder()
          ? _value.blockedQueries
          // ignore: cast_nullable_to_non_nullable
          : blockedQueries as int?,
    );
  }
}

extension $TopClientsCopyWith on TopClients {
  /// Returns a callable class that can be used as follows: `instanceOfTopClients.copyWith(...)` or like so:`instanceOfTopClients.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TopClientsCWProxy get copyWith => _$TopClientsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopClients _$TopClientsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TopClients',
  json,
  ($checkedConvert) {
    final val = TopClients(
      clients: $checkedConvert(
        'clients',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TopClientsClientsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      totalQueries: $checkedConvert(
        'total_queries',
        (v) => (v as num?)?.toInt(),
      ),
      blockedQueries: $checkedConvert(
        'blocked_queries',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalQueries': 'total_queries',
    'blockedQueries': 'blocked_queries',
  },
);

Map<String, dynamic> _$TopClientsToJson(TopClients instance) =>
    <String, dynamic>{
      'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
      'total_queries': ?instance.totalQueries,
      'blocked_queries': ?instance.blockedQueries,
    };
