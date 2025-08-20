// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Clients {

 List<Client> get clients; List<ClientOverTimeEntry> get overTime;
/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientsCopyWith<Clients> get copyWith => _$ClientsCopyWithImpl<Clients>(this as Clients, _$identity);

  /// Serializes this Clients to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Clients&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.overTime, overTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(overTime));

@override
String toString() {
  return 'Clients(clients: $clients, overTime: $overTime)';
}


}

/// @nodoc
abstract mixin class $ClientsCopyWith<$Res>  {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) _then) = _$ClientsCopyWithImpl;
@useResult
$Res call({
 List<Client> clients, List<ClientOverTimeEntry> overTime
});




}
/// @nodoc
class _$ClientsCopyWithImpl<$Res>
    implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._self, this._then);

  final Clients _self;
  final $Res Function(Clients) _then;

/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clients = null,Object? overTime = null,}) {
  return _then(_self.copyWith(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,overTime: null == overTime ? _self.overTime : overTime // ignore: cast_nullable_to_non_nullable
as List<ClientOverTimeEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [Clients].
extension ClientsPatterns on Clients {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Clients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Clients value)  $default,){
final _that = this;
switch (_that) {
case _Clients():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Clients value)?  $default,){
final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Client> clients,  List<ClientOverTimeEntry> overTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that.clients,_that.overTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Client> clients,  List<ClientOverTimeEntry> overTime)  $default,) {final _that = this;
switch (_that) {
case _Clients():
return $default(_that.clients,_that.overTime);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Client> clients,  List<ClientOverTimeEntry> overTime)?  $default,) {final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that.clients,_that.overTime);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Clients implements Clients {
  const _Clients({required final  List<Client> clients, required final  List<ClientOverTimeEntry> overTime}): _clients = clients,_overTime = overTime;
  factory _Clients.fromJson(Map<String, dynamic> json) => _$ClientsFromJson(json);

 final  List<Client> _clients;
@override List<Client> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}

 final  List<ClientOverTimeEntry> _overTime;
@override List<ClientOverTimeEntry> get overTime {
  if (_overTime is EqualUnmodifiableListView) return _overTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overTime);
}


/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientsCopyWith<_Clients> get copyWith => __$ClientsCopyWithImpl<_Clients>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clients&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._overTime, _overTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_overTime));

@override
String toString() {
  return 'Clients(clients: $clients, overTime: $overTime)';
}


}

/// @nodoc
abstract mixin class _$ClientsCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$ClientsCopyWith(_Clients value, $Res Function(_Clients) _then) = __$ClientsCopyWithImpl;
@override @useResult
$Res call({
 List<Client> clients, List<ClientOverTimeEntry> overTime
});




}
/// @nodoc
class __$ClientsCopyWithImpl<$Res>
    implements _$ClientsCopyWith<$Res> {
  __$ClientsCopyWithImpl(this._self, this._then);

  final _Clients _self;
  final $Res Function(_Clients) _then;

/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? overTime = null,}) {
  return _then(_Clients(
clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,overTime: null == overTime ? _self._overTime : overTime // ignore: cast_nullable_to_non_nullable
as List<ClientOverTimeEntry>,
  ));
}


}


/// @nodoc
mixin _$Client {

 String get ip; String? get name;
/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientCopyWith<Client> get copyWith => _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Client&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,name);

