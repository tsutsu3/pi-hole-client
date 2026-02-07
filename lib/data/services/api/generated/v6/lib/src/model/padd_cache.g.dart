// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'padd_cache.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaddCacheCWProxy {
  PaddCache size(int? size);

  PaddCache inserted(int? inserted);

  PaddCache evicted(int? evicted);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddCache(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddCache call({int? size, int? inserted, int? evicted});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaddCache.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaddCache.copyWith.fieldName(...)`
class _$PaddCacheCWProxyImpl implements _$PaddCacheCWProxy {
  const _$PaddCacheCWProxyImpl(this._value);

  final PaddCache _value;

  @override
  PaddCache size(int? size) => this(size: size);

  @override
  PaddCache inserted(int? inserted) => this(inserted: inserted);

  @override
  PaddCache evicted(int? evicted) => this(evicted: evicted);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaddCache(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaddCache(...).copyWith(id: 12, name: "My name")
  /// ````
  PaddCache call({
    Object? size = const $CopyWithPlaceholder(),
    Object? inserted = const $CopyWithPlaceholder(),
    Object? evicted = const $CopyWithPlaceholder(),
  }) {
    return PaddCache(
      size: size == const $CopyWithPlaceholder()
          ? _value.size
          // ignore: cast_nullable_to_non_nullable
          : size as int?,
      inserted: inserted == const $CopyWithPlaceholder()
          ? _value.inserted
          // ignore: cast_nullable_to_non_nullable
          : inserted as int?,
      evicted: evicted == const $CopyWithPlaceholder()
          ? _value.evicted
          // ignore: cast_nullable_to_non_nullable
          : evicted as int?,
    );
  }
}

extension $PaddCacheCopyWith on PaddCache {
  /// Returns a callable class that can be used as follows: `instanceOfPaddCache.copyWith(...)` or like so:`instanceOfPaddCache.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaddCacheCWProxy get copyWith => _$PaddCacheCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaddCache _$PaddCacheFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaddCache', json, ($checkedConvert) {
      final val = PaddCache(
        size: $checkedConvert('size', (v) => (v as num?)?.toInt()),
        inserted: $checkedConvert('inserted', (v) => (v as num?)?.toInt()),
        evicted: $checkedConvert('evicted', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PaddCacheToJson(PaddCache instance) => <String, dynamic>{
  'size': ?instance.size,
  'inserted': ?instance.inserted,
  'evicted': ?instance.evicted,
};
