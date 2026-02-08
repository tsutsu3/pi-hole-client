// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoHost {

 String get domainName; String get arch; String get hostName; String get release; String get sysName; String get version; String? get model;// v6-only field
 DmiInfo? get dmi;
/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoHostCopyWith<InfoHost> get copyWith => _$InfoHostCopyWithImpl<InfoHost>(this as InfoHost, _$identity);

  /// Serializes this InfoHost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoHost&&(identical(other.domainName, domainName) || other.domainName == domainName)&&(identical(other.arch, arch) || other.arch == arch)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.release, release) || other.release == release)&&(identical(other.sysName, sysName) || other.sysName == sysName)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model)&&(identical(other.dmi, dmi) || other.dmi == dmi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domainName,arch,hostName,release,sysName,version,model,dmi);

@override
String toString() {
  return 'InfoHost(domainName: $domainName, arch: $arch, hostName: $hostName, release: $release, sysName: $sysName, version: $version, model: $model, dmi: $dmi)';
}


}

/// @nodoc
abstract mixin class $InfoHostCopyWith<$Res>  {
  factory $InfoHostCopyWith(InfoHost value, $Res Function(InfoHost) _then) = _$InfoHostCopyWithImpl;
@useResult
$Res call({
 String domainName, String arch, String hostName, String release, String sysName, String version, String? model, DmiInfo? dmi
});


$DmiInfoCopyWith<$Res>? get dmi;

}
/// @nodoc
class _$InfoHostCopyWithImpl<$Res>
    implements $InfoHostCopyWith<$Res> {
  _$InfoHostCopyWithImpl(this._self, this._then);

  final InfoHost _self;
  final $Res Function(InfoHost) _then;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? domainName = null,Object? arch = null,Object? hostName = null,Object? release = null,Object? sysName = null,Object? version = null,Object? model = freezed,Object? dmi = freezed,}) {
  return _then(_self.copyWith(
domainName: null == domainName ? _self.domainName : domainName // ignore: cast_nullable_to_non_nullable
as String,arch: null == arch ? _self.arch : arch // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String,sysName: null == sysName ? _self.sysName : sysName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,dmi: freezed == dmi ? _self.dmi : dmi // ignore: cast_nullable_to_non_nullable
as DmiInfo?,
  ));
}
/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiInfoCopyWith<$Res>? get dmi {
    if (_self.dmi == null) {
    return null;
  }

  return $DmiInfoCopyWith<$Res>(_self.dmi!, (value) {
    return _then(_self.copyWith(dmi: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoHost].
extension InfoHostPatterns on InfoHost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoHost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoHost value)  $default,){
final _that = this;
switch (_that) {
case _InfoHost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoHost value)?  $default,){
final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model,  DmiInfo? dmi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model,_that.dmi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model,  DmiInfo? dmi)  $default,) {final _that = this;
switch (_that) {
case _InfoHost():
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model,_that.dmi);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String domainName,  String arch,  String hostName,  String release,  String sysName,  String version,  String? model,  DmiInfo? dmi)?  $default,) {final _that = this;
switch (_that) {
case _InfoHost() when $default != null:
return $default(_that.domainName,_that.arch,_that.hostName,_that.release,_that.sysName,_that.version,_that.model,_that.dmi);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoHost implements InfoHost {
  const _InfoHost({required this.domainName, required this.arch, required this.hostName, required this.release, required this.sysName, required this.version, this.model, this.dmi});
  factory _InfoHost.fromJson(Map<String, dynamic> json) => _$InfoHostFromJson(json);

@override final  String domainName;
@override final  String arch;
@override final  String hostName;
@override final  String release;
@override final  String sysName;
@override final  String version;
@override final  String? model;
// v6-only field
@override final  DmiInfo? dmi;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoHostCopyWith<_InfoHost> get copyWith => __$InfoHostCopyWithImpl<_InfoHost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoHostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoHost&&(identical(other.domainName, domainName) || other.domainName == domainName)&&(identical(other.arch, arch) || other.arch == arch)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.release, release) || other.release == release)&&(identical(other.sysName, sysName) || other.sysName == sysName)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model)&&(identical(other.dmi, dmi) || other.dmi == dmi));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,domainName,arch,hostName,release,sysName,version,model,dmi);

