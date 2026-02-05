// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CountCWProxy {
  Count count(int? count);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Count(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Count(...).copyWith(id: 12, name: "My name")
  /// ````
  Count call({int? count});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCount.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCount.copyWith.fieldName(...)`
class _$CountCWProxyImpl implements _$CountCWProxy {
  const _$CountCWProxyImpl(this._value);

  final Count _value;

  @override
  Count count(int? count) => this(count: count);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Count(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Count(...).copyWith(id: 12, name: "My name")
  /// ````
  Count call({Object? count = const $CopyWithPlaceholder()}) {
    return Count(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
    );
  }
}

extension $CountCopyWith on Count {
  /// Returns a callable class that can be used as follows: `instanceOfCount.copyWith(...)` or like so:`instanceOfCount.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CountCWProxy get copyWith => _$CountCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Count _$CountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Count', json, ($checkedConvert) {
      final val = Count(
        count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$CountToJson(Count instance) => <String, dynamic>{
  'count': ?instance.count,
};
