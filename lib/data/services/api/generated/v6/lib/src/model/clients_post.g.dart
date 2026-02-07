// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientsPostCWProxy {
  ClientsPost client(StringOrList? client);

  ClientsPost comment(String? comment);

  ClientsPost groups(List<int>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsPost call({StringOrList? client, String? comment, List<int>? groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientsPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientsPost.copyWith.fieldName(...)`
class _$ClientsPostCWProxyImpl implements _$ClientsPostCWProxy {
  const _$ClientsPostCWProxyImpl(this._value);

  final ClientsPost _value;

  @override
  ClientsPost client(StringOrList? client) => this(client: client);

  @override
  ClientsPost comment(String? comment) => this(comment: comment);

  @override
  ClientsPost groups(List<int>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsPost(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsPost call({
    Object? client = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
  }) {
    return ClientsPost(
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as StringOrList?,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
      groups: groups == const $CopyWithPlaceholder()
          ? _value.groups
          // ignore: cast_nullable_to_non_nullable
          : groups as List<int>?,
    );
  }
}

extension $ClientsPostCopyWith on ClientsPost {
  /// Returns a callable class that can be used as follows: `instanceOfClientsPost.copyWith(...)` or like so:`instanceOfClientsPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientsPostCWProxy get copyWith => _$ClientsPostCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsPost _$ClientsPostFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientsPost', json, ($checkedConvert) {
      final val = ClientsPost(
        client: $checkedConvert(
          'client',
          (v) => v == null ? null : StringOrList.fromJson(v),
        ),
        comment: $checkedConvert('comment', (v) => v as String?),
        groups: $checkedConvert(
          'groups',
          (v) =>
              (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
              [0],
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientsPostToJson(ClientsPost instance) =>
    <String, dynamic>{
      'client': ?instance.client?.toJson(),
      'comment': ?instance.comment,
      'groups': ?instance.groups,
    };
