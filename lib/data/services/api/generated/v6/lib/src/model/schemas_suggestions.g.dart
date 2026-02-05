// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas_suggestions.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SchemasSuggestionsCWProxy {
  SchemasSuggestions clients(List<SchemasSuggestionsClientsInner>? clients);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasSuggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasSuggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasSuggestions call({List<SchemasSuggestionsClientsInner>? clients});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSchemasSuggestions.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSchemasSuggestions.copyWith.fieldName(...)`
class _$SchemasSuggestionsCWProxyImpl implements _$SchemasSuggestionsCWProxy {
  const _$SchemasSuggestionsCWProxyImpl(this._value);

  final SchemasSuggestions _value;

  @override
  SchemasSuggestions clients(List<SchemasSuggestionsClientsInner>? clients) =>
      this(clients: clients);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SchemasSuggestions(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SchemasSuggestions(...).copyWith(id: 12, name: "My name")
  /// ````
  SchemasSuggestions call({Object? clients = const $CopyWithPlaceholder()}) {
    return SchemasSuggestions(
      clients: clients == const $CopyWithPlaceholder()
          ? _value.clients
          // ignore: cast_nullable_to_non_nullable
          : clients as List<SchemasSuggestionsClientsInner>?,
    );
  }
}

extension $SchemasSuggestionsCopyWith on SchemasSuggestions {
  /// Returns a callable class that can be used as follows: `instanceOfSchemasSuggestions.copyWith(...)` or like so:`instanceOfSchemasSuggestions.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SchemasSuggestionsCWProxy get copyWith =>
      _$SchemasSuggestionsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemasSuggestions _$SchemasSuggestionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SchemasSuggestions', json, ($checkedConvert) {
      final val = SchemasSuggestions(
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
      );
      return val;
    });

Map<String, dynamic> _$SchemasSuggestionsToJson(SchemasSuggestions instance) =>
    <String, dynamic>{
      'clients': ?instance.clients?.map((e) => e.toJson()).toList(),
    };
