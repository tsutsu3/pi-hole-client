// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_maybe_array.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientMaybeArrayCWProxy {
  ClientMaybeArray client(StringOrList? client);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientMaybeArray call({StringOrList? client});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientMaybeArray.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientMaybeArray.copyWith.fieldName(...)`
class _$ClientMaybeArrayCWProxyImpl implements _$ClientMaybeArrayCWProxy {
  const _$ClientMaybeArrayCWProxyImpl(this._value);

  final ClientMaybeArray _value;

  @override
  ClientMaybeArray client(StringOrList? client) => this(client: client);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientMaybeArray(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientMaybeArray(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientMaybeArray call({Object? client = const $CopyWithPlaceholder()}) {
    return ClientMaybeArray(
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as StringOrList?,
    );
  }
}

extension $ClientMaybeArrayCopyWith on ClientMaybeArray {
  /// Returns a callable class that can be used as follows: `instanceOfClientMaybeArray.copyWith(...)` or like so:`instanceOfClientMaybeArray.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientMaybeArrayCWProxy get copyWith => _$ClientMaybeArrayCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientMaybeArray _$ClientMaybeArrayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientMaybeArray', json, ($checkedConvert) {
      final val = ClientMaybeArray(
        client: $checkedConvert(
          'client',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientMaybeArrayToJson(ClientMaybeArray instance) =>
    <String, dynamic>{'client': ?instance.client?.toJson()};
