// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unicode.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnicodeCWProxy {
  Unicode unicode(String? unicode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Unicode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Unicode(...).copyWith(id: 12, name: "My name")
  /// ````
  Unicode call({String? unicode});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnicode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnicode.copyWith.fieldName(...)`
class _$UnicodeCWProxyImpl implements _$UnicodeCWProxy {
  const _$UnicodeCWProxyImpl(this._value);

  final Unicode _value;

  @override
  Unicode unicode(String? unicode) => this(unicode: unicode);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Unicode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Unicode(...).copyWith(id: 12, name: "My name")
  /// ````
  Unicode call({Object? unicode = const $CopyWithPlaceholder()}) {
    return Unicode(
      unicode: unicode == const $CopyWithPlaceholder()
          ? _value.unicode
          // ignore: cast_nullable_to_non_nullable
          : unicode as String?,
    );
  }
}

extension $UnicodeCopyWith on Unicode {
  /// Returns a callable class that can be used as follows: `instanceOfUnicode.copyWith(...)` or like so:`instanceOfUnicode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnicodeCWProxy get copyWith => _$UnicodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Unicode _$UnicodeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Unicode', json, ($checkedConvert) {
      final val = Unicode(
        unicode: $checkedConvert('unicode', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$UnicodeToJson(Unicode instance) => <String, dynamic>{
  'unicode': ?instance.unicode,
};
