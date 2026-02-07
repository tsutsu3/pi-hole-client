// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints_endpoints.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EndpointsEndpointsCWProxy {
  EndpointsEndpoints get_(List<EndpointsEndpointsGetInner>? get_);

  EndpointsEndpoints post(List<EndpointsEndpointsGetInner>? post);

  EndpointsEndpoints put(List<EndpointsEndpointsGetInner>? put);

  EndpointsEndpoints patch_(List<EndpointsEndpointsPatchInner>? patch_);

  EndpointsEndpoints delete(List<EndpointsEndpointsPatchInner>? delete);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpoints(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpoints(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpoints call({
    List<EndpointsEndpointsGetInner>? get_,
    List<EndpointsEndpointsGetInner>? post,
    List<EndpointsEndpointsGetInner>? put,
    List<EndpointsEndpointsPatchInner>? patch_,
    List<EndpointsEndpointsPatchInner>? delete,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEndpointsEndpoints.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEndpointsEndpoints.copyWith.fieldName(...)`
class _$EndpointsEndpointsCWProxyImpl implements _$EndpointsEndpointsCWProxy {
  const _$EndpointsEndpointsCWProxyImpl(this._value);

  final EndpointsEndpoints _value;

  @override
  EndpointsEndpoints get_(List<EndpointsEndpointsGetInner>? get_) =>
      this(get_: get_);

  @override
  EndpointsEndpoints post(List<EndpointsEndpointsGetInner>? post) =>
      this(post: post);

  @override
  EndpointsEndpoints put(List<EndpointsEndpointsGetInner>? put) =>
      this(put: put);

  @override
  EndpointsEndpoints patch_(List<EndpointsEndpointsPatchInner>? patch_) =>
      this(patch_: patch_);

  @override
  EndpointsEndpoints delete(List<EndpointsEndpointsPatchInner>? delete) =>
      this(delete: delete);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EndpointsEndpoints(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EndpointsEndpoints(...).copyWith(id: 12, name: "My name")
  /// ````
  EndpointsEndpoints call({
    Object? get_ = const $CopyWithPlaceholder(),
    Object? post = const $CopyWithPlaceholder(),
    Object? put = const $CopyWithPlaceholder(),
    Object? patch_ = const $CopyWithPlaceholder(),
    Object? delete = const $CopyWithPlaceholder(),
  }) {
    return EndpointsEndpoints(
      get_: get_ == const $CopyWithPlaceholder()
          ? _value.get_
          // ignore: cast_nullable_to_non_nullable
          : get_ as List<EndpointsEndpointsGetInner>?,
      post: post == const $CopyWithPlaceholder()
          ? _value.post
          // ignore: cast_nullable_to_non_nullable
          : post as List<EndpointsEndpointsGetInner>?,
      put: put == const $CopyWithPlaceholder()
          ? _value.put
          // ignore: cast_nullable_to_non_nullable
          : put as List<EndpointsEndpointsGetInner>?,
      patch_: patch_ == const $CopyWithPlaceholder()
          ? _value.patch_
          // ignore: cast_nullable_to_non_nullable
          : patch_ as List<EndpointsEndpointsPatchInner>?,
      delete: delete == const $CopyWithPlaceholder()
          ? _value.delete
          // ignore: cast_nullable_to_non_nullable
          : delete as List<EndpointsEndpointsPatchInner>?,
    );
  }
}

extension $EndpointsEndpointsCopyWith on EndpointsEndpoints {
  /// Returns a callable class that can be used as follows: `instanceOfEndpointsEndpoints.copyWith(...)` or like so:`instanceOfEndpointsEndpoints.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EndpointsEndpointsCWProxy get copyWith =>
      _$EndpointsEndpointsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndpointsEndpoints _$EndpointsEndpointsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('EndpointsEndpoints', json, ($checkedConvert) {
  final val = EndpointsEndpoints(
    get_: $checkedConvert(
      'get',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                EndpointsEndpointsGetInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    post: $checkedConvert(
      'post',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                EndpointsEndpointsGetInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    put: $checkedConvert(
      'put',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) =>
                EndpointsEndpointsGetInner.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    patch_: $checkedConvert(
      'patch',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => EndpointsEndpointsPatchInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    delete: $checkedConvert(
      'delete',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => EndpointsEndpointsPatchInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
}, fieldKeyMap: const {'get_': 'get', 'patch_': 'patch'});

Map<String, dynamic> _$EndpointsEndpointsToJson(EndpointsEndpoints instance) =>
    <String, dynamic>{
      'get': ?instance.get_?.map((e) => e.toJson()).toList(),
      'post': ?instance.post?.map((e) => e.toJson()).toList(),
      'put': ?instance.put?.map((e) => e.toJson()).toList(),
      'patch': ?instance.patch_?.map((e) => e.toJson()).toList(),
      'delete': ?instance.delete?.map((e) => e.toJson()).toList(),
    };
