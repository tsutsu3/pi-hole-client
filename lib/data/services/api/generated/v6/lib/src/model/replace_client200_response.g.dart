// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_client200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceClient200ResponseCWProxy {
  ReplaceClient200Response clients(List<ClientsGetClientsInner>? clients);

  ReplaceClient200Response processed(
    ComponentsSchemasListsProcessedProcessed? processed,
  );

  ReplaceClient200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceClient200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceClient200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceClient200Response call({
    List<ClientsGetClientsInner>? clients,
    ComponentsSchemasListsProcessedProcessed? processed,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceClient200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceClient200Response.copyWith.fieldName(...)`
class _$ReplaceClient200ResponseCWProxyImpl
    implements _$ReplaceClient200ResponseCWProxy {
  const _$ReplaceClient200ResponseCWProxyImpl(this._value);

  final ReplaceClient200Response _value;

  @override
  ReplaceClient200Response clients(List<ClientsGetClientsInner>? clients) =>
      this(clients: clients);

  @override
  ReplaceClient200Response processed(
    ComponentsSchemasListsProcessedProcessed? processed,
  ) => this(processed: processed);

  @override
  ReplaceClient200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceClient200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceClient200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceClient200Response call({
    Object? clients = const $CopyWithPlaceholder(),
    Object? processed = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceClient200Response(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<ClientsGetClientsInner>?,
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ComponentsSchemasListsProcessedProcessed?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceClient200ResponseCopyWith on ReplaceClient200Response {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceClient200Response.copyWith(...)` or like so:`instanceOfReplaceClient200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceClient200ResponseCWProxy get copyWith =>
      _$ReplaceClient200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceClient200Response _$ReplaceClient200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceClient200Response', json, ($checkedConvert) {
  final val = ReplaceClient200Response(
    clients: $checkedConvert(
      'clients',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => ClientsGetClientsInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : ComponentsSchemasListsProcessedProcessed.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceClient200ResponseToJson(
  ReplaceClient200Response instance,
) => <String, dynamic>{
  'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
  'processed': ?instance.processed?.toJson(),
  'took': ?instance.took,
};
