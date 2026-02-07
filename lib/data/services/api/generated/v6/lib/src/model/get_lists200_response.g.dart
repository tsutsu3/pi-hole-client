// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lists200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetLists200ResponseCWProxy {
  GetLists200Response lists(List<ListsGetListsInner>? lists);

  GetLists200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLists200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLists200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLists200Response call({List<ListsGetListsInner>? lists, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetLists200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetLists200Response.copyWith.fieldName(...)`
class _$GetLists200ResponseCWProxyImpl implements _$GetLists200ResponseCWProxy {
  const _$GetLists200ResponseCWProxyImpl(this._value);

  final GetLists200Response _value;

  @override
  GetLists200Response lists(List<ListsGetListsInner>? lists) =>
      this(lists: lists);

  @override
  GetLists200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetLists200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetLists200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetLists200Response call({
    Object? lists = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetLists200Response(
      lists: lists == const $CopyWithPlaceholder()
          ? _value.lists
          // ignore: cast_nullable_to_non_nullable
          : lists as List<ListsGetListsInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetLists200ResponseCopyWith on GetLists200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetLists200Response.copyWith(...)` or like so:`instanceOfGetLists200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetLists200ResponseCWProxy get copyWith =>
      _$GetLists200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLists200Response _$GetLists200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GetLists200Response', json, ($checkedConvert) {
      final val = GetLists200Response(
        lists: $checkedConvert(
          'lists',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => ListsGetListsInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$GetLists200ResponseToJson(
  GetLists200Response instance,
) => <String, dynamic>{
  'lists': ?instance.lists?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
