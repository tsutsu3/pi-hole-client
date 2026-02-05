// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_teleporter200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PostTeleporter200ResponseCWProxy {
  PostTeleporter200Response processed(List<String>? processed);

  PostTeleporter200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporter200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporter200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporter200Response call({List<String>? processed, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPostTeleporter200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPostTeleporter200Response.copyWith.fieldName(...)`
class _$PostTeleporter200ResponseCWProxyImpl
    implements _$PostTeleporter200ResponseCWProxy {
  const _$PostTeleporter200ResponseCWProxyImpl(this._value);

  final PostTeleporter200Response _value;

  @override
  PostTeleporter200Response processed(List<String>? processed) =>
      this(processed: processed);

  @override
  PostTeleporter200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PostTeleporter200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PostTeleporter200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  PostTeleporter200Response call({
    Object? processed = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return PostTeleporter200Response(
      processed: processed == const $CopyWithPlaceholder()
          ? _value.processed
          // ignore: cast_nullable_to_non_nullable
          : processed as List<String>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $PostTeleporter200ResponseCopyWith on PostTeleporter200Response {
  /// Returns a callable class that can be used as follows: `instanceOfPostTeleporter200Response.copyWith(...)` or like so:`instanceOfPostTeleporter200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PostTeleporter200ResponseCWProxy get copyWith =>
      _$PostTeleporter200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTeleporter200Response _$PostTeleporter200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PostTeleporter200Response', json, ($checkedConvert) {
  final val = PostTeleporter200Response(
    processed: $checkedConvert(
      'processed',
      (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$PostTeleporter200ResponseToJson(
  PostTeleporter200Response instance,
) => <String, dynamic>{
  'processed': ?instance.processed,
  'took': ?instance.took,
};
