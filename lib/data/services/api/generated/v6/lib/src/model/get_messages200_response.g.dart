// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetMessages200ResponseCWProxy {
  GetMessages200Response messages(List<MessagesMessagesInner>? messages);

  GetMessages200Response took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMessages200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMessages200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMessages200Response call({
    List<MessagesMessagesInner>? messages,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetMessages200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetMessages200Response.copyWith.fieldName(...)`
class _$GetMessages200ResponseCWProxyImpl
    implements _$GetMessages200ResponseCWProxy {
  const _$GetMessages200ResponseCWProxyImpl(this._value);

  final GetMessages200Response _value;

  @override
  GetMessages200Response messages(List<MessagesMessagesInner>? messages) =>
      this(messages: messages);

  @override
  GetMessages200Response took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetMessages200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetMessages200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetMessages200Response call({
    Object? messages = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return GetMessages200Response(
      messages: messages == const $CopyWithPlaceholder()
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<MessagesMessagesInner>?,
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $GetMessages200ResponseCopyWith on GetMessages200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetMessages200Response.copyWith(...)` or like so:`instanceOfGetMessages200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetMessages200ResponseCWProxy get copyWith =>
      _$GetMessages200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessages200Response _$GetMessages200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetMessages200Response', json, ($checkedConvert) {
  final val = GetMessages200Response(
    messages: $checkedConvert(
      'messages',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => MessagesMessagesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    took: $checkedConvert('took', (v) => v as num?),
  );
  return val;
});

Map<String, dynamic> _$GetMessages200ResponseToJson(
  GetMessages200Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages?.map((e) => e.toJson()).toList(),
  'took': ?instance.took,
};
