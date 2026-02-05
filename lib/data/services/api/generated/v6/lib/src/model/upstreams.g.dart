// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upstreams.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UpstreamsCWProxy {
  Upstreams upstreams(List<UpstreamsUpstreamsInner>? upstreams);

  Upstreams forwardedQueries(int? forwardedQueries);

  Upstreams totalQueries(int? totalQueries);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Upstreams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Upstreams(...).copyWith(id: 12, name: "My name")
  /// ````
  Upstreams call({
    List<UpstreamsUpstreamsInner>? upstreams,
    int? forwardedQueries,
    int? totalQueries,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUpstreams.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUpstreams.copyWith.fieldName(...)`
class _$UpstreamsCWProxyImpl implements _$UpstreamsCWProxy {
  const _$UpstreamsCWProxyImpl(this._value);

  final Upstreams _value;

  @override
  Upstreams upstreams(List<UpstreamsUpstreamsInner>? upstreams) =>
      this(upstreams: upstreams);

  @override
  Upstreams forwardedQueries(int? forwardedQueries) =>
      this(forwardedQueries: forwardedQueries);

  @override
  Upstreams totalQueries(int? totalQueries) => this(totalQueries: totalQueries);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Upstreams(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Upstreams(...).copyWith(id: 12, name: "My name")
  /// ````
  Upstreams call({
    Object? upstreams = const $CopyWithPlaceholder(),
    Object? forwardedQueries = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
  }) {
    return Upstreams(
      upstreams: upstreams == const $CopyWithPlaceholder()
          ? _value.upstreams
          // ignore: cast_nullable_to_non_nullable
          : upstreams as List<UpstreamsUpstreamsInner>?,
      forwardedQueries: forwardedQueries == const $CopyWithPlaceholder()
          ? _value.forwardedQueries
          // ignore: cast_nullable_to_non_nullable
          : forwardedQueries as int?,
      totalQueries: totalQueries == const $CopyWithPlaceholder()
          ? _value.totalQueries
          // ignore: cast_nullable_to_non_nullable
          : totalQueries as int?,
    );
  }
}

extension $UpstreamsCopyWith on Upstreams {
  /// Returns a callable class that can be used as follows: `instanceOfUpstreams.copyWith(...)` or like so:`instanceOfUpstreams.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UpstreamsCWProxy get copyWith => _$UpstreamsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upstreams _$UpstreamsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Upstreams',
  json,
  ($checkedConvert) {
    final val = Upstreams(
      upstreams: $checkedConvert(
        'upstreams',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) =>
                  UpstreamsUpstreamsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      forwardedQueries: $checkedConvert(
        'forwarded_queries',
        (v) => (v as num?)?.toInt(),
      ),
      totalQueries: $checkedConvert(
        'total_queries',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'forwardedQueries': 'forwarded_queries',
    'totalQueries': 'total_queries',
  },
);

Map<String, dynamic> _$UpstreamsToJson(Upstreams instance) => <String, dynamic>{
  'upstreams': ?instance.upstreams?.map((e) => e.toJson()).toList(),
  'forwarded_queries': ?instance.forwardedQueries,
  'total_queries': ?instance.totalQueries,
};
