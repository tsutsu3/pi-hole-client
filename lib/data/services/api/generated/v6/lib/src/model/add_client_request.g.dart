// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_client_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddClientRequestCWProxy {
  AddClientRequest client(StringOrList? client);

  AddClientRequest comment(String? comment);

  AddClientRequest groups(List<int>? groups);

  AddClientRequest took(num? took);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClientRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClientRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClientRequest call({
    StringOrList? client,
    String? comment,
    List<int>? groups,
    num? took,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddClientRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddClientRequest.copyWith.fieldName(...)`
class _$AddClientRequestCWProxyImpl implements _$AddClientRequestCWProxy {
  const _$AddClientRequestCWProxyImpl(this._value);

  final AddClientRequest _value;

  @override
  AddClientRequest client(StringOrList? client) => this(client: client);

  @override
  AddClientRequest comment(String? comment) => this(comment: comment);

  @override
  AddClientRequest groups(List<int>? groups) => this(groups: groups);

  @override
  AddClientRequest took(num? took) => this(took: took);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddClientRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddClientRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  AddClientRequest call({
    Object? client = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
    Object? took = const $CopyWithPlaceholder(),
  }) {
    return AddClientRequest(
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
      took: took == const $CopyWithPlaceholder()
          ? _value.took
          // ignore: cast_nullable_to_non_nullable
          : took as num?,
    );
  }
}

extension $AddClientRequestCopyWith on AddClientRequest {
  /// Returns a callable class that can be used as follows: `instanceOfAddClientRequest.copyWith(...)` or like so:`instanceOfAddClientRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddClientRequestCWProxy get copyWith => _$AddClientRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddClientRequest _$AddClientRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddClientRequest', json, ($checkedConvert) {
      final val = AddClientRequest(
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
        took: $checkedConvert('took', (v) => v as num?),
      );
      return val;
    });

Map<String, dynamic> _$AddClientRequestToJson(AddClientRequest instance) =>
    <String, dynamic>{
      'client': ?instance.client?.toJson(),
      'comment': ?instance.comment,
      'groups': ?instance.groups,
      'took': ?instance.took,
    };