@override
String toString() {
  return 'InfoHost(domainName: $domainName, arch: $arch, hostName: $hostName, release: $release, sysName: $sysName, version: $version, model: $model, dmi: $dmi)';
}


}

/// @nodoc
abstract mixin class _$InfoHostCopyWith<$Res> implements $InfoHostCopyWith<$Res> {
  factory _$InfoHostCopyWith(_InfoHost value, $Res Function(_InfoHost) _then) = __$InfoHostCopyWithImpl;
@override @useResult
$Res call({
 String domainName, String arch, String hostName, String release, String sysName, String version, String? model, DmiInfo? dmi
});


@override $DmiInfoCopyWith<$Res>? get dmi;

}
/// @nodoc
class __$InfoHostCopyWithImpl<$Res>
    implements _$InfoHostCopyWith<$Res> {
  __$InfoHostCopyWithImpl(this._self, this._then);

  final _InfoHost _self;
  final $Res Function(_InfoHost) _then;

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? domainName = null,Object? arch = null,Object? hostName = null,Object? release = null,Object? sysName = null,Object? version = null,Object? model = freezed,Object? dmi = freezed,}) {
  return _then(_InfoHost(
domainName: null == domainName ? _self.domainName : domainName // ignore: cast_nullable_to_non_nullable
as String,arch: null == arch ? _self.arch : arch // ignore: cast_nullable_to_non_nullable
as String,hostName: null == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as String,sysName: null == sysName ? _self.sysName : sysName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,dmi: freezed == dmi ? _self.dmi : dmi // ignore: cast_nullable_to_non_nullable
as DmiInfo?,
  ));
}

/// Create a copy of InfoHost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiInfoCopyWith<$Res>? get dmi {
    if (_self.dmi == null) {
    return null;
  }

  return $DmiInfoCopyWith<$Res>(_self.dmi!, (value) {
    return _then(_self.copyWith(dmi: value));
  });
}
}


/// @nodoc
mixin _$DmiInfo {

 DmiBios? get bios; DmiBoard? get board; DmiProduct? get product; DmiSys? get sys;
/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmiInfoCopyWith<DmiInfo> get copyWith => _$DmiInfoCopyWithImpl<DmiInfo>(this as DmiInfo, _$identity);

  /// Serializes this DmiInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmiInfo&&(identical(other.bios, bios) || other.bios == bios)&&(identical(other.board, board) || other.board == board)&&(identical(other.product, product) || other.product == product)&&(identical(other.sys, sys) || other.sys == sys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bios,board,product,sys);

@override
String toString() {
  return 'DmiInfo(bios: $bios, board: $board, product: $product, sys: $sys)';
}


}