@override
String toString() {
  return 'Client(ip: $ip, name: $name)';
}


}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res>  {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) = _$ClientCopyWithImpl;
@useResult
$Res call({
 String ip, String? name
});




}
/// @nodoc
class _$ClientCopyWithImpl<$Res>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ip = null,Object? name = freezed,}) {
  return _then(_self.copyWith(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Client value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Client value)  $default,){
final _that = this;
switch (_that) {
case _Client():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Client value)?  $default,){
final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ip,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.ip,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ip,  String? name)  $default,) {final _that = this;
switch (_that) {
case _Client():
return $default(_that.ip,_that.name);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ip,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.ip,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Client implements Client {
  const _Client({required this.ip, this.name});
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

@override final  String ip;
@override final  String? name;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientCopyWith<_Client> get copyWith => __$ClientCopyWithImpl<_Client>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Client&&(identical(other.ip, ip) || other.ip == ip)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ip,name);

@override
String toString() {
  return 'Client(ip: $ip, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) = __$ClientCopyWithImpl;
@override @useResult
$Res call({
 String ip, String? name
});




}
/// @nodoc
class __$ClientCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ip = null,Object? name = freezed,}) {
  return _then(_Client(
ip: null == ip ? _self.ip : ip // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClientOverTimeEntry {

 DateTime get time; List<int> get values;
/// Create a copy of ClientOverTimeEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientOverTimeEntryCopyWith<ClientOverTimeEntry> get copyWith => _$ClientOverTimeEntryCopyWithImpl<ClientOverTimeEntry>(this as ClientOverTimeEntry, _$identity);

  /// Serializes this ClientOverTimeEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientOverTimeEntry&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other.values, values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,const DeepCollectionEquality().hash(values));

@override
String toString() {
  return 'ClientOverTimeEntry(time: $time, values: $values)';
}


}

/// @nodoc
abstract mixin class $ClientOverTimeEntryCopyWith<$Res>  {
  factory $ClientOverTimeEntryCopyWith(ClientOverTimeEntry value, $Res Function(ClientOverTimeEntry) _then) = _$ClientOverTimeEntryCopyWithImpl;
@useResult
$Res call({
 DateTime time, List<int> values
});




}
/// @nodoc
class _$ClientOverTimeEntryCopyWithImpl<$Res>
    implements $ClientOverTimeEntryCopyWith<$Res> {
  _$ClientOverTimeEntryCopyWithImpl(this._self, this._then);

  final ClientOverTimeEntry _self;
  final $Res Function(ClientOverTimeEntry) _then;

/// Create a copy of ClientOverTimeEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? values = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientOverTimeEntry].
extension ClientOverTimeEntryPatterns on ClientOverTimeEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientOverTimeEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientOverTimeEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientOverTimeEntry value)  $default,){
final _that = this;
switch (_that) {
case _ClientOverTimeEntry():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientOverTimeEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ClientOverTimeEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  List<int> values)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientOverTimeEntry() when $default != null:
return $default(_that.time,_that.values);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  List<int> values)  $default,) {final _that = this;
switch (_that) {
case _ClientOverTimeEntry():
return $default(_that.time,_that.values);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  List<int> values)?  $default,) {final _that = this;
switch (_that) {
case _ClientOverTimeEntry() when $default != null:
return $default(_that.time,_that.values);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientOverTimeEntry implements ClientOverTimeEntry {
  const _ClientOverTimeEntry({required this.time, required final  List<int> values}): _values = values;
  factory _ClientOverTimeEntry.fromJson(Map<String, dynamic> json) => _$ClientOverTimeEntryFromJson(json);

@override final  DateTime time;
 final  List<int> _values;
@override List<int> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}


/// Create a copy of ClientOverTimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientOverTimeEntryCopyWith<_ClientOverTimeEntry> get copyWith => __$ClientOverTimeEntryCopyWithImpl<_ClientOverTimeEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientOverTimeEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientOverTimeEntry&&(identical(other.time, time) || other.time == time)&&const DeepCollectionEquality().equals(other._values, _values));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,const DeepCollectionEquality().hash(_values));

@override
String toString() {
  return 'ClientOverTimeEntry(time: $time, values: $values)';
}


}

/// @nodoc
abstract mixin class _$ClientOverTimeEntryCopyWith<$Res> implements $ClientOverTimeEntryCopyWith<$Res> {
  factory _$ClientOverTimeEntryCopyWith(_ClientOverTimeEntry value, $Res Function(_ClientOverTimeEntry) _then) = __$ClientOverTimeEntryCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, List<int> values
});




}
/// @nodoc
class __$ClientOverTimeEntryCopyWithImpl<$Res>
    implements _$ClientOverTimeEntryCopyWith<$Res> {
  __$ClientOverTimeEntryCopyWithImpl(this._self, this._then);

  final _ClientOverTimeEntry _self;
  final $Res Function(_ClientOverTimeEntry) _then;

/// Create a copy of ClientOverTimeEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? values = null,}) {
  return _then(_ClientOverTimeEntry(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
