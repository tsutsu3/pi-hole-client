// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessagesCWProxy {
  Messages messages(List<MessagesMessagesInner>? messages);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Messages(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Messages(...).copyWith(id: 12, name: "My name")
  /// ````
  Messages call({List<MessagesMessagesInner>? messages});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessages.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessages.copyWith.fieldName(...)`
class _$MessagesCWProxyImpl implements _$MessagesCWProxy {
  const _$MessagesCWProxyImpl(this._value);

  final Messages _value;

  @override
  Messages messages(List<MessagesMessagesInner>? messages) =>
      this(messages: messages);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Messages(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Messages(...).copyWith(id: 12, name: "My name")
  /// ````
  Messages call({Object? messages = const $CopyWithPlaceholder()}) {
    return Messages(
      messages: messages == const $CopyWithPlaceholder()
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<MessagesMessagesInner>?,
    );
  }
}

extension $MessagesCopyWith on Messages {
  /// Returns a callable class that can be used as follows: `instanceOfMessages.copyWith(...)` or like so:`instanceOfMessages.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessagesCWProxy get copyWith => _$MessagesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Messages', json, ($checkedConvert) {
      final val = Messages(
        messages: $checkedConvert(
          'messages',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) =>
                    MessagesMessagesInner.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MessagesToJson(Messages instance) => <String, dynamic>{
  'messages': ?instance.messages?.map((e) => e.toJson()).toList(),
};
