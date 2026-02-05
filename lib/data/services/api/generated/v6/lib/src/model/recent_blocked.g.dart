// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_blocked.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$RecentBlockedCWProxy {
  RecentBlocked blocked(List<String>? blocked);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecentBlocked(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecentBlocked(...).copyWith(id: 12, name: "My name")
  /// ````
  RecentBlocked call({List<String>? blocked});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfRecentBlocked.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfRecentBlocked.copyWith.fieldName(...)`
class _$RecentBlockedCWProxyImpl implements _$RecentBlockedCWProxy {
  const _$RecentBlockedCWProxyImpl(this._value);

  final RecentBlocked _value;

  @override
  RecentBlocked blocked(List<String>? blocked) => this(blocked: blocked);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `RecentBlocked(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// RecentBlocked(...).copyWith(id: 12, name: "My name")
  /// ````
  RecentBlocked call({Object? blocked = const $CopyWithPlaceholder()}) {
    return RecentBlocked(
      blocked: blocked == const $CopyWithPlaceholder()
          ? _value.blocked
          // ignore: cast_nullable_to_non_nullable
          : blocked as List<String>?,
    );
  }
}

extension $RecentBlockedCopyWith on RecentBlocked {
  /// Returns a callable class that can be used as follows: `instanceOfRecentBlocked.copyWith(...)` or like so:`instanceOfRecentBlocked.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$RecentBlockedCWProxy get copyWith => _$RecentBlockedCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentBlocked _$RecentBlockedFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RecentBlocked', json, ($checkedConvert) {
      final val = RecentBlocked(
        blocked: $checkedConvert(
          'blocked',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RecentBlockedToJson(RecentBlocked instance) =>
    <String, dynamic>{'blocked': ?instance.blocked};
