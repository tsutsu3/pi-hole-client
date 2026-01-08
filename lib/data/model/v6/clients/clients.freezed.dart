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

 List<Client> get clients; double get took; Processed? get processed;
/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientsCopyWith<Clients> get copyWith => _$ClientsCopyWithImpl<Clients>(this as Clients, _$identity);

  /// Serializes this Clients to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Clients&&const DeepCollectionEquality().equals(other.clients, clients)&&(identical(other.took, took) || other.took == took)&&(identical(other.processed, processed) || other.processed == processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clients),took,processed);

@override
String toString() {
  return 'Clients(clients: $clients, took: $took, processed: $processed)';
}


}

/// @nodoc
abstract mixin class $ClientsCopyWith<$Res>  {
  factory $ClientsCopyWith(Clients value, $Res Function(Clients) _then) = _$ClientsCopyWithImpl;
@useResult
$Res call({
 List<Client> clients, double took, Processed? processed
});


$ProcessedCopyWith<$Res>? get processed;

}
/// @nodoc
class _$ClientsCopyWithImpl<$Res>
    implements $ClientsCopyWith<$Res> {
  _$ClientsCopyWithImpl(this._self, this._then);

  final Clients _self;
  final $Res Function(Clients) _then;

/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clients = null,Object? took = null,Object? processed = freezed,}) {
  return _then(_self.copyWith(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,processed: freezed == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as Processed?,
  ));
}
/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
    return null;
  }

  return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
    return _then(_self.copyWith(processed: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Client> clients,  double took,  Processed? processed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that.clients,_that.took,_that.processed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Client> clients,  double took,  Processed? processed)  $default,) {final _that = this;
switch (_that) {
case _Clients():
return $default(_that.clients,_that.took,_that.processed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Client> clients,  double took,  Processed? processed)?  $default,) {final _that = this;
switch (_that) {
case _Clients() when $default != null:
return $default(_that.clients,_that.took,_that.processed);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Clients implements Clients {
  const _Clients({required final  List<Client> clients, required this.took, this.processed}): _clients = clients;
  factory _Clients.fromJson(Map<String, dynamic> json) => _$ClientsFromJson(json);

 final  List<Client> _clients;
@override List<Client> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}

@override final  double took;
@override final  Processed? processed;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Clients&&const DeepCollectionEquality().equals(other._clients, _clients)&&(identical(other.took, took) || other.took == took)&&(identical(other.processed, processed) || other.processed == processed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients),took,processed);

@override
String toString() {
  return 'Clients(clients: $clients, took: $took, processed: $processed)';
}


}

/// @nodoc
abstract mixin class _$ClientsCopyWith<$Res> implements $ClientsCopyWith<$Res> {
  factory _$ClientsCopyWith(_Clients value, $Res Function(_Clients) _then) = __$ClientsCopyWithImpl;
@override @useResult
$Res call({
 List<Client> clients, double took, Processed? processed
});


@override $ProcessedCopyWith<$Res>? get processed;

}
/// @nodoc
class __$ClientsCopyWithImpl<$Res>
    implements _$ClientsCopyWith<$Res> {
  __$ClientsCopyWithImpl(this._self, this._then);

  final _Clients _self;
  final $Res Function(_Clients) _then;

/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? took = null,Object? processed = freezed,}) {
  return _then(_Clients(
clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<Client>,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,processed: freezed == processed ? _self.processed : processed // ignore: cast_nullable_to_non_nullable
as Processed?,
  ));
}

/// Create a copy of Clients
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessedCopyWith<$Res>? get processed {
    if (_self.processed == null) {
    return null;
  }

  return $ProcessedCopyWith<$Res>(_self.processed!, (value) {
    return _then(_self.copyWith(processed: value));
  });
}
}


