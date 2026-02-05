// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_gravity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QueriesGravityCWProxy {
  QueriesGravity domainsBeingBlocked(int? domainsBeingBlocked);

  QueriesGravity lastUpdate(int? lastUpdate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesGravity call({int? domainsBeingBlocked, int? lastUpdate});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQueriesGravity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQueriesGravity.copyWith.fieldName(...)`
class _$QueriesGravityCWProxyImpl implements _$QueriesGravityCWProxy {
  const _$QueriesGravityCWProxyImpl(this._value);

  final QueriesGravity _value;

  @override
  QueriesGravity domainsBeingBlocked(int? domainsBeingBlocked) =>
      this(domainsBeingBlocked: domainsBeingBlocked);

  @override
  QueriesGravity lastUpdate(int? lastUpdate) => this(lastUpdate: lastUpdate);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QueriesGravity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QueriesGravity(...).copyWith(id: 12, name: "My name")
  /// ````
  QueriesGravity call({
    Object? domainsBeingBlocked = const $CopyWithPlaceholder(),
    Object? lastUpdate = const $CopyWithPlaceholder(),
  }) {
    return QueriesGravity(
      domainsBeingBlocked: domainsBeingBlocked == const $CopyWithPlaceholder()
          ? _value.domainsBeingBlocked
          // ignore: cast_nullable_to_non_nullable
          : domainsBeingBlocked as int?,
      lastUpdate: lastUpdate == const $CopyWithPlaceholder()
          ? _value.lastUpdate
          // ignore: cast_nullable_to_non_nullable
          : lastUpdate as int?,
    );
  }
}

extension $QueriesGravityCopyWith on QueriesGravity {
  /// Returns a callable class that can be used as follows: `instanceOfQueriesGravity.copyWith(...)` or like so:`instanceOfQueriesGravity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QueriesGravityCWProxy get copyWith => _$QueriesGravityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesGravity _$QueriesGravityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'QueriesGravity',
      json,
      ($checkedConvert) {
        final val = QueriesGravity(
          domainsBeingBlocked: $checkedConvert(
            'domains_being_blocked',
            (v) => (v as num?)?.toInt(),
          ),
          lastUpdate: $checkedConvert(
            'last_update',
            (v) => (v as num?)?.toInt(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'domainsBeingBlocked': 'domains_being_blocked',
        'lastUpdate': 'last_update',
      },
    );

Map<String, dynamic> _$QueriesGravityToJson(QueriesGravity instance) =>
    <String, dynamic>{
      'domains_being_blocked': ?instance.domainsBeingBlocked,
      'last_update': ?instance.lastUpdate,
    };
