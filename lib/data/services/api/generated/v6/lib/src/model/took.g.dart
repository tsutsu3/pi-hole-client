// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'took.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TookCWProxy {
  Took took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Took(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Took(...).copyWith(id: 12, name: "My name")
  /// ````
  Took call({num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTook.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTook.copyWith.fieldName(...)`
class _$TookCWProxyImpl implements _$TookCWProxy {
  const _$TookCWProxyImpl(this._value);

  final Took _value;

  @override
  Took took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Took(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Took(...).copyWith(id: 12, name: "My name")
  /// ````
  Took call({Object? took = const $CopyWithPlaceholder()}) {
    return Took(
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $TookCopyWith on Took {
  /// Returns a callable class that can be used as follows: `instanceOfTook.copyWith(...)` or like so:`instanceOfTook.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TookCWProxy get copyWith => _$TookCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Took _$TookFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Took', json, ($checkedConvert) {
      final val = Took(took: $checkedConvert('took', (v) => v as num?));
      return val;
    });

Map<String, dynamic> _$TookToJson(Took instance) => <String, dynamic>{
  'took': ?instance.took,
};
