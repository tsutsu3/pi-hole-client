// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_messages_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MessagesMessagesInnerCWProxy {
  MessagesMessagesInner id(int? id);

  MessagesMessagesInner timestamp(num? timestamp);

  MessagesMessagesInner type(String? type);

  MessagesMessagesInner plain(String? plain);

  MessagesMessagesInner html(String? html);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessagesMessagesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessagesMessagesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  MessagesMessagesInner call({
    int? id,
    num? timestamp,
    String? type,
    String? plain,
    String? html,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMessagesMessagesInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMessagesMessagesInner.copyWith.fieldName(...)`
class _$MessagesMessagesInnerCWProxyImpl
    implements _$MessagesMessagesInnerCWProxy {
  const _$MessagesMessagesInnerCWProxyImpl(this._value);

  final MessagesMessagesInner _value;

  @override
  MessagesMessagesInner id(int? id) => this(id: id);

  @override
  MessagesMessagesInner timestamp(num? timestamp) => this(timestamp: timestamp);

  @override
  MessagesMessagesInner type(String? type) => this(type: type);

  @override
  MessagesMessagesInner plain(String? plain) => this(plain: plain);

  @override
  MessagesMessagesInner html(String? html) => this(html: html);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MessagesMessagesInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MessagesMessagesInner(...).copyWith(id: 12, name: "My name")
  /// ````
  MessagesMessagesInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? plain = const $CopyWithPlaceholder(),
    Object? html = const $CopyWithPlaceholder(),
  }) {
    return MessagesMessagesInner(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as num?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      plain: plain == const $CopyWithPlaceholder()
          ? _value.plain
          // ignore: cast_nullable_to_non_nullable
          : plain as String?,
      html: html == const $CopyWithPlaceholder()
          ? _value.html
          // ignore: cast_nullable_to_non_nullable
          : html as String?,
    );
  }
}

extension $MessagesMessagesInnerCopyWith on MessagesMessagesInner {
  /// Returns a callable class that can be used as follows: `instanceOfMessagesMessagesInner.copyWith(...)` or like so:`instanceOfMessagesMessagesInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MessagesMessagesInnerCWProxy get copyWith =>
      _$MessagesMessagesInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesMessagesInner _$MessagesMessagesInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MessagesMessagesInner', json, ($checkedConvert) {
  final val = MessagesMessagesInner(
    id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
    timestamp: $checkedConvert('timestamp', (v) => v as num?),
    type: $checkedConvert('type', (v) => v as String?),
    plain: $checkedConvert('plain', (v) => v as String?),
    html: $checkedConvert('html', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$MessagesMessagesInnerToJson(
  MessagesMessagesInner instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'timestamp': ?instance.timestamp,
  'type': ?instance.type,
  'plain': ?instance.plain,
  'html': ?instance.html,
};
