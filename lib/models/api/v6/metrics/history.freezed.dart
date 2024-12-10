// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
mixin _$History {
  List<HistoryData> get history => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this History to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call({List<HistoryData> history, double took});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryImplCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HistoryData> history, double took});
}

/// @nodoc
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_$HistoryImpl(
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryImpl implements _History {
  const _$HistoryImpl(
      {required final List<HistoryData> history, required this.took})
      : _history = history;

  factory _$HistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryImplFromJson(json);

  final List<HistoryData> _history;
  @override
  List<HistoryData> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final double took;

  @override
  String toString() {
    return 'History(history: $history, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_history), took);

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryImplToJson(
      this,
    );
  }
}

abstract class _History implements History {
  const factory _History(
      {required final List<HistoryData> history,
      required final double took}) = _$HistoryImpl;

  factory _History.fromJson(Map<String, dynamic> json) = _$HistoryImpl.fromJson;

  @override
  List<HistoryData> get history;
  @override
  double get took;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) {
  return _HistoryData.fromJson(json);
}

/// @nodoc
mixin _$HistoryData {
  double get timestamp => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get cached => throw _privateConstructorUsedError;
  int get blocked => throw _privateConstructorUsedError;
  int get forwarded => throw _privateConstructorUsedError;

  /// Serializes this HistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryDataCopyWith<HistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDataCopyWith<$Res> {
  factory $HistoryDataCopyWith(
          HistoryData value, $Res Function(HistoryData) then) =
      _$HistoryDataCopyWithImpl<$Res, HistoryData>;
  @useResult
  $Res call(
      {double timestamp, int total, int cached, int blocked, int forwarded});
}

/// @nodoc
class _$HistoryDataCopyWithImpl<$Res, $Val extends HistoryData>
    implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? total = null,
    Object? cached = null,
    Object? blocked = null,
    Object? forwarded = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryDataImplCopyWith<$Res>
    implements $HistoryDataCopyWith<$Res> {
  factory _$$HistoryDataImplCopyWith(
          _$HistoryDataImpl value, $Res Function(_$HistoryDataImpl) then) =
      __$$HistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double timestamp, int total, int cached, int blocked, int forwarded});
}

