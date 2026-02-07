// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_lists200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReplaceLists200ResponseCWProxy {
  ReplaceLists200Response lists(List<ListsGetListsInner>? lists);

  ReplaceLists200Response processed(
    ListsComponentsSchemasListsProcessedProcessed? processed,
  );

  ReplaceLists200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceLists200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceLists200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceLists200Response call({
    List<ListsGetListsInner>? lists,
    ListsComponentsSchemasListsProcessedProcessed? processed,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReplaceLists200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReplaceLists200Response.copyWith.fieldName(...)`
class _$ReplaceLists200ResponseCWProxyImpl
    implements _$ReplaceLists200ResponseCWProxy {
  const _$ReplaceLists200ResponseCWProxyImpl(this._value);

  final ReplaceLists200Response _value;

  @override
  ReplaceLists200Response lists(List<ListsGetListsInner>? lists) =>
      this(lists: lists);

  @override
  ReplaceLists200Response processed(
    ListsComponentsSchemasListsProcessedProcessed? processed,
  ) => this(processed: processed);

  @override
  ReplaceLists200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReplaceLists200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReplaceLists200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ReplaceLists200Response call({
    Object? lists = const $CopyWithPlaceholder(),
    Object? processed = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return ReplaceLists200Response(
      lists: lists == const $CopyWithPlaceholder()
          ? _value.lists
          // ignore: cast_nullable_to_non_nullable
          : lists as List<ListsGetListsInner>?,
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as ListsComponentsSchemasListsProcessedProcessed?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $ReplaceLists200ResponseCopyWith on ReplaceLists200Response {
  /// Returns a callable class that can be used as follows: `instanceOfReplaceLists200Response.copyWith(...)` or like so:`instanceOfReplaceLists200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReplaceLists200ResponseCWProxy get copyWith =>
      _$ReplaceLists200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReplaceLists200Response _$ReplaceLists200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ReplaceLists200Response', json, ($checkedConvert) {
  final val = ReplaceLists200Response(
    lists: $checkedConvert(
      'lists',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ListsGetListsInner.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    processed: $checkedConvert(
      'processed',
      (v) => v == null
          ? null
          : ListsComponentsSchemasListsProcessedProcessed.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$ReplaceLists200ResponseToJson(
  ReplaceLists200Response instance,
) => <String, dynamic>{
  'lists': ?instance.lists?.map((e) => e.toJson()).toList(),
  'processed': ?instance.processed?.toJson(),
  'took': ?instance.took,
};
