// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_clients200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetClients200ResponseCWProxy {
  GetClients200Response clients(List<ClientsGetClientsInner>? clients);

  GetClients200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClients200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClients200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClients200Response call({
    List<ClientsGetClientsInner>? clients,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetClients200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetClients200Response.copyWith.fieldName(...)`
class _$GetClients200ResponseCWProxyImpl
    implements _$GetClients200ResponseCWProxy {
  const _$GetClients200ResponseCWProxyImpl(this._value);

  final GetClients200Response _value;

  @override
  GetClients200Response clients(List<ClientsGetClientsInner>? clients) =>
      this(clients: clients);

  @override
  GetClients200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClients200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClients200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClients200Response call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetClients200Response(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<ClientsGetClientsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetClients200ResponseCopyWith on GetClients200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetClients200Response.copyWith(...)` or like so:`instanceOfGetClients200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetClients200ResponseCWProxy get copyWith =>
      _$GetClients200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetClients200Response _$GetClients200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetClients200Response', json, ($checkedConvert) {
  final val = GetClients200Response(
    clients: $checkedConvert(
      'clients',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ClientsGetClientsInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetClients200ResponseToJson(
  GetClients200Response instance,
) => <String, dynamic>{
  'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
