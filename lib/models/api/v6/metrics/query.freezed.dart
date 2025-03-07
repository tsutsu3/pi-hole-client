// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Queries {
  List<Query> get queries;
  int get cursor;
  int get recordsTotal;
  int get recordsFiltered;
  int get draw;
  double get took;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueriesCopyWith<Queries> get copyWith =>
      _$QueriesCopyWithImpl<Queries>(this as Queries, _$identity);

  /// Serializes this Queries to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Queries &&
            const DeepCollectionEquality().equals(other.queries, queries) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.recordsTotal, recordsTotal) ||
                other.recordsTotal == recordsTotal) &&
            (identical(other.recordsFiltered, recordsFiltered) ||
                other.recordsFiltered == recordsFiltered) &&
            (identical(other.draw, draw) || other.draw == draw) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(queries),
      cursor,
      recordsTotal,
      recordsFiltered,
      draw,
      took);

  @override
  String toString() {
    return 'Queries(queries: $queries, cursor: $cursor, recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, draw: $draw, took: $took)';
  }
}

/// @nodoc
abstract mixin class $QueriesCopyWith<$Res> {
  factory $QueriesCopyWith(Queries value, $Res Function(Queries) _then) =
      _$QueriesCopyWithImpl;
  @useResult
  $Res call(
      {List<Query> queries,
      int cursor,
      int recordsTotal,
      int recordsFiltered,
      int draw,
      double took});
}

/// @nodoc
class _$QueriesCopyWithImpl<$Res> implements $QueriesCopyWith<$Res> {
  _$QueriesCopyWithImpl(this._self, this._then);

  final Queries _self;
  final $Res Function(Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queries = null,
    Object? cursor = null,
    Object? recordsTotal = null,
    Object? recordsFiltered = null,
    Object? draw = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      queries: null == queries
          ? _self.queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<Query>,
      cursor: null == cursor
          ? _self.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int,
      recordsTotal: null == recordsTotal
          ? _self.recordsTotal
          : recordsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      recordsFiltered: null == recordsFiltered
          ? _self.recordsFiltered
          : recordsFiltered // ignore: cast_nullable_to_non_nullable
              as int,
      draw: null == draw
          ? _self.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Queries implements Queries {
  const _Queries(
      {required final List<Query> queries,
      required this.cursor,
      required this.recordsTotal,
      required this.recordsFiltered,
      required this.draw,
      required this.took})
      : _queries = queries;
  factory _Queries.fromJson(Map<String, dynamic> json) =>
      _$QueriesFromJson(json);

  final List<Query> _queries;
  @override
  List<Query> get queries {
    if (_queries is EqualUnmodifiableListView) return _queries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queries);
  }

  @override
  final int cursor;
  @override
  final int recordsTotal;
  @override
  final int recordsFiltered;
  @override
  final int draw;
  @override
  final double took;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueriesCopyWith<_Queries> get copyWith =>
      __$QueriesCopyWithImpl<_Queries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueriesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Queries &&
            const DeepCollectionEquality().equals(other._queries, _queries) &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.recordsTotal, recordsTotal) ||
                other.recordsTotal == recordsTotal) &&
            (identical(other.recordsFiltered, recordsFiltered) ||
                other.recordsFiltered == recordsFiltered) &&
            (identical(other.draw, draw) || other.draw == draw) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_queries),
      cursor,
      recordsTotal,
      recordsFiltered,
      draw,
      took);

  @override
  String toString() {
    return 'Queries(queries: $queries, cursor: $cursor, recordsTotal: $recordsTotal, recordsFiltered: $recordsFiltered, draw: $draw, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$QueriesCopyWith<$Res> implements $QueriesCopyWith<$Res> {
  factory _$QueriesCopyWith(_Queries value, $Res Function(_Queries) _then) =
      __$QueriesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Query> queries,
      int cursor,
      int recordsTotal,
      int recordsFiltered,
      int draw,
      double took});
}

/// @nodoc
class __$QueriesCopyWithImpl<$Res> implements _$QueriesCopyWith<$Res> {
  __$QueriesCopyWithImpl(this._self, this._then);

  final _Queries _self;
  final $Res Function(_Queries) _then;

