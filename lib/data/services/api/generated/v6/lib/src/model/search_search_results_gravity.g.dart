// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_search_results_gravity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchSearchResultsGravityCWProxy {
  SearchSearchResultsGravity allow(int? allow);

  SearchSearchResultsGravity block(int? block);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResultsGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResultsGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResultsGravity call({int? allow, int? block});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchSearchResultsGravity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchSearchResultsGravity.copyWith.fieldName(...)`
class _$SearchSearchResultsGravityCWProxyImpl
    implements _$SearchSearchResultsGravityCWProxy {
  const _$SearchSearchResultsGravityCWProxyImpl(this._value);

  final SearchSearchResultsGravity _value;

  @override
  SearchSearchResultsGravity allow(int? allow) => this(allow: allow);

  @override
  SearchSearchResultsGravity block(int? block) => this(block: block);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchSearchResultsGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchSearchResultsGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchSearchResultsGravity call({
    Object? allow = const $CopyWithPlaceholder(),
    Object? block = const $CopyWithPlaceholder(),
  }) {
    return SearchSearchResultsGravity(
      allow: allow == const $CopyWithPlaceholder()
          ? _value.allow
          // ignore: cast_nullable_to_non_nullable
          : allow as int?,
      block: block == const $CopyWithPlaceholder()
          ? _value.block
          // ignore: cast_nullable_to_non_nullable
          : block as int?,
    );
  }
}

extension $SearchSearchResultsGravityCopyWith on SearchSearchResultsGravity {
  /// Returns a callable class that can be used as follows: `instanceOfSearchSearchResultsGravity.copyWith(...)` or like so:`instanceOfSearchSearchResultsGravity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchSearchResultsGravityCWProxy get copyWith =>
      _$SearchSearchResultsGravityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSearchResultsGravity _$SearchSearchResultsGravityFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SearchSearchResultsGravity', json, ($checkedConvert) {
  final val = SearchSearchResultsGravity(
    allow: $checkedConvert('allow', (v) => (v as num?)?.toInt()),
    block: $checkedConvert('block', (v) => (v as num?)?.toInt()),
  );
  return val;
});

Map<String, dynamic> _$SearchSearchResultsGravityToJson(
  SearchSearchResultsGravity instance,
) => <String, dynamic>{'allow': ?instance.allow, 'block': ?instance.block};
