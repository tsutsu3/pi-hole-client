// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_put.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientsPutCWProxy {
  ClientsPut comment(String? comment);

  ClientsPut groups(List<int>? groups);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsPut call({String? comment, List<int>? groups});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientsPut.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientsPut.copyWith.fieldName(...)`
class _$ClientsPutCWProxyImpl implements _$ClientsPutCWProxy {
  const _$ClientsPutCWProxyImpl(this._value);

  final ClientsPut _value;

  @override
  ClientsPut comment(String? comment) => this(comment: comment);

  @override
  ClientsPut groups(List<int>? groups) => this(groups: groups);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientsPut(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientsPut(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientsPut call({
    Object? comment = const $CopyWithPlaceholder(),
    Object? groups = const $CopyWithPlaceholder(),
  }) {
    return ClientsPut(
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

extension $ClientsPutCopyWith on ClientsPut {
  /// Returns a callable class that can be used as follows: `instanceOfClientsPut.copyWith(...)` or like so:`instanceOfClientsPut.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientsPutCWProxy get copyWith => _$ClientsPutCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsPut _$ClientsPutFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientsPut', json, ($checkedConvert) {
      final val = ClientsPut(
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

Map<String, dynamic> _$ClientsPutToJson(ClientsPut instance) =>
    <String, dynamic>{'comment': ?instance.comment, 'groups': ?instance.groups};