  /// Create a copy of Queries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? queries = null,
    Object? cursor = null,
    Object? recordsTotal = null,
    Object? recordsFiltered = null,
    Object? draw = null,
    Object? took = null,
  }) {
    return _then(_Queries(
      queries: null == queries
          ? _self._queries
          : queries // ignore: cast_nullable_to_non_nullable
              as List<Query>,
      cursor: null == cursor
          ? _self.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as int,
      recordsTotal: null == recordsTotal
          ? _self.recordsTotal
          : recordsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      recordsFiltered: null == recordsFiltered
          ? _self.recordsFiltered
          : recordsFiltered // ignore: cast_nullable_to_non_nullable
              as int,
      draw: null == draw
          ? _self.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Query {
  int get id;
  double get time;
  String get type;
  String get domain;
  Client get client;
  Reply get reply;
  String? get cname;
  String? get status;
  String? get dnssec;
  @JsonKey(name: 'list_id')
  int? get listId;
  String? get upstream;

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryCopyWith<Query> get copyWith =>
      _$QueryCopyWithImpl<Query>(this as Query, _$identity);

  /// Serializes this Query to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Query &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.cname, cname) || other.cname == cname) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dnssec, dnssec) || other.dnssec == dnssec) &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.upstream, upstream) ||
                other.upstream == upstream));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, type, domain, client,
      reply, cname, status, dnssec, listId, upstream);

  @override
  String toString() {
    return 'Query(id: $id, time: $time, type: $type, domain: $domain, client: $client, reply: $reply, cname: $cname, status: $status, dnssec: $dnssec, listId: $listId, upstream: $upstream)';
  }
}

/// @nodoc
abstract mixin class $QueryCopyWith<$Res> {
  factory $QueryCopyWith(Query value, $Res Function(Query) _then) =
      _$QueryCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      double time,
      String type,
      String domain,
      Client client,
      Reply reply,
      String? cname,
      String? status,
      String? dnssec,
      @JsonKey(name: 'list_id') int? listId,
      String? upstream});

  $ClientCopyWith<$Res> get client;
  $ReplyCopyWith<$Res> get reply;
}

/// @nodoc
class _$QueryCopyWithImpl<$Res> implements $QueryCopyWith<$Res> {
  _$QueryCopyWithImpl(this._self, this._then);

  final Query _self;
  final $Res Function(Query) _then;

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? type = null,
    Object? domain = null,
    Object? client = null,
    Object? reply = null,
    Object? cname = freezed,
    Object? status = freezed,
    Object? dnssec = freezed,
    Object? listId = freezed,
    Object? upstream = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _self.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      reply: null == reply
          ? _self.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as Reply,
      cname: freezed == cname
          ? _self.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dnssec: freezed == dnssec
          ? _self.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as String?,
      listId: freezed == listId
          ? _self.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as int?,
      upstream: freezed == upstream
          ? _self.upstream
          : upstream // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res> get client {
    return $ClientCopyWith<$Res>(_self.client, (value) {
      return _then(_self.copyWith(client: value));
    });
  }

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyCopyWith<$Res> get reply {
    return $ReplyCopyWith<$Res>(_self.reply, (value) {
      return _then(_self.copyWith(reply: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Query implements Query {
  const _Query(
      {required this.id,
      required this.time,
      required this.type,
      required this.domain,
      required this.client,
      required this.reply,
      this.cname,
      this.status,
      this.dnssec,
      @JsonKey(name: 'list_id') this.listId,
      this.upstream});
  factory _Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

  @override
  final int id;
  @override
  final double time;
  @override
  final String type;
  @override
  final String domain;
  @override
  final Client client;
  @override
  final Reply reply;
  @override
  final String? cname;
  @override
  final String? status;
  @override
  final String? dnssec;
  @override
  @JsonKey(name: 'list_id')
  final int? listId;
  @override
  final String? upstream;

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueryCopyWith<_Query> get copyWith =>
      __$QueryCopyWithImpl<_Query>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Query &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.cname, cname) || other.cname == cname) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dnssec, dnssec) || other.dnssec == dnssec) &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.upstream, upstream) ||
                other.upstream == upstream));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, time, type, domain, client,
      reply, cname, status, dnssec, listId, upstream);

  @override
  String toString() {
    return 'Query(id: $id, time: $time, type: $type, domain: $domain, client: $client, reply: $reply, cname: $cname, status: $status, dnssec: $dnssec, listId: $listId, upstream: $upstream)';
  }
}

