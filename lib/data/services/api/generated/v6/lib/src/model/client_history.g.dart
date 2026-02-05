// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_history.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientHistoryCWProxy {
  ClientHistory clients(Map<String, ClientHistoryClientsValue>? clients);

  ClientHistory history(List<ClientHistoryHistoryInner>? history);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistory call({
    Map<String, ClientHistoryClientsValue>? clients,
    List<ClientHistoryHistoryInner>? history,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientHistory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientHistory.copyWith.fieldName(...)`
class _$ClientHistoryCWProxyImpl implements _$ClientHistoryCWProxy {
  const _$ClientHistoryCWProxyImpl(this._value);

  final ClientHistory _value;

  @override
  ClientHistory clients(Map<String, ClientHistoryClientsValue>? clients) =>
      this(clients: clients);

  @override
  ClientHistory history(List<ClientHistoryHistoryInner>? history) =>
      this(history: history);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientHistory call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? history = const $CopyWithPlaceholder(),
  }) {
    return ClientHistory(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as Map<String, ClientHistoryClientsValue>?,
      history: history == const $CopyWithPlaceholder()
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<ClientHistoryHistoryInner>?,
    );
  }
}

extension $ClientHistoryCopyWith on ClientHistory {
  /// Returns a callable class that can be used as follows: `instanceOfClientHistory.copyWith(...)` or like so:`instanceOfClientHistory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientHistoryCWProxy get copyWith => _$ClientHistoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientHistory _$ClientHistoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientHistory', json, ($checkedConvert) {
      final val = ClientHistory(
        clients: $checkedConvert(
          'clients',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              ClientHistoryClientsValue.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        history: $checkedConvert(
          'history',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => ClientHistoryHistoryInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientHistoryToJson(ClientHistory instance) =>
    <String, dynamic>{
      'clients': ?instance.clients?.map((k, e) => MapEntry(k, e.toJson())),
      'history': ?instance.history?.map((e) => e.toJson()).toList(),
    };