/// @nodoc
class __$$HistoryDataImplCopyWithImpl<$Res>
    extends _$HistoryDataCopyWithImpl<$Res, _$HistoryDataImpl>
    implements _$$HistoryDataImplCopyWith<$Res> {
  __$$HistoryDataImplCopyWithImpl(
      _$HistoryDataImpl _value, $Res Function(_$HistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? total = null,
    Object? cached = null,
    Object? blocked = null,
    Object? forwarded = null,
  }) {
    return _then(_$HistoryDataImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cached: null == cached
          ? _value.cached
          : cached // ignore: cast_nullable_to_non_nullable
              as int,
      blocked: null == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as int,
      forwarded: null == forwarded
          ? _value.forwarded
          : forwarded // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryDataImpl implements _HistoryData {
  const _$HistoryDataImpl(
      {required this.timestamp,
      required this.total,
      required this.cached,
      required this.blocked,
      required this.forwarded});

  factory _$HistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryDataImplFromJson(json);

  @override
  final double timestamp;
  @override
  final int total;
  @override
  final int cached;
  @override
  final int blocked;
  @override
  final int forwarded;

  @override
  String toString() {
    return 'HistoryData(timestamp: $timestamp, total: $total, cached: $cached, blocked: $blocked, forwarded: $forwarded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryDataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.cached, cached) || other.cached == cached) &&
            (identical(other.blocked, blocked) || other.blocked == blocked) &&
            (identical(other.forwarded, forwarded) ||
                other.forwarded == forwarded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, total, cached, blocked, forwarded);

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
      __$$HistoryDataImplCopyWithImpl<_$HistoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryDataImplToJson(
      this,
    );
  }
}

abstract class _HistoryData implements HistoryData {
  const factory _HistoryData(
      {required final double timestamp,
      required final int total,
      required final int cached,
      required final int blocked,
      required final int forwarded}) = _$HistoryDataImpl;

  factory _HistoryData.fromJson(Map<String, dynamic> json) =
      _$HistoryDataImpl.fromJson;

  @override
  double get timestamp;
  @override
  int get total;
  @override
  int get cached;
  @override
  int get blocked;
  @override
  int get forwarded;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryClients _$HistoryClientsFromJson(Map<String, dynamic> json) {
  return _HistoryClients.fromJson(json);
}

/// @nodoc
mixin _$HistoryClients {
  Map<String, Client> get clients => throw _privateConstructorUsedError;
  List<HistoryEntry> get history => throw _privateConstructorUsedError;
  double get took => throw _privateConstructorUsedError;

  /// Serializes this HistoryClients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryClientsCopyWith<HistoryClients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryClientsCopyWith<$Res> {
  factory $HistoryClientsCopyWith(
          HistoryClients value, $Res Function(HistoryClients) then) =
      _$HistoryClientsCopyWithImpl<$Res, HistoryClients>;
  @useResult
  $Res call(
      {Map<String, Client> clients, List<HistoryEntry> history, double took});
}

/// @nodoc
class _$HistoryClientsCopyWithImpl<$Res, $Val extends HistoryClients>
    implements $HistoryClientsCopyWith<$Res> {
  _$HistoryClientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_value.copyWith(
      clients: null == clients
          ? _value.clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryClientsImplCopyWith<$Res>
    implements $HistoryClientsCopyWith<$Res> {
  factory _$$HistoryClientsImplCopyWith(_$HistoryClientsImpl value,
          $Res Function(_$HistoryClientsImpl) then) =
      __$$HistoryClientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, Client> clients, List<HistoryEntry> history, double took});
}

/// @nodoc
class __$$HistoryClientsImplCopyWithImpl<$Res>
    extends _$HistoryClientsCopyWithImpl<$Res, _$HistoryClientsImpl>
    implements _$$HistoryClientsImplCopyWith<$Res> {
  __$$HistoryClientsImplCopyWithImpl(
      _$HistoryClientsImpl _value, $Res Function(_$HistoryClientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clients = null,
    Object? history = null,
    Object? took = null,
  }) {
    return _then(_$HistoryClientsImpl(
      clients: null == clients
          ? _value._clients
          : clients // ignore: cast_nullable_to_non_nullable
              as Map<String, Client>,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryEntry>,
      took: null == took
          ? _value.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryClientsImpl implements _HistoryClients {
  const _$HistoryClientsImpl(
      {required final Map<String, Client> clients,
      required final List<HistoryEntry> history,
      required this.took})
      : _clients = clients,
        _history = history;

  factory _$HistoryClientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryClientsImplFromJson(json);

  final Map<String, Client> _clients;
  @override
  Map<String, Client> get clients {
    if (_clients is EqualUnmodifiableMapView) return _clients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clients);
  }

  final List<HistoryEntry> _history;
  @override
  List<HistoryEntry> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final double took;

  @override
  String toString() {
    return 'HistoryClients(clients: $clients, history: $history, took: $took)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryClientsImpl &&
            const DeepCollectionEquality().equals(other._clients, _clients) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clients),
      const DeepCollectionEquality().hash(_history),
      took);

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryClientsImplCopyWith<_$HistoryClientsImpl> get copyWith =>
      __$$HistoryClientsImplCopyWithImpl<_$HistoryClientsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryClientsImplToJson(
      this,
    );
  }
}

abstract class _HistoryClients implements HistoryClients {
  const factory _HistoryClients(
      {required final Map<String, Client> clients,
      required final List<HistoryEntry> history,
      required final double took}) = _$HistoryClientsImpl;

  factory _HistoryClients.fromJson(Map<String, dynamic> json) =
      _$HistoryClientsImpl.fromJson;

  @override
  Map<String, Client> get clients;
  @override
  List<HistoryEntry> get history;
  @override
  double get took;

  /// Create a copy of HistoryClients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryClientsImplCopyWith<_$HistoryClientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  String? get name =>
      throw _privateConstructorUsedError; // Nullable since "name" can be null
  int get total => throw _privateConstructorUsedError;

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call({String? name, int total});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientImplCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$ClientImplCopyWith(
          _$ClientImpl value, $Res Function(_$ClientImpl) then) =
      __$$ClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int total});
}

/// @nodoc
class __$$ClientImplCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$ClientImpl>
    implements _$$ClientImplCopyWith<$Res> {
  __$$ClientImplCopyWithImpl(
      _$ClientImpl _value, $Res Function(_$ClientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? total = null,
  }) {
    return _then(_$ClientImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientImpl implements _Client {
  const _$ClientImpl({required this.name, required this.total});

  factory _$ClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientImplFromJson(json);

  @override
  final String? name;
// Nullable since "name" can be null
  @override
  final int total;

  @override
  String toString() {
    return 'Client(name: $name, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, total);

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      __$$ClientImplCopyWithImpl<_$ClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientImplToJson(
      this,
    );
  }
}

abstract class _Client implements Client {
  const factory _Client(
      {required final String? name, required final int total}) = _$ClientImpl;

  factory _Client.fromJson(Map<String, dynamic> json) = _$ClientImpl.fromJson;

  @override
  String? get name; // Nullable since "name" can be null
  @override
  int get total;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientImplCopyWith<_$ClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) {
  return _HistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$HistoryEntry {
  double get timestamp => throw _privateConstructorUsedError;
  Map<String, int> get data => throw _privateConstructorUsedError;

  /// Serializes this HistoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
          HistoryEntry value, $Res Function(HistoryEntry) then) =
      _$HistoryEntryCopyWithImpl<$Res, HistoryEntry>;
  @useResult
  $Res call({double timestamp, Map<String, int> data});
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res, $Val extends HistoryEntry>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryEntryImplCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$$HistoryEntryImplCopyWith(
          _$HistoryEntryImpl value, $Res Function(_$HistoryEntryImpl) then) =
      __$$HistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double timestamp, Map<String, int> data});
}

/// @nodoc
class __$$HistoryEntryImplCopyWithImpl<$Res>
    extends _$HistoryEntryCopyWithImpl<$Res, _$HistoryEntryImpl>
    implements _$$HistoryEntryImplCopyWith<$Res> {
  __$$HistoryEntryImplCopyWithImpl(
      _$HistoryEntryImpl _value, $Res Function(_$HistoryEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_$HistoryEntryImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryEntryImpl implements _HistoryEntry {
  const _$HistoryEntryImpl(
      {required this.timestamp, required final Map<String, int> data})
      : _data = data;

  factory _$HistoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryEntryImplFromJson(json);

  @override
  final double timestamp;
  final Map<String, int> _data;
  @override
  Map<String, int> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'HistoryEntry(timestamp: $timestamp, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryEntryImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, const DeepCollectionEquality().hash(_data));

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      __$$HistoryEntryImplCopyWithImpl<_$HistoryEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryEntryImplToJson(
      this,
    );
  }
}

abstract class _HistoryEntry implements HistoryEntry {
  const factory _HistoryEntry(
      {required final double timestamp,
      required final Map<String, int> data}) = _$HistoryEntryImpl;

  factory _HistoryEntry.fromJson(Map<String, dynamic> json) =
      _$HistoryEntryImpl.fromJson;

  @override
  double get timestamp;
  @override
  Map<String, int> get data;

  /// Create a copy of HistoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