/// @nodoc
abstract mixin class $DmiInfoCopyWith<$Res>  {
  factory $DmiInfoCopyWith(DmiInfo value, $Res Function(DmiInfo) _then) = _$DmiInfoCopyWithImpl;
@useResult
$Res call({
 DmiBios? bios, DmiBoard? board, DmiProduct? product, DmiSys? sys
});


$DmiBiosCopyWith<$Res>? get bios;$DmiBoardCopyWith<$Res>? get board;$DmiProductCopyWith<$Res>? get product;$DmiSysCopyWith<$Res>? get sys;

}
/// @nodoc
class _$DmiInfoCopyWithImpl<$Res>
    implements $DmiInfoCopyWith<$Res> {
  _$DmiInfoCopyWithImpl(this._self, this._then);

  final DmiInfo _self;
  final $Res Function(DmiInfo) _then;

/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bios = freezed,Object? board = freezed,Object? product = freezed,Object? sys = freezed,}) {
  return _then(_self.copyWith(
bios: freezed == bios ? _self.bios : bios // ignore: cast_nullable_to_non_nullable
as DmiBios?,board: freezed == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as DmiBoard?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as DmiProduct?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as DmiSys?,
  ));
}
/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiBiosCopyWith<$Res>? get bios {
    if (_self.bios == null) {
    return null;
  }

  return $DmiBiosCopyWith<$Res>(_self.bios!, (value) {
    return _then(_self.copyWith(bios: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiBoardCopyWith<$Res>? get board {
    if (_self.board == null) {
    return null;
  }

  return $DmiBoardCopyWith<$Res>(_self.board!, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $DmiProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiSysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $DmiSysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// Adds pattern-matching-related methods to [DmiInfo].
extension DmiInfoPatterns on DmiInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmiInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmiInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmiInfo value)  $default,){
final _that = this;
switch (_that) {
case _DmiInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmiInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DmiInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DmiBios? bios,  DmiBoard? board,  DmiProduct? product,  DmiSys? sys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmiInfo() when $default != null:
return $default(_that.bios,_that.board,_that.product,_that.sys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DmiBios? bios,  DmiBoard? board,  DmiProduct? product,  DmiSys? sys)  $default,) {final _that = this;
switch (_that) {
case _DmiInfo():
return $default(_that.bios,_that.board,_that.product,_that.sys);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DmiBios? bios,  DmiBoard? board,  DmiProduct? product,  DmiSys? sys)?  $default,) {final _that = this;
switch (_that) {
case _DmiInfo() when $default != null:
return $default(_that.bios,_that.board,_that.product,_that.sys);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DmiInfo implements DmiInfo {
  const _DmiInfo({this.bios, this.board, this.product, this.sys});
  factory _DmiInfo.fromJson(Map<String, dynamic> json) => _$DmiInfoFromJson(json);

@override final  DmiBios? bios;
@override final  DmiBoard? board;
@override final  DmiProduct? product;
@override final  DmiSys? sys;

/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmiInfoCopyWith<_DmiInfo> get copyWith => __$DmiInfoCopyWithImpl<_DmiInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmiInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmiInfo&&(identical(other.bios, bios) || other.bios == bios)&&(identical(other.board, board) || other.board == board)&&(identical(other.product, product) || other.product == product)&&(identical(other.sys, sys) || other.sys == sys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bios,board,product,sys);

@override
String toString() {
  return 'DmiInfo(bios: $bios, board: $board, product: $product, sys: $sys)';
}


}

/// @nodoc
abstract mixin class _$DmiInfoCopyWith<$Res> implements $DmiInfoCopyWith<$Res> {
  factory _$DmiInfoCopyWith(_DmiInfo value, $Res Function(_DmiInfo) _then) = __$DmiInfoCopyWithImpl;
@override @useResult
$Res call({
 DmiBios? bios, DmiBoard? board, DmiProduct? product, DmiSys? sys
});


@override $DmiBiosCopyWith<$Res>? get bios;@override $DmiBoardCopyWith<$Res>? get board;@override $DmiProductCopyWith<$Res>? get product;@override $DmiSysCopyWith<$Res>? get sys;

}
/// @nodoc
class __$DmiInfoCopyWithImpl<$Res>
    implements _$DmiInfoCopyWith<$Res> {
  __$DmiInfoCopyWithImpl(this._self, this._then);

  final _DmiInfo _self;
  final $Res Function(_DmiInfo) _then;

/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bios = freezed,Object? board = freezed,Object? product = freezed,Object? sys = freezed,}) {
  return _then(_DmiInfo(
bios: freezed == bios ? _self.bios : bios // ignore: cast_nullable_to_non_nullable
as DmiBios?,board: freezed == board ? _self.board : board // ignore: cast_nullable_to_non_nullable
as DmiBoard?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as DmiProduct?,sys: freezed == sys ? _self.sys : sys // ignore: cast_nullable_to_non_nullable
as DmiSys?,
  ));
}

/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiBiosCopyWith<$Res>? get bios {
    if (_self.bios == null) {
    return null;
  }

  return $DmiBiosCopyWith<$Res>(_self.bios!, (value) {
    return _then(_self.copyWith(bios: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiBoardCopyWith<$Res>? get board {
    if (_self.board == null) {
    return null;
  }

  return $DmiBoardCopyWith<$Res>(_self.board!, (value) {
    return _then(_self.copyWith(board: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $DmiProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of DmiInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DmiSysCopyWith<$Res>? get sys {
    if (_self.sys == null) {
    return null;
  }

  return $DmiSysCopyWith<$Res>(_self.sys!, (value) {
    return _then(_self.copyWith(sys: value));
  });
}
}


/// @nodoc
mixin _$DmiBios {

 String? get vendor; String? get version; String? get date;
/// Create a copy of DmiBios
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmiBiosCopyWith<DmiBios> get copyWith => _$DmiBiosCopyWithImpl<DmiBios>(this as DmiBios, _$identity);

  /// Serializes this DmiBios to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmiBios&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,version,date);

@override
String toString() {
  return 'DmiBios(vendor: $vendor, version: $version, date: $date)';
}


}

/// @nodoc
abstract mixin class $DmiBiosCopyWith<$Res>  {
  factory $DmiBiosCopyWith(DmiBios value, $Res Function(DmiBios) _then) = _$DmiBiosCopyWithImpl;
@useResult
$Res call({
 String? vendor, String? version, String? date
});




}
/// @nodoc
class _$DmiBiosCopyWithImpl<$Res>
    implements $DmiBiosCopyWith<$Res> {
  _$DmiBiosCopyWithImpl(this._self, this._then);

  final DmiBios _self;
  final $Res Function(DmiBios) _then;

/// Create a copy of DmiBios
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendor = freezed,Object? version = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DmiBios].
extension DmiBiosPatterns on DmiBios {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmiBios value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmiBios() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmiBios value)  $default,){
final _that = this;
switch (_that) {
case _DmiBios():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmiBios value)?  $default,){
final _that = this;
switch (_that) {
case _DmiBios() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? vendor,  String? version,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmiBios() when $default != null:
return $default(_that.vendor,_that.version,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? vendor,  String? version,  String? date)  $default,) {final _that = this;
switch (_that) {
case _DmiBios():
return $default(_that.vendor,_that.version,_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? vendor,  String? version,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _DmiBios() when $default != null:
return $default(_that.vendor,_that.version,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DmiBios implements DmiBios {
  const _DmiBios({this.vendor, this.version, this.date});
  factory _DmiBios.fromJson(Map<String, dynamic> json) => _$DmiBiosFromJson(json);

@override final  String? vendor;
@override final  String? version;
@override final  String? date;

/// Create a copy of DmiBios
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmiBiosCopyWith<_DmiBios> get copyWith => __$DmiBiosCopyWithImpl<_DmiBios>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmiBiosToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmiBios&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,version,date);

@override
String toString() {
  return 'DmiBios(vendor: $vendor, version: $version, date: $date)';
}


}

/// @nodoc
abstract mixin class _$DmiBiosCopyWith<$Res> implements $DmiBiosCopyWith<$Res> {
  factory _$DmiBiosCopyWith(_DmiBios value, $Res Function(_DmiBios) _then) = __$DmiBiosCopyWithImpl;
@override @useResult
$Res call({
 String? vendor, String? version, String? date
});




}
/// @nodoc
class __$DmiBiosCopyWithImpl<$Res>
    implements _$DmiBiosCopyWith<$Res> {
  __$DmiBiosCopyWithImpl(this._self, this._then);

  final _DmiBios _self;
  final $Res Function(_DmiBios) _then;

/// Create a copy of DmiBios
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendor = freezed,Object? version = freezed,Object? date = freezed,}) {
  return _then(_DmiBios(
vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DmiBoard {

 String? get name; String? get vendor; String? get version;
/// Create a copy of DmiBoard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmiBoardCopyWith<DmiBoard> get copyWith => _$DmiBoardCopyWithImpl<DmiBoard>(this as DmiBoard, _$identity);

  /// Serializes this DmiBoard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmiBoard&&(identical(other.name, name) || other.name == name)&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,vendor,version);

@override
String toString() {
  return 'DmiBoard(name: $name, vendor: $vendor, version: $version)';
}


}

/// @nodoc
abstract mixin class $DmiBoardCopyWith<$Res>  {
  factory $DmiBoardCopyWith(DmiBoard value, $Res Function(DmiBoard) _then) = _$DmiBoardCopyWithImpl;
@useResult
$Res call({
 String? name, String? vendor, String? version
});




}
/// @nodoc
class _$DmiBoardCopyWithImpl<$Res>
    implements $DmiBoardCopyWith<$Res> {
  _$DmiBoardCopyWithImpl(this._self, this._then);

  final DmiBoard _self;
  final $Res Function(DmiBoard) _then;

/// Create a copy of DmiBoard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? vendor = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DmiBoard].
extension DmiBoardPatterns on DmiBoard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmiBoard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmiBoard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmiBoard value)  $default,){
final _that = this;
switch (_that) {
case _DmiBoard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmiBoard value)?  $default,){
final _that = this;
switch (_that) {
case _DmiBoard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? vendor,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmiBoard() when $default != null:
return $default(_that.name,_that.vendor,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? vendor,  String? version)  $default,) {final _that = this;
switch (_that) {
case _DmiBoard():
return $default(_that.name,_that.vendor,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? vendor,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _DmiBoard() when $default != null:
return $default(_that.name,_that.vendor,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DmiBoard implements DmiBoard {
  const _DmiBoard({this.name, this.vendor, this.version});
  factory _DmiBoard.fromJson(Map<String, dynamic> json) => _$DmiBoardFromJson(json);

@override final  String? name;
@override final  String? vendor;
@override final  String? version;

/// Create a copy of DmiBoard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmiBoardCopyWith<_DmiBoard> get copyWith => __$DmiBoardCopyWithImpl<_DmiBoard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmiBoardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmiBoard&&(identical(other.name, name) || other.name == name)&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,vendor,version);

@override
String toString() {
  return 'DmiBoard(name: $name, vendor: $vendor, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DmiBoardCopyWith<$Res> implements $DmiBoardCopyWith<$Res> {
  factory _$DmiBoardCopyWith(_DmiBoard value, $Res Function(_DmiBoard) _then) = __$DmiBoardCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? vendor, String? version
});




}
/// @nodoc
class __$DmiBoardCopyWithImpl<$Res>
    implements _$DmiBoardCopyWith<$Res> {
  __$DmiBoardCopyWithImpl(this._self, this._then);

  final _DmiBoard _self;
  final $Res Function(_DmiBoard) _then;

/// Create a copy of DmiBoard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? vendor = freezed,Object? version = freezed,}) {
  return _then(_DmiBoard(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DmiProduct {

 String? get name; String? get family; String? get version;
/// Create a copy of DmiProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmiProductCopyWith<DmiProduct> get copyWith => _$DmiProductCopyWithImpl<DmiProduct>(this as DmiProduct, _$identity);

  /// Serializes this DmiProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmiProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.family, family) || other.family == family)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,family,version);

@override
String toString() {
  return 'DmiProduct(name: $name, family: $family, version: $version)';
}


}

/// @nodoc
abstract mixin class $DmiProductCopyWith<$Res>  {
  factory $DmiProductCopyWith(DmiProduct value, $Res Function(DmiProduct) _then) = _$DmiProductCopyWithImpl;
@useResult
$Res call({
 String? name, String? family, String? version
});




}
/// @nodoc
class _$DmiProductCopyWithImpl<$Res>
    implements $DmiProductCopyWith<$Res> {
  _$DmiProductCopyWithImpl(this._self, this._then);

  final DmiProduct _self;
  final $Res Function(DmiProduct) _then;

/// Create a copy of DmiProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? family = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DmiProduct].
extension DmiProductPatterns on DmiProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmiProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmiProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmiProduct value)  $default,){
final _that = this;
switch (_that) {
case _DmiProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmiProduct value)?  $default,){
final _that = this;
switch (_that) {
case _DmiProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? family,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmiProduct() when $default != null:
return $default(_that.name,_that.family,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? family,  String? version)  $default,) {final _that = this;
switch (_that) {
case _DmiProduct():
return $default(_that.name,_that.family,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? family,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _DmiProduct() when $default != null:
return $default(_that.name,_that.family,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DmiProduct implements DmiProduct {
  const _DmiProduct({this.name, this.family, this.version});
  factory _DmiProduct.fromJson(Map<String, dynamic> json) => _$DmiProductFromJson(json);

@override final  String? name;
@override final  String? family;
@override final  String? version;

/// Create a copy of DmiProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmiProductCopyWith<_DmiProduct> get copyWith => __$DmiProductCopyWithImpl<_DmiProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmiProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmiProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.family, family) || other.family == family)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,family,version);

@override
String toString() {
  return 'DmiProduct(name: $name, family: $family, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DmiProductCopyWith<$Res> implements $DmiProductCopyWith<$Res> {
  factory _$DmiProductCopyWith(_DmiProduct value, $Res Function(_DmiProduct) _then) = __$DmiProductCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? family, String? version
});




}
/// @nodoc
class __$DmiProductCopyWithImpl<$Res>
    implements _$DmiProductCopyWith<$Res> {
  __$DmiProductCopyWithImpl(this._self, this._then);

  final _DmiProduct _self;
  final $Res Function(_DmiProduct) _then;

/// Create a copy of DmiProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? family = freezed,Object? version = freezed,}) {
  return _then(_DmiProduct(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,family: freezed == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DmiSys {

 String? get vendor; String? get version;
/// Create a copy of DmiSys
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DmiSysCopyWith<DmiSys> get copyWith => _$DmiSysCopyWithImpl<DmiSys>(this as DmiSys, _$identity);

  /// Serializes this DmiSys to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DmiSys&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,version);

@override
String toString() {
  return 'DmiSys(vendor: $vendor, version: $version)';
}


}

/// @nodoc
abstract mixin class $DmiSysCopyWith<$Res>  {
  factory $DmiSysCopyWith(DmiSys value, $Res Function(DmiSys) _then) = _$DmiSysCopyWithImpl;
@useResult
$Res call({
 String? vendor, String? version
});




}
/// @nodoc
class _$DmiSysCopyWithImpl<$Res>
    implements $DmiSysCopyWith<$Res> {
  _$DmiSysCopyWithImpl(this._self, this._then);

  final DmiSys _self;
  final $Res Function(DmiSys) _then;

/// Create a copy of DmiSys
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vendor = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DmiSys].
extension DmiSysPatterns on DmiSys {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DmiSys value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DmiSys() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DmiSys value)  $default,){
final _that = this;
switch (_that) {
case _DmiSys():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DmiSys value)?  $default,){
final _that = this;
switch (_that) {
case _DmiSys() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? vendor,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DmiSys() when $default != null:
return $default(_that.vendor,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? vendor,  String? version)  $default,) {final _that = this;
switch (_that) {
case _DmiSys():
return $default(_that.vendor,_that.version);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? vendor,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _DmiSys() when $default != null:
return $default(_that.vendor,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DmiSys implements DmiSys {
  const _DmiSys({this.vendor, this.version});
  factory _DmiSys.fromJson(Map<String, dynamic> json) => _$DmiSysFromJson(json);

@override final  String? vendor;
@override final  String? version;

/// Create a copy of DmiSys
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DmiSysCopyWith<_DmiSys> get copyWith => __$DmiSysCopyWithImpl<_DmiSys>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DmiSysToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DmiSys&&(identical(other.vendor, vendor) || other.vendor == vendor)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vendor,version);

@override
String toString() {
  return 'DmiSys(vendor: $vendor, version: $version)';
}


}

/// @nodoc
abstract mixin class _$DmiSysCopyWith<$Res> implements $DmiSysCopyWith<$Res> {
  factory _$DmiSysCopyWith(_DmiSys value, $Res Function(_DmiSys) _then) = __$DmiSysCopyWithImpl;
@override @useResult
$Res call({
 String? vendor, String? version
});




}
/// @nodoc
class __$DmiSysCopyWithImpl<$Res>
    implements _$DmiSysCopyWith<$Res> {
  __$DmiSysCopyWithImpl(this._self, this._then);

  final _DmiSys _self;
  final $Res Function(_DmiSys) _then;

/// Create a copy of DmiSys
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vendor = freezed,Object? version = freezed,}) {
  return _then(_DmiSys(
vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
