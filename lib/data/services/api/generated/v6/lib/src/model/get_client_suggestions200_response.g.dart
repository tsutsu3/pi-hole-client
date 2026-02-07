// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_client_suggestions200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetClientSuggestions200ResponseCWProxy {
  GetClientSuggestions200Response clients(
    List<SchemasSuggestionsClientsInner>? clients,
  );

  GetClientSuggestions200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClientSuggestions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClientSuggestions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClientSuggestions200Response call({
    List<SchemasSuggestionsClientsInner>? clients,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetClientSuggestions200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetClientSuggestions200Response.copyWith.fieldName(...)`
class _$GetClientSuggestions200ResponseCWProxyImpl
    implements _$GetClientSuggestions200ResponseCWProxy {
  const _$GetClientSuggestions200ResponseCWProxyImpl(this._value);

  final GetClientSuggestions200Response _value;

  @override
  GetClientSuggestions200Response clients(
    List<SchemasSuggestionsClientsInner>? clients,
  ) => this(clients: clients);

  @override
  GetClientSuggestions200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetClientSuggestions200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetClientSuggestions200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetClientSuggestions200Response call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetClientSuggestions200Response(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<SchemasSuggestionsClientsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetClientSuggestions200ResponseCopyWith
    on GetClientSuggestions200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetClientSuggestions200Response.copyWith(...)` or like so:`instanceOfGetClientSuggestions200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetClientSuggestions200ResponseCWProxy get copyWith =>
      _$GetClientSuggestions200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetClientSuggestions200Response _$GetClientSuggestions200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetClientSuggestions200Response', json, ($checkedConvert) {
  final val = GetClientSuggestions200Response(
    clients: $checkedConvert(
      'clients',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SchemasSuggestionsClientsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetClientSuggestions200ResponseToJson(
  GetClientSuggestions200Response instance,
) => <String, dynamic>{
  'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