/// @nodoc
mixin _$Client {

 String get client; int get id; List<int> get groups;@JsonKey(name: 'date_added') int get dateAdded;@JsonKey(name: 'date_modified') int get dateModified; String? get name; String? get comment;
/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientCopyWith<Client> get copyWith => _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Client&&(identical(other.client, client) || other.client == client)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,id,const DeepCollectionEquality().hash(groups),dateAdded,dateModified,name,comment);

@override
String toString() {
  return 'Client(client: $client, id: $id, groups: $groups, dateAdded: $dateAdded, dateModified: $dateModified, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res>  {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) = _$ClientCopyWithImpl;
@useResult
$Res call({
 String client, int id, List<int> groups,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String? name, String? comment
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
@pragma('vm:prefer-inline') @override $Res call({Object? client = null,Object? id = null,Object? groups = null,Object? dateAdded = null,Object? dateModified = null,Object? name = freezed,Object? comment = freezed,}) {
  return _then(_self.copyWith(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String client,  int id,  List<int> groups, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? name,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.client,_that.id,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String client,  int id,  List<int> groups, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? name,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _Client():
return $default(_that.client,_that.id,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String client,  int id,  List<int> groups, @JsonKey(name: 'date_added')  int dateAdded, @JsonKey(name: 'date_modified')  int dateModified,  String? name,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.client,_that.id,_that.groups,_that.dateAdded,_that.dateModified,_that.name,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Client implements Client {
  const _Client({required this.client, required this.id, required final  List<int> groups, @JsonKey(name: 'date_added') required this.dateAdded, @JsonKey(name: 'date_modified') required this.dateModified, this.name, this.comment}): _groups = groups;
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

@override final  String client;
@override final  int id;
 final  List<int> _groups;
@override List<int> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

@override@JsonKey(name: 'date_added') final  int dateAdded;
@override@JsonKey(name: 'date_modified') final  int dateModified;
@override final  String? name;
@override final  String? comment;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Client&&(identical(other.client, client) || other.client == client)&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.name, name) || other.name == name)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,id,const DeepCollectionEquality().hash(_groups),dateAdded,dateModified,name,comment);

@override
String toString() {
  return 'Client(client: $client, id: $id, groups: $groups, dateAdded: $dateAdded, dateModified: $dateModified, name: $name, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) = __$ClientCopyWithImpl;
@override @useResult
$Res call({
 String client, int id, List<int> groups,@JsonKey(name: 'date_added') int dateAdded,@JsonKey(name: 'date_modified') int dateModified, String? name, String? comment
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
@override @pragma('vm:prefer-inline') $Res call({Object? client = null,Object? id = null,Object? groups = null,Object? dateAdded = null,Object? dateModified = null,Object? name = freezed,Object? comment = freezed,}) {
  return _then(_Client(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<int>,dateAdded: null == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int,dateModified: null == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Processed {

 List<ProcessedSuccess> get success; List<ProcessedError> get errors;
/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedCopyWith<Processed> get copyWith => _$ProcessedCopyWithImpl<Processed>(this as Processed, _$identity);

  /// Serializes this Processed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Processed&&const DeepCollectionEquality().equals(other.success, success)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(success),const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'Processed(success: $success, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $ProcessedCopyWith<$Res>  {
  factory $ProcessedCopyWith(Processed value, $Res Function(Processed) _then) = _$ProcessedCopyWithImpl;
@useResult
$Res call({
 List<ProcessedSuccess> success, List<ProcessedError> errors
});




}
/// @nodoc
class _$ProcessedCopyWithImpl<$Res>
    implements $ProcessedCopyWith<$Res> {
  _$ProcessedCopyWithImpl(this._self, this._then);

  final Processed _self;
  final $Res Function(Processed) _then;

/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? errors = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as List<ProcessedSuccess>,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<ProcessedError>,
  ));
}

}


/// Adds pattern-matching-related methods to [Processed].
extension ProcessedPatterns on Processed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Processed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Processed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Processed value)  $default,){
final _that = this;
switch (_that) {
case _Processed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Processed value)?  $default,){
final _that = this;
switch (_that) {
case _Processed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProcessedSuccess> success,  List<ProcessedError> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Processed() when $default != null:
return $default(_that.success,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProcessedSuccess> success,  List<ProcessedError> errors)  $default,) {final _that = this;
switch (_that) {
case _Processed():
return $default(_that.success,_that.errors);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProcessedSuccess> success,  List<ProcessedError> errors)?  $default,) {final _that = this;
switch (_that) {
case _Processed() when $default != null:
return $default(_that.success,_that.errors);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Processed implements Processed {
  const _Processed({required final  List<ProcessedSuccess> success, required final  List<ProcessedError> errors}): _success = success,_errors = errors;
  factory _Processed.fromJson(Map<String, dynamic> json) => _$ProcessedFromJson(json);

 final  List<ProcessedSuccess> _success;
@override List<ProcessedSuccess> get success {
  if (_success is EqualUnmodifiableListView) return _success;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_success);
}

 final  List<ProcessedError> _errors;
@override List<ProcessedError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedCopyWith<_Processed> get copyWith => __$ProcessedCopyWithImpl<_Processed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processed&&const DeepCollectionEquality().equals(other._success, _success)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_success),const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'Processed(success: $success, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ProcessedCopyWith<$Res> implements $ProcessedCopyWith<$Res> {
  factory _$ProcessedCopyWith(_Processed value, $Res Function(_Processed) _then) = __$ProcessedCopyWithImpl;
@override @useResult
$Res call({
 List<ProcessedSuccess> success, List<ProcessedError> errors
});




}
/// @nodoc
class __$ProcessedCopyWithImpl<$Res>
    implements _$ProcessedCopyWith<$Res> {
  __$ProcessedCopyWithImpl(this._self, this._then);

  final _Processed _self;
  final $Res Function(_Processed) _then;

/// Create a copy of Processed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? errors = null,}) {
  return _then(_Processed(
success: null == success ? _self._success : success // ignore: cast_nullable_to_non_nullable
as List<ProcessedSuccess>,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<ProcessedError>,
  ));
}


}


/// @nodoc
mixin _$ProcessedSuccess {

 String get item;
/// Create a copy of ProcessedSuccess
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedSuccessCopyWith<ProcessedSuccess> get copyWith => _$ProcessedSuccessCopyWithImpl<ProcessedSuccess>(this as ProcessedSuccess, _$identity);

  /// Serializes this ProcessedSuccess to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessedSuccess&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ProcessedSuccess(item: $item)';
}


}

/// @nodoc
abstract mixin class $ProcessedSuccessCopyWith<$Res>  {
  factory $ProcessedSuccessCopyWith(ProcessedSuccess value, $Res Function(ProcessedSuccess) _then) = _$ProcessedSuccessCopyWithImpl;
@useResult
$Res call({
 String item
});




}
/// @nodoc
class _$ProcessedSuccessCopyWithImpl<$Res>
    implements $ProcessedSuccessCopyWith<$Res> {
  _$ProcessedSuccessCopyWithImpl(this._self, this._then);

  final ProcessedSuccess _self;
  final $Res Function(ProcessedSuccess) _then;

/// Create a copy of ProcessedSuccess
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessedSuccess].
extension ProcessedSuccessPatterns on ProcessedSuccess {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessedSuccess value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessedSuccess() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessedSuccess value)  $default,){
final _that = this;
switch (_that) {
case _ProcessedSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessedSuccess value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessedSuccess() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessedSuccess() when $default != null:
return $default(_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item)  $default,) {final _that = this;
switch (_that) {
case _ProcessedSuccess():
return $default(_that.item);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item)?  $default,) {final _that = this;
switch (_that) {
case _ProcessedSuccess() when $default != null:
return $default(_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessedSuccess implements ProcessedSuccess {
  const _ProcessedSuccess({required this.item});
  factory _ProcessedSuccess.fromJson(Map<String, dynamic> json) => _$ProcessedSuccessFromJson(json);

@override final  String item;

/// Create a copy of ProcessedSuccess
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedSuccessCopyWith<_ProcessedSuccess> get copyWith => __$ProcessedSuccessCopyWithImpl<_ProcessedSuccess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedSuccessToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessedSuccess&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'ProcessedSuccess(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ProcessedSuccessCopyWith<$Res> implements $ProcessedSuccessCopyWith<$Res> {
  factory _$ProcessedSuccessCopyWith(_ProcessedSuccess value, $Res Function(_ProcessedSuccess) _then) = __$ProcessedSuccessCopyWithImpl;
@override @useResult
$Res call({
 String item
});




}
/// @nodoc
class __$ProcessedSuccessCopyWithImpl<$Res>
    implements _$ProcessedSuccessCopyWith<$Res> {
  __$ProcessedSuccessCopyWithImpl(this._self, this._then);

  final _ProcessedSuccess _self;
  final $Res Function(_ProcessedSuccess) _then;

/// Create a copy of ProcessedSuccess
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_ProcessedSuccess(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProcessedError {

 String get item; String get error;
/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessedErrorCopyWith<ProcessedError> get copyWith => _$ProcessedErrorCopyWithImpl<ProcessedError>(this as ProcessedError, _$identity);

  /// Serializes this ProcessedError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessedError&&(identical(other.item, item) || other.item == item)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,error);

@override
String toString() {
  return 'ProcessedError(item: $item, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProcessedErrorCopyWith<$Res>  {
  factory $ProcessedErrorCopyWith(ProcessedError value, $Res Function(ProcessedError) _then) = _$ProcessedErrorCopyWithImpl;
@useResult
$Res call({
 String item, String error
});




}
/// @nodoc
class _$ProcessedErrorCopyWithImpl<$Res>
    implements $ProcessedErrorCopyWith<$Res> {
  _$ProcessedErrorCopyWithImpl(this._self, this._then);

  final ProcessedError _self;
  final $Res Function(ProcessedError) _then;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? error = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessedError].
extension ProcessedErrorPatterns on ProcessedError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessedError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessedError value)  $default,){
final _that = this;
switch (_that) {
case _ProcessedError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessedError value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item,  String error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
return $default(_that.item,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item,  String error)  $default,) {final _that = this;
switch (_that) {
case _ProcessedError():
return $default(_that.item,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item,  String error)?  $default,) {final _that = this;
switch (_that) {
case _ProcessedError() when $default != null:
return $default(_that.item,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessedError implements ProcessedError {
  const _ProcessedError({required this.item, required this.error});
  factory _ProcessedError.fromJson(Map<String, dynamic> json) => _$ProcessedErrorFromJson(json);

@override final  String item;
@override final  String error;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessedErrorCopyWith<_ProcessedError> get copyWith => __$ProcessedErrorCopyWithImpl<_ProcessedError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessedErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessedError&&(identical(other.item, item) || other.item == item)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,error);

@override
String toString() {
  return 'ProcessedError(item: $item, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProcessedErrorCopyWith<$Res> implements $ProcessedErrorCopyWith<$Res> {
  factory _$ProcessedErrorCopyWith(_ProcessedError value, $Res Function(_ProcessedError) _then) = __$ProcessedErrorCopyWithImpl;
@override @useResult
$Res call({
 String item, String error
});




}
/// @nodoc
class __$ProcessedErrorCopyWithImpl<$Res>
    implements _$ProcessedErrorCopyWith<$Res> {
  __$ProcessedErrorCopyWithImpl(this._self, this._then);

  final _ProcessedError _self;
  final $Res Function(_ProcessedError) _then;

/// Create a copy of ProcessedError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? error = null,}) {
  return _then(_ProcessedError(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
