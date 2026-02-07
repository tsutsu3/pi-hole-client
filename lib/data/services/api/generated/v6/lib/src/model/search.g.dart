// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchCWProxy {
  Search search(SearchSearch? search);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Search(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Search(...).copyWith(id: 12, name: "My name")
  /// ````
  Search call({SearchSearch? search});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearch.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearch.copyWith.fieldName(...)`
class _$SearchCWProxyImpl implements _$SearchCWProxy {
  const _$SearchCWProxyImpl(this._value);

  final Search _value;

  @override
  Search search(SearchSearch? search) => this(search: search);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Search(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Search(...).copyWith(id: 12, name: "My name")
  /// ````
  Search call({Object? search = const $CopyWithPlaceholder()}) {
    return Search(
      search: search == const $CopyWithPlaceholder()
          ? _value.search
          // ignore: cast_nullable_to_non_nullable
          : search as SearchSearch?,
    );
  }
}

extension $SearchCopyWith on Search {
  /// Returns a callable class that can be used as follows: `instanceOfSearch.copyWith(...)` or like so:`instanceOfSearch.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchCWProxy get copyWith => _$SearchCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Search',
  json,
  ($checkedConvert) {
    final val = Search(
      search: $checkedConvert(
        'search',
        (v) =>
            v == null ? null : SearchSearch.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
  'search': ?instance.search?.toJson(),
};
