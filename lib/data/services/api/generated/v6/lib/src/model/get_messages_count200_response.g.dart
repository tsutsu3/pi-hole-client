// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_count200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMessagesCount200ResponseCWProxy {
  GetMessagesCount200Response count(int? count);

  GetMessagesCount200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMessagesCount200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMessagesCount200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMessagesCount200Response call({int? count, num? took});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMessagesCount200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMessagesCount200Response.copyWith.fieldName(...)`
class _$GetMessagesCount200ResponseCWProxyImpl
    implements _$GetMessagesCount200ResponseCWProxy {
  const _$GetMessagesCount200ResponseCWProxyImpl(this._value);

  final GetMessagesCount200Response _value;

  @override
  GetMessagesCount200Response count(int? count) => this(count: count);

  @override
  GetMessagesCount200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMessagesCount200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMessagesCount200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMessagesCount200Response call({
    Object? count = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMessagesCount200Response(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMessagesCount200ResponseCopyWith on GetMessagesCount200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMessagesCount200Response.copyWith(...)` or like so:`instanceOfGetMessagesCount200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMessagesCount200ResponseCWProxy get copyWith =>
      _$GetMessagesCount200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesCount200Response _$GetMessagesCount200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMessagesCount200Response', json, ($checkedConvert) {
  final val = GetMessagesCount200Response(
    count: $checkedConvert('count', (v) => (v as num?)?.toInt()),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMessagesCount200ResponseToJson(
  GetMessagesCount200Response instance,
) => <String, dynamic>{'count': ?instance.count, 'took': ?instance.took};
