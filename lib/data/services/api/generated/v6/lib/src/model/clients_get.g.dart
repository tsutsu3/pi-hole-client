// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_get.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientsGetCWProxy {
  ClientsGet clients(List<ClientsGetClientsInner>? clients);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsGet call({List<ClientsGetClientsInner>? clients});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientsGet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientsGet.copyWith.fieldName(...)`
class _$ClientsGetCWProxyImpl implements _$ClientsGetCWProxy {
  const _$ClientsGetCWProxyImpl(this._value);

  final ClientsGet _value;

  @override
  ClientsGet clients(List<ClientsGetClientsInner>? clients) =>
      this(clients: clients);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsGet call({Object? clients = const $CopyWithPlaceholder()}) {
    return ClientsGet(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<ClientsGetClientsInner>?,
    );
  }
}

extension $ClientsGetCopyWith on ClientsGet {
  /// Returns a callable class that can be used as follows: `instanceOfClientsGet.copyWith(...)` or like so:`instanceOfClientsGet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientsGetCWProxy get copyWith => _$ClientsGetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsGet _$ClientsGetFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientsGet', json, ($checkedConvert) {
      final val = ClientsGet(
        clients: $checkedConvert(
          'clients',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) =>
                    ClientsGetClientsInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientsGetToJson(ClientsGet instance) =>
    <String, dynamic>{
      'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
    };
