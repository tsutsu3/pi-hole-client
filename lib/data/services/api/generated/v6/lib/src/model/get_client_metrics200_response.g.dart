// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_client_metrics200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetClientMetrics200ResponseCWProxy {
  GetClientMetrics200Response clients(
    Map<String, ClientHistoryClientsValue>? clients,
  );

  GetClientMetrics200Response history(List<ClientHistoryHistoryInner>? history);

  GetClientMetrics200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClientMetrics200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClientMetrics200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClientMetrics200Response call({
    Map<String, ClientHistoryClientsValue>? clients,
    List<ClientHistoryHistoryInner>? history,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetClientMetrics200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetClientMetrics200Response.copyWith.fieldName(...)`
class _$GetClientMetrics200ResponseCWProxyImpl
    implements _$GetClientMetrics200ResponseCWProxy {
  const _$GetClientMetrics200ResponseCWProxyImpl(this._value);

  final GetClientMetrics200Response _value;

  @override
  GetClientMetrics200Response clients(
    Map<String, ClientHistoryClientsValue>? clients,
  ) => this(clients: clients);

  @override
  GetClientMetrics200Response history(
    List<ClientHistoryHistoryInner>? history,
  ) => this(history: history);

  @override
  GetClientMetrics200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClientMetrics200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClientMetrics200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClientMetrics200Response call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? history = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetClientMetrics200Response(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as Map<String, ClientHistoryClientsValue>?,
      history: history == const $CopyWithPlaceholder()
          ? _value.history
          // ignore: cast_nullable_to_non_nullable
          : history as List<ClientHistoryHistoryInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetClientMetrics200ResponseCopyWith on GetClientMetrics200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetClientMetrics200Response.copyWith(...)` or like so:`instanceOfGetClientMetrics200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetClientMetrics200ResponseCWProxy get copyWith =>
      _$GetClientMetrics200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetClientMetrics200Response _$GetClientMetrics200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetClientMetrics200Response', json, ($checkedConvert) {
  final val = GetClientMetrics200Response(
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
            (e) =>
                ClientHistoryHistoryInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetClientMetrics200ResponseToJson(
  GetClientMetrics200Response instance,
) => <String, dynamic>{
  'clients': ?instance.clients?.map((k, e) => MapEntry(k, e.toJson())),
  'history': ?instance.history?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