/// @nodoc
abstract mixin class _$QueryCopyWith<$Res> implements $QueryCopyWith<$Res> {
  factory _$QueryCopyWith(_Query value, $Res Function(_Query) _then) =
      __$QueryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      double time,
      String type,
      String domain,
      Client client,
      Reply reply,
      String? cname,
      String? status,
      String? dnssec,
      @JsonKey(name: 'list_id') int? listId,
      String? upstream});

  @override
  $ClientCopyWith<$Res> get client;
  @override
  $ReplyCopyWith<$Res> get reply;
}

/// @nodoc
class __$QueryCopyWithImpl<$Res> implements _$QueryCopyWith<$Res> {
  __$QueryCopyWithImpl(this._self, this._then);

  final _Query _self;
  final $Res Function(_Query) _then;

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? type = null,
    Object? domain = null,
    Object? client = null,
    Object? reply = null,
    Object? cname = freezed,
    Object? status = freezed,
    Object? dnssec = freezed,
    Object? listId = freezed,
    Object? upstream = freezed,
  }) {
    return _then(_Query(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _self.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _self.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
      reply: null == reply
          ? _self.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as Reply,
      cname: freezed == cname
          ? _self.cname
          : cname // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      dnssec: freezed == dnssec
          ? _self.dnssec
          : dnssec // ignore: cast_nullable_to_non_nullable
              as String?,
      listId: freezed == listId
          ? _self.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as int?,
      upstream: freezed == upstream
          ? _self.upstream
          : upstream // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClientCopyWith<$Res> get client {
    return $ClientCopyWith<$Res>(_self.client, (value) {
      return _then(_self.copyWith(client: value));
    });
  }

  /// Create a copy of Query
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReplyCopyWith<$Res> get reply {
    return $ReplyCopyWith<$Res>(_self.reply, (value) {
      return _then(_self.copyWith(reply: value));
    });
  }
}

/// @nodoc
mixin _$Client {
  String get ip;
  String? get name;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClientCopyWith<Client> get copyWith =>
      _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Client &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, name);

  @override
  String toString() {
    return 'Client(ip: $ip, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) =
      _$ClientCopyWithImpl;
  @useResult
  $Res call({String ip, String? name});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res> implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Client implements Client {
  const _Client({required this.ip, this.name});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  @override
  final String ip;
  @override
  final String? name;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Client &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ip, name);

  @override
  String toString() {
    return 'Client(ip: $ip, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) =
      __$ClientCopyWithImpl;
  @override
  @useResult
  $Res call({String ip, String? name});
}

/// @nodoc
class __$ClientCopyWithImpl<$Res> implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

  /// Create a copy of Client
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ip = null,
    Object? name = freezed,
  }) {
    return _then(_Client(
      ip: null == ip
          ? _self.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Reply {
  double get time;
  String? get type;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReplyCopyWith<Reply> get copyWith =>
      _$ReplyCopyWithImpl<Reply>(this as Reply, _$identity);

  /// Serializes this Reply to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Reply &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, type);

  @override
  String toString() {
    return 'Reply(time: $time, type: $type)';
  }
}

/// @nodoc
abstract mixin class $ReplyCopyWith<$Res> {
  factory $ReplyCopyWith(Reply value, $Res Function(Reply) _then) =
      _$ReplyCopyWithImpl;
  @useResult
  $Res call({double time, String? type});
}

/// @nodoc
class _$ReplyCopyWithImpl<$Res> implements $ReplyCopyWith<$Res> {
  _$ReplyCopyWithImpl(this._self, this._then);

  final Reply _self;
  final $Res Function(Reply) _then;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? type = freezed,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Reply implements Reply {
  const _Reply({required this.time, this.type});
  factory _Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);

  @override
  final double time;
  @override
  final String? type;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReplyCopyWith<_Reply> get copyWith =>
      __$ReplyCopyWithImpl<_Reply>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReplyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reply &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, type);

  @override
  String toString() {
    return 'Reply(time: $time, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$ReplyCopyWith<$Res> implements $ReplyCopyWith<$Res> {
  factory _$ReplyCopyWith(_Reply value, $Res Function(_Reply) _then) =
      __$ReplyCopyWithImpl;
  @override
  @useResult
  $Res call({double time, String? type});
}

/// @nodoc
class __$ReplyCopyWithImpl<$Res> implements _$ReplyCopyWith<$Res> {
  __$ReplyCopyWithImpl(this._self, this._then);

  final _Reply _self;
  final $Res Function(_Reply) _then;

  /// Create a copy of Reply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? type = freezed,
  }) {
    return _then(_Reply(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
