// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_get.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ListsGetCWProxy {
  ListsGet lists(List<ListsGetListsInner>? lists);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsGet call({List<ListsGetListsInner>? lists});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfListsGet.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfListsGet.copyWith.fieldName(...)`
class _$ListsGetCWProxyImpl implements _$ListsGetCWProxy {
  const _$ListsGetCWProxyImpl(this._value);

  final ListsGet _value;

  @override
  ListsGet lists(List<ListsGetListsInner>? lists) => this(lists: lists);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ListsGet(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ListsGet(...).copyWith(id: 12, name: "My name")
  /// ````
  ListsGet call({Object? lists = const $CopyWithPlaceholder()}) {
    return ListsGet(
      lists: lists == const $CopyWithPlaceholder()
          ? _value.lists
          // ignore: cast_nullable_to_non_nullable
          : lists as List<ListsGetListsInner>?,
    );
  }
}

extension $ListsGetCopyWith on ListsGet {
  /// Returns a callable class that can be used as follows: `instanceOfListsGet.copyWith(...)` or like so:`instanceOfListsGet.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ListsGetCWProxy get copyWith => _$ListsGetCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsGet _$ListsGetFromJson(Map<String, dynamic> json) => $checkedCreate(
  'ListsGet',
  json,
  ($checkedConvert) {
    final val = ListsGet(
      lists: $checkedConvert(
        'lists',
        (v) => (v as List<dynamic>?)
            ?.map((e) => ListsGetListsInner.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ListsGetToJson(ListsGet instance) => <String, dynamic>{
  'lists': ?instance.lists?.map((e) => e.toJson()).toList(),
};
