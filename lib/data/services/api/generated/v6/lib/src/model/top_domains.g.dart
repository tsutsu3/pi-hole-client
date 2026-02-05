// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_domains.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TopDomainsCWProxy {
  TopDomains domains(List<TopDomainsDomainsInner>? domains);

  TopDomains totalQueries(int? totalQueries);

  TopDomains blockedQueries(int? blockedQueries);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  TopDomains call({
    List<TopDomainsDomainsInner>? domains,
    int? totalQueries,
    int? blockedQueries,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTopDomains.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTopDomains.copyWith.fieldName(...)`
class _$TopDomainsCWProxyImpl implements _$TopDomainsCWProxy {
  const _$TopDomainsCWProxyImpl(this._value);

  final TopDomains _value;

  @override
  TopDomains domains(List<TopDomainsDomainsInner>? domains) =>
      this(domains: domains);

  @override
  TopDomains totalQueries(int? totalQueries) =>
      this(totalQueries: totalQueries);

  @override
  TopDomains blockedQueries(int? blockedQueries) =>
      this(blockedQueries: blockedQueries);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TopDomains(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TopDomains(...).copyWith(id: 12, name: "My name")
  /// ````
  TopDomains call({
    Object? domains = const $CopyWithPlaceholder(),
    Object? totalQueries = const $CopyWithPlaceholder(),
    Object? blockedQueries = const $CopyWithPlaceholder(),
  }) {
    return TopDomains(
      domains: domains == const $CopyWithPlaceholder()
          ? _value.domains
          // ignore: cast_nullable_to_non_nullable
          : domains as List<TopDomainsDomainsInner>?,
      totalQueries: totalQueries == const $CopyWithPlaceholder()
          ? _value.totalQueries
          // ignore: cast_nullable_to_non_nullable
          : totalQueries as int?,
      blockedQueries: blockedQueries == const $CopyWithPlaceholder()
          ? _value.blockedQueries
          // ignore: cast_nullable_to_non_nullable
          : blockedQueries as int?,
    );
  }
}

extension $TopDomainsCopyWith on TopDomains {
  /// Returns a callable class that can be used as follows: `instanceOfTopDomains.copyWith(...)` or like so:`instanceOfTopDomains.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TopDomainsCWProxy get copyWith => _$TopDomainsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopDomains _$TopDomainsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TopDomains',
  json,
  ($checkedConvert) {
    final val = TopDomains(
      domains: $checkedConvert(
        'domains',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TopDomainsDomainsInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      totalQueries: $checkedConvert(
        'total_queries',
        (v) => (v as num?)?.toInt(),
      ),
      blockedQueries: $checkedConvert(
        'blocked_queries',
        (v) => (v as num?)?.toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalQueries': 'total_queries',
    'blockedQueries': 'blocked_queries',
  },
);

Map<String, dynamic> _$TopDomainsToJson(TopDomains instance) =>
    <String, dynamic>{
      'domains': ?instance.domains?.map((e) => e.toJson()).toList(),
      'total_queries': ?instance.totalQueries,
      'blocked_queries': ?instance.blockedQueries,
    };
