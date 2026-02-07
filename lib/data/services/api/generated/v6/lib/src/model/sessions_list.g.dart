// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SessionsListCWProxy {
  SessionsList sessions(List<SessionsListSessionsInner>? sessions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionsList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionsList(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionsList call({List<SessionsListSessionsInner>? sessions});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSessionsList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSessionsList.copyWith.fieldName(...)`
class _$SessionsListCWProxyImpl implements _$SessionsListCWProxy {
  const _$SessionsListCWProxyImpl(this._value);

  final SessionsList _value;

  @override
  SessionsList sessions(List<SessionsListSessionsInner>? sessions) =>
      this(sessions: sessions);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SessionsList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SessionsList(...).copyWith(id: 12, name: "My name")
  /// ````
  SessionsList call({Object? sessions = const $CopyWithPlaceholder()}) {
    return SessionsList(
      sessions: sessions == const $CopyWithPlaceholder()
          ? _value.sessions
          // ignore: cast_nullable_to_non_nullable
          : sessions as List<SessionsListSessionsInner>?,
    );
  }
}

extension $SessionsListCopyWith on SessionsList {
  /// Returns a callable class that can be used as follows: `instanceOfSessionsList.copyWith(...)` or like so:`instanceOfSessionsList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SessionsListCWProxy get copyWith => _$SessionsListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionsList _$SessionsListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SessionsList', json, ($checkedConvert) {
      final val = SessionsList(
        sessions: $checkedConvert(
          'sessions',
          (v) => (v as List<dynamic>?)
              ?.map(
                (e) => SessionsListSessionsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SessionsListToJson(SessionsList instance) =>
    <String, dynamic>{
      'sessions': ?instance.sessions?.map((e) => e.toJson()).toList(),
    };
