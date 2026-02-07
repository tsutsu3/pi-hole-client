// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_object.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientObjectCWProxy {
  ClientObject client(String? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientObject(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientObject call({String? client});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientObject.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientObject.copyWith.fieldName(...)`
class _$ClientObjectCWProxyImpl implements _$ClientObjectCWProxy {
  const _$ClientObjectCWProxyImpl(this._value);

  final ClientObject _value;

  @override
  ClientObject client(String? client) => this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientObject(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientObject(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientObject call({Object? client = const $CopyWithPlaceholder()}) {
    return ClientObject(
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as String?,
    );
  }
}

extension $ClientObjectCopyWith on ClientObject {
  /// Returns a callable class that can be used as follows: `instanceOfClientObject.copyWith(...)` or like so:`instanceOfClientObject.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientObjectCWProxy get copyWith => _$ClientObjectCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientObject _$ClientObjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientObject', json, ($checkedConvert) {
      final val = ClientObject(
        client: $checkedConvert('client', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ClientObjectToJson(ClientObject instance) =>
    <String, dynamic>{'client': ?instance.client};
