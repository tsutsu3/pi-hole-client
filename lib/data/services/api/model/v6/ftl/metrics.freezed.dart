// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoMetrics {

 MetricsData get metrics; double get took;
/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoMetricsCopyWith<InfoMetrics> get copyWith => _$InfoMetricsCopyWithImpl<InfoMetrics>(this as InfoMetrics, _$identity);

  /// Serializes this InfoMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoMetrics&&(identical(other.metrics, metrics) || other.metrics == metrics)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metrics,took);

@override
String toString() {
  return 'InfoMetrics(metrics: $metrics, took: $took)';
}


}

/// @nodoc
abstract mixin class $InfoMetricsCopyWith<$Res>  {
  factory $InfoMetricsCopyWith(InfoMetrics value, $Res Function(InfoMetrics) _then) = _$InfoMetricsCopyWithImpl;
@useResult
$Res call({
 MetricsData metrics, double took
});


$MetricsDataCopyWith<$Res> get metrics;

}
/// @nodoc
class _$InfoMetricsCopyWithImpl<$Res>
    implements $InfoMetricsCopyWith<$Res> {
  _$InfoMetricsCopyWithImpl(this._self, this._then);

  final InfoMetrics _self;
  final $Res Function(InfoMetrics) _then;

/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metrics = null,Object? took = null,}) {
  return _then(_self.copyWith(
metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as MetricsData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<$Res> get metrics {
  
  return $MetricsDataCopyWith<$Res>(_self.metrics, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// Adds pattern-matching-related methods to [InfoMetrics].
extension InfoMetricsPatterns on InfoMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoMetrics value)  $default,){
final _that = this;
switch (_that) {
case _InfoMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _InfoMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MetricsData metrics,  double took)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoMetrics() when $default != null:
return $default(_that.metrics,_that.took);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MetricsData metrics,  double took)  $default,) {final _that = this;
switch (_that) {
case _InfoMetrics():
return $default(_that.metrics,_that.took);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MetricsData metrics,  double took)?  $default,) {final _that = this;
switch (_that) {
case _InfoMetrics() when $default != null:
return $default(_that.metrics,_that.took);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _InfoMetrics implements InfoMetrics {
  const _InfoMetrics({required this.metrics, required this.took});
  factory _InfoMetrics.fromJson(Map<String, dynamic> json) => _$InfoMetricsFromJson(json);

@override final  MetricsData metrics;
@override final  double took;

/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoMetricsCopyWith<_InfoMetrics> get copyWith => __$InfoMetricsCopyWithImpl<_InfoMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoMetrics&&(identical(other.metrics, metrics) || other.metrics == metrics)&&(identical(other.took, took) || other.took == took));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metrics,took);

@override
String toString() {
  return 'InfoMetrics(metrics: $metrics, took: $took)';
}


}

/// @nodoc
abstract mixin class _$InfoMetricsCopyWith<$Res> implements $InfoMetricsCopyWith<$Res> {
  factory _$InfoMetricsCopyWith(_InfoMetrics value, $Res Function(_InfoMetrics) _then) = __$InfoMetricsCopyWithImpl;
@override @useResult
$Res call({
 MetricsData metrics, double took
});


@override $MetricsDataCopyWith<$Res> get metrics;

}
/// @nodoc
class __$InfoMetricsCopyWithImpl<$Res>
    implements _$InfoMetricsCopyWith<$Res> {
  __$InfoMetricsCopyWithImpl(this._self, this._then);

  final _InfoMetrics _self;
  final $Res Function(_InfoMetrics) _then;

/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metrics = null,Object? took = null,}) {
  return _then(_InfoMetrics(
metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as MetricsData,took: null == took ? _self.took : took // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of InfoMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<$Res> get metrics {
  
  return $MetricsDataCopyWith<$Res>(_self.metrics, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// @nodoc
mixin _$MetricsData {

 DnsMetrics get dns; DhcpMetrics get dhcp;
/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsDataCopyWith<MetricsData> get copyWith => _$MetricsDataCopyWithImpl<MetricsData>(this as MetricsData, _$identity);

  /// Serializes this MetricsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricsData&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dhcp, dhcp) || other.dhcp == dhcp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns,dhcp);

@override
String toString() {
  return 'MetricsData(dns: $dns, dhcp: $dhcp)';
}


}

/// @nodoc
abstract mixin class $MetricsDataCopyWith<$Res>  {
  factory $MetricsDataCopyWith(MetricsData value, $Res Function(MetricsData) _then) = _$MetricsDataCopyWithImpl;
@useResult
$Res call({
 DnsMetrics dns, DhcpMetrics dhcp
});


$DnsMetricsCopyWith<$Res> get dns;$DhcpMetricsCopyWith<$Res> get dhcp;

}
/// @nodoc
class _$MetricsDataCopyWithImpl<$Res>
    implements $MetricsDataCopyWith<$Res> {
  _$MetricsDataCopyWithImpl(this._self, this._then);

  final MetricsData _self;
  final $Res Function(MetricsData) _then;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dns = null,Object? dhcp = null,}) {
  return _then(_self.copyWith(
dns: null == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as DnsMetrics,dhcp: null == dhcp ? _self.dhcp : dhcp // ignore: cast_nullable_to_non_nullable
as DhcpMetrics,
  ));
}
/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsMetricsCopyWith<$Res> get dns {
  
  return $DnsMetricsCopyWith<$Res>(_self.dns, (value) {
    return _then(_self.copyWith(dns: value));
  });
}/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpMetricsCopyWith<$Res> get dhcp {
  
  return $DhcpMetricsCopyWith<$Res>(_self.dhcp, (value) {
    return _then(_self.copyWith(dhcp: value));
  });
}
}


/// Adds pattern-matching-related methods to [MetricsData].
extension MetricsDataPatterns on MetricsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricsData value)  $default,){
final _that = this;
switch (_that) {
case _MetricsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricsData value)?  $default,){
final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsMetrics dns,  DhcpMetrics dhcp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that.dns,_that.dhcp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsMetrics dns,  DhcpMetrics dhcp)  $default,) {final _that = this;
switch (_that) {
case _MetricsData():
return $default(_that.dns,_that.dhcp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsMetrics dns,  DhcpMetrics dhcp)?  $default,) {final _that = this;
switch (_that) {
case _MetricsData() when $default != null:
return $default(_that.dns,_that.dhcp);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MetricsData implements MetricsData {
  const _MetricsData({required this.dns, required this.dhcp});
  factory _MetricsData.fromJson(Map<String, dynamic> json) => _$MetricsDataFromJson(json);

@override final  DnsMetrics dns;
@override final  DhcpMetrics dhcp;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsDataCopyWith<_MetricsData> get copyWith => __$MetricsDataCopyWithImpl<_MetricsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricsData&&(identical(other.dns, dns) || other.dns == dns)&&(identical(other.dhcp, dhcp) || other.dhcp == dhcp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dns,dhcp);

@override
String toString() {
  return 'MetricsData(dns: $dns, dhcp: $dhcp)';
}


}

/// @nodoc
abstract mixin class _$MetricsDataCopyWith<$Res> implements $MetricsDataCopyWith<$Res> {
  factory _$MetricsDataCopyWith(_MetricsData value, $Res Function(_MetricsData) _then) = __$MetricsDataCopyWithImpl;
@override @useResult
$Res call({
 DnsMetrics dns, DhcpMetrics dhcp
});


@override $DnsMetricsCopyWith<$Res> get dns;@override $DhcpMetricsCopyWith<$Res> get dhcp;

}
/// @nodoc
class __$MetricsDataCopyWithImpl<$Res>
    implements _$MetricsDataCopyWith<$Res> {
  __$MetricsDataCopyWithImpl(this._self, this._then);

  final _MetricsData _self;
  final $Res Function(_MetricsData) _then;

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dns = null,Object? dhcp = null,}) {
  return _then(_MetricsData(
dns: null == dns ? _self.dns : dns // ignore: cast_nullable_to_non_nullable
as DnsMetrics,dhcp: null == dhcp ? _self.dhcp : dhcp // ignore: cast_nullable_to_non_nullable
as DhcpMetrics,
  ));
}

/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsMetricsCopyWith<$Res> get dns {
  
  return $DnsMetricsCopyWith<$Res>(_self.dns, (value) {
    return _then(_self.copyWith(dns: value));
  });
}/// Create a copy of MetricsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpMetricsCopyWith<$Res> get dhcp {
  
  return $DhcpMetricsCopyWith<$Res>(_self.dhcp, (value) {
    return _then(_self.copyWith(dhcp: value));
  });
}
}


/// @nodoc
mixin _$DnsMetrics {

 DnsCache get cache; DnsReplies get replies;
/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsMetricsCopyWith<DnsMetrics> get copyWith => _$DnsMetricsCopyWithImpl<DnsMetrics>(this as DnsMetrics, _$identity);

  /// Serializes this DnsMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsMetrics&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.replies, replies) || other.replies == replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cache,replies);

@override
String toString() {
  return 'DnsMetrics(cache: $cache, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $DnsMetricsCopyWith<$Res>  {
  factory $DnsMetricsCopyWith(DnsMetrics value, $Res Function(DnsMetrics) _then) = _$DnsMetricsCopyWithImpl;
@useResult
$Res call({
 DnsCache cache, DnsReplies replies
});


$DnsCacheCopyWith<$Res> get cache;$DnsRepliesCopyWith<$Res> get replies;

}
/// @nodoc
class _$DnsMetricsCopyWithImpl<$Res>
    implements $DnsMetricsCopyWith<$Res> {
  _$DnsMetricsCopyWithImpl(this._self, this._then);

  final DnsMetrics _self;
  final $Res Function(DnsMetrics) _then;

/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cache = null,Object? replies = null,}) {
  return _then(_self.copyWith(
cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as DnsReplies,
  ));
}
/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<$Res> get cache {
  
  return $DnsCacheCopyWith<$Res>(_self.cache, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsRepliesCopyWith<$Res> get replies {
  
  return $DnsRepliesCopyWith<$Res>(_self.replies, (value) {
    return _then(_self.copyWith(replies: value));
  });
}
}


/// Adds pattern-matching-related methods to [DnsMetrics].
extension DnsMetricsPatterns on DnsMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsMetrics value)  $default,){
final _that = this;
switch (_that) {
case _DnsMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _DnsMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DnsCache cache,  DnsReplies replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsMetrics() when $default != null:
return $default(_that.cache,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DnsCache cache,  DnsReplies replies)  $default,) {final _that = this;
switch (_that) {
case _DnsMetrics():
return $default(_that.cache,_that.replies);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DnsCache cache,  DnsReplies replies)?  $default,) {final _that = this;
switch (_that) {
case _DnsMetrics() when $default != null:
return $default(_that.cache,_that.replies);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsMetrics implements DnsMetrics {
  const _DnsMetrics({required this.cache, required this.replies});
  factory _DnsMetrics.fromJson(Map<String, dynamic> json) => _$DnsMetricsFromJson(json);

@override final  DnsCache cache;
@override final  DnsReplies replies;

/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsMetricsCopyWith<_DnsMetrics> get copyWith => __$DnsMetricsCopyWithImpl<_DnsMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsMetrics&&(identical(other.cache, cache) || other.cache == cache)&&(identical(other.replies, replies) || other.replies == replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cache,replies);

@override
String toString() {
  return 'DnsMetrics(cache: $cache, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$DnsMetricsCopyWith<$Res> implements $DnsMetricsCopyWith<$Res> {
  factory _$DnsMetricsCopyWith(_DnsMetrics value, $Res Function(_DnsMetrics) _then) = __$DnsMetricsCopyWithImpl;
@override @useResult
$Res call({
 DnsCache cache, DnsReplies replies
});


@override $DnsCacheCopyWith<$Res> get cache;@override $DnsRepliesCopyWith<$Res> get replies;

}
/// @nodoc
class __$DnsMetricsCopyWithImpl<$Res>
    implements _$DnsMetricsCopyWith<$Res> {
  __$DnsMetricsCopyWithImpl(this._self, this._then);

  final _DnsMetrics _self;
  final $Res Function(_DnsMetrics) _then;

/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cache = null,Object? replies = null,}) {
  return _then(_DnsMetrics(
cache: null == cache ? _self.cache : cache // ignore: cast_nullable_to_non_nullable
as DnsCache,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as DnsReplies,
  ));
}

/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<$Res> get cache {
  
  return $DnsCacheCopyWith<$Res>(_self.cache, (value) {
    return _then(_self.copyWith(cache: value));
  });
}/// Create a copy of DnsMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsRepliesCopyWith<$Res> get replies {
  
  return $DnsRepliesCopyWith<$Res>(_self.replies, (value) {
    return _then(_self.copyWith(replies: value));
  });
}
}


/// @nodoc
mixin _$DnsCache {

 int get size; int get inserted; int get evicted; int get expired; int get immortal; List<DnsCacheEntry> get content;
/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCacheCopyWith<DnsCache> get copyWith => _$DnsCacheCopyWithImpl<DnsCache>(this as DnsCache, _$identity);

  /// Serializes this DnsCache to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted)&&(identical(other.expired, expired) || other.expired == expired)&&(identical(other.immortal, immortal) || other.immortal == immortal)&&const DeepCollectionEquality().equals(other.content, content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,inserted,evicted,expired,immortal,const DeepCollectionEquality().hash(content));

@override
String toString() {
  return 'DnsCache(size: $size, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, content: $content)';
}


}

/// @nodoc
abstract mixin class $DnsCacheCopyWith<$Res>  {
  factory $DnsCacheCopyWith(DnsCache value, $Res Function(DnsCache) _then) = _$DnsCacheCopyWithImpl;
@useResult
$Res call({
 int size, int inserted, int evicted, int expired, int immortal, List<DnsCacheEntry> content
});




}
/// @nodoc
class _$DnsCacheCopyWithImpl<$Res>
    implements $DnsCacheCopyWith<$Res> {
  _$DnsCacheCopyWithImpl(this._self, this._then);

  final DnsCache _self;
  final $Res Function(DnsCache) _then;

/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? inserted = null,Object? evicted = null,Object? expired = null,Object? immortal = null,Object? content = null,}) {
  return _then(_self.copyWith(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,immortal: null == immortal ? _self.immortal : immortal // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<DnsCacheEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsCache].
extension DnsCachePatterns on DnsCache {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsCache value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsCache value)  $default,){
final _that = this;
switch (_that) {
case _DnsCache():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsCache value)?  $default,){
final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsCacheEntry> content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsCacheEntry> content)  $default,) {final _that = this;
switch (_that) {
case _DnsCache():
return $default(_that.size,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.content);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  int inserted,  int evicted,  int expired,  int immortal,  List<DnsCacheEntry> content)?  $default,) {final _that = this;
switch (_that) {
case _DnsCache() when $default != null:
return $default(_that.size,_that.inserted,_that.evicted,_that.expired,_that.immortal,_that.content);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsCache implements DnsCache {
  const _DnsCache({required this.size, required this.inserted, required this.evicted, required this.expired, required this.immortal, required final  List<DnsCacheEntry> content}): _content = content;
  factory _DnsCache.fromJson(Map<String, dynamic> json) => _$DnsCacheFromJson(json);

@override final  int size;
@override final  int inserted;
@override final  int evicted;
@override final  int expired;
@override final  int immortal;
 final  List<DnsCacheEntry> _content;
@override List<DnsCacheEntry> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}


/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsCacheCopyWith<_DnsCache> get copyWith => __$DnsCacheCopyWithImpl<_DnsCache>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsCacheToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsCache&&(identical(other.size, size) || other.size == size)&&(identical(other.inserted, inserted) || other.inserted == inserted)&&(identical(other.evicted, evicted) || other.evicted == evicted)&&(identical(other.expired, expired) || other.expired == expired)&&(identical(other.immortal, immortal) || other.immortal == immortal)&&const DeepCollectionEquality().equals(other._content, _content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,size,inserted,evicted,expired,immortal,const DeepCollectionEquality().hash(_content));

@override
String toString() {
  return 'DnsCache(size: $size, inserted: $inserted, evicted: $evicted, expired: $expired, immortal: $immortal, content: $content)';
}


}

/// @nodoc
abstract mixin class _$DnsCacheCopyWith<$Res> implements $DnsCacheCopyWith<$Res> {
  factory _$DnsCacheCopyWith(_DnsCache value, $Res Function(_DnsCache) _then) = __$DnsCacheCopyWithImpl;
@override @useResult
$Res call({
 int size, int inserted, int evicted, int expired, int immortal, List<DnsCacheEntry> content
});




}
/// @nodoc
class __$DnsCacheCopyWithImpl<$Res>
    implements _$DnsCacheCopyWith<$Res> {
  __$DnsCacheCopyWithImpl(this._self, this._then);

  final _DnsCache _self;
  final $Res Function(_DnsCache) _then;

/// Create a copy of DnsCache
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? inserted = null,Object? evicted = null,Object? expired = null,Object? immortal = null,Object? content = null,}) {
  return _then(_DnsCache(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,inserted: null == inserted ? _self.inserted : inserted // ignore: cast_nullable_to_non_nullable
as int,evicted: null == evicted ? _self.evicted : evicted // ignore: cast_nullable_to_non_nullable
as int,expired: null == expired ? _self.expired : expired // ignore: cast_nullable_to_non_nullable
as int,immortal: null == immortal ? _self.immortal : immortal // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<DnsCacheEntry>,
  ));
}


}


/// @nodoc
mixin _$DnsCacheEntry {

 int get type; String get name; DnsCacheCount get count;
/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCacheEntryCopyWith<DnsCacheEntry> get copyWith => _$DnsCacheEntryCopyWithImpl<DnsCacheEntry>(this as DnsCacheEntry, _$identity);

  /// Serializes this DnsCacheEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsCacheEntry&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,count);

@override
String toString() {
  return 'DnsCacheEntry(type: $type, name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class $DnsCacheEntryCopyWith<$Res>  {
  factory $DnsCacheEntryCopyWith(DnsCacheEntry value, $Res Function(DnsCacheEntry) _then) = _$DnsCacheEntryCopyWithImpl;
@useResult
$Res call({
 int type, String name, DnsCacheCount count
});


$DnsCacheCountCopyWith<$Res> get count;

}
/// @nodoc
class _$DnsCacheEntryCopyWithImpl<$Res>
    implements $DnsCacheEntryCopyWith<$Res> {
  _$DnsCacheEntryCopyWithImpl(this._self, this._then);

  final DnsCacheEntry _self;
  final $Res Function(DnsCacheEntry) _then;

/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? name = null,Object? count = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as DnsCacheCount,
  ));
}
/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCountCopyWith<$Res> get count {
  
  return $DnsCacheCountCopyWith<$Res>(_self.count, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}


/// Adds pattern-matching-related methods to [DnsCacheEntry].
extension DnsCacheEntryPatterns on DnsCacheEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsCacheEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsCacheEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsCacheEntry value)  $default,){
final _that = this;
switch (_that) {
case _DnsCacheEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsCacheEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DnsCacheEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int type,  String name,  DnsCacheCount count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsCacheEntry() when $default != null:
return $default(_that.type,_that.name,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int type,  String name,  DnsCacheCount count)  $default,) {final _that = this;
switch (_that) {
case _DnsCacheEntry():
return $default(_that.type,_that.name,_that.count);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int type,  String name,  DnsCacheCount count)?  $default,) {final _that = this;
switch (_that) {
case _DnsCacheEntry() when $default != null:
return $default(_that.type,_that.name,_that.count);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DnsCacheEntry implements DnsCacheEntry {
  const _DnsCacheEntry({required this.type, required this.name, required this.count});
  factory _DnsCacheEntry.fromJson(Map<String, dynamic> json) => _$DnsCacheEntryFromJson(json);

@override final  int type;
@override final  String name;
@override final  DnsCacheCount count;

/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsCacheEntryCopyWith<_DnsCacheEntry> get copyWith => __$DnsCacheEntryCopyWithImpl<_DnsCacheEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsCacheEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsCacheEntry&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,name,count);

@override
String toString() {
  return 'DnsCacheEntry(type: $type, name: $name, count: $count)';
}


}

/// @nodoc
abstract mixin class _$DnsCacheEntryCopyWith<$Res> implements $DnsCacheEntryCopyWith<$Res> {
  factory _$DnsCacheEntryCopyWith(_DnsCacheEntry value, $Res Function(_DnsCacheEntry) _then) = __$DnsCacheEntryCopyWithImpl;
@override @useResult
$Res call({
 int type, String name, DnsCacheCount count
});


@override $DnsCacheCountCopyWith<$Res> get count;

}
/// @nodoc
class __$DnsCacheEntryCopyWithImpl<$Res>
    implements _$DnsCacheEntryCopyWith<$Res> {
  __$DnsCacheEntryCopyWithImpl(this._self, this._then);

  final _DnsCacheEntry _self;
  final $Res Function(_DnsCacheEntry) _then;

/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? name = null,Object? count = null,}) {
  return _then(_DnsCacheEntry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as DnsCacheCount,
  ));
}

/// Create a copy of DnsCacheEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DnsCacheCountCopyWith<$Res> get count {
  
  return $DnsCacheCountCopyWith<$Res>(_self.count, (value) {
    return _then(_self.copyWith(count: value));
  });
}
}


/// @nodoc
mixin _$DnsCacheCount {

 int get valid; int get stale;
/// Create a copy of DnsCacheCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsCacheCountCopyWith<DnsCacheCount> get copyWith => _$DnsCacheCountCopyWithImpl<DnsCacheCount>(this as DnsCacheCount, _$identity);

  /// Serializes this DnsCacheCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsCacheCount&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.stale, stale) || other.stale == stale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,stale);

@override
String toString() {
  return 'DnsCacheCount(valid: $valid, stale: $stale)';
}


}

/// @nodoc
abstract mixin class $DnsCacheCountCopyWith<$Res>  {
  factory $DnsCacheCountCopyWith(DnsCacheCount value, $Res Function(DnsCacheCount) _then) = _$DnsCacheCountCopyWithImpl;
@useResult
$Res call({
 int valid, int stale
});




}
/// @nodoc
class _$DnsCacheCountCopyWithImpl<$Res>
    implements $DnsCacheCountCopyWith<$Res> {
  _$DnsCacheCountCopyWithImpl(this._self, this._then);

  final DnsCacheCount _self;
  final $Res Function(DnsCacheCount) _then;

/// Create a copy of DnsCacheCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? valid = null,Object? stale = null,}) {
  return _then(_self.copyWith(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as int,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsCacheCount].
extension DnsCacheCountPatterns on DnsCacheCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsCacheCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsCacheCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsCacheCount value)  $default,){
final _that = this;
switch (_that) {
case _DnsCacheCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsCacheCount value)?  $default,){
final _that = this;
switch (_that) {
case _DnsCacheCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int valid,  int stale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsCacheCount() when $default != null:
return $default(_that.valid,_that.stale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int valid,  int stale)  $default,) {final _that = this;
switch (_that) {
case _DnsCacheCount():
return $default(_that.valid,_that.stale);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int valid,  int stale)?  $default,) {final _that = this;
switch (_that) {
case _DnsCacheCount() when $default != null:
return $default(_that.valid,_that.stale);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsCacheCount implements DnsCacheCount {
  const _DnsCacheCount({required this.valid, required this.stale});
  factory _DnsCacheCount.fromJson(Map<String, dynamic> json) => _$DnsCacheCountFromJson(json);

@override final  int valid;
@override final  int stale;

/// Create a copy of DnsCacheCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsCacheCountCopyWith<_DnsCacheCount> get copyWith => __$DnsCacheCountCopyWithImpl<_DnsCacheCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsCacheCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsCacheCount&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.stale, stale) || other.stale == stale));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,valid,stale);

@override
String toString() {
  return 'DnsCacheCount(valid: $valid, stale: $stale)';
}


}

/// @nodoc
abstract mixin class _$DnsCacheCountCopyWith<$Res> implements $DnsCacheCountCopyWith<$Res> {
  factory _$DnsCacheCountCopyWith(_DnsCacheCount value, $Res Function(_DnsCacheCount) _then) = __$DnsCacheCountCopyWithImpl;
@override @useResult
$Res call({
 int valid, int stale
});




}
/// @nodoc
class __$DnsCacheCountCopyWithImpl<$Res>
    implements _$DnsCacheCountCopyWith<$Res> {
  __$DnsCacheCountCopyWithImpl(this._self, this._then);

  final _DnsCacheCount _self;
  final $Res Function(_DnsCacheCount) _then;

/// Create a copy of DnsCacheCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? valid = null,Object? stale = null,}) {
  return _then(_DnsCacheCount(
valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as int,stale: null == stale ? _self.stale : stale // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DnsReplies {

 int get forwarded; int get unanswered; int get local; int get optimized; int get auth; int get sum;
/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DnsRepliesCopyWith<DnsReplies> get copyWith => _$DnsRepliesCopyWithImpl<DnsReplies>(this as DnsReplies, _$identity);

  /// Serializes this DnsReplies to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DnsReplies&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded)&&(identical(other.unanswered, unanswered) || other.unanswered == unanswered)&&(identical(other.local, local) || other.local == local)&&(identical(other.optimized, optimized) || other.optimized == optimized)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forwarded,unanswered,local,optimized,auth,sum);

@override
String toString() {
  return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $DnsRepliesCopyWith<$Res>  {
  factory $DnsRepliesCopyWith(DnsReplies value, $Res Function(DnsReplies) _then) = _$DnsRepliesCopyWithImpl;
@useResult
$Res call({
 int forwarded, int unanswered, int local, int optimized, int auth, int sum
});




}
/// @nodoc
class _$DnsRepliesCopyWithImpl<$Res>
    implements $DnsRepliesCopyWith<$Res> {
  _$DnsRepliesCopyWithImpl(this._self, this._then);

  final DnsReplies _self;
  final $Res Function(DnsReplies) _then;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forwarded = null,Object? unanswered = null,Object? local = null,Object? optimized = null,Object? auth = null,Object? sum = null,}) {
  return _then(_self.copyWith(
forwarded: null == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int,unanswered: null == unanswered ? _self.unanswered : unanswered // ignore: cast_nullable_to_non_nullable
as int,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as int,optimized: null == optimized ? _self.optimized : optimized // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DnsReplies].
extension DnsRepliesPatterns on DnsReplies {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DnsReplies value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DnsReplies value)  $default,){
final _that = this;
switch (_that) {
case _DnsReplies():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DnsReplies value)?  $default,){
final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum)  $default,) {final _that = this;
switch (_that) {
case _DnsReplies():
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int forwarded,  int unanswered,  int local,  int optimized,  int auth,  int sum)?  $default,) {final _that = this;
switch (_that) {
case _DnsReplies() when $default != null:
return $default(_that.forwarded,_that.unanswered,_that.local,_that.optimized,_that.auth,_that.sum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DnsReplies implements DnsReplies {
  const _DnsReplies({required this.forwarded, required this.unanswered, required this.local, required this.optimized, required this.auth, required this.sum});
  factory _DnsReplies.fromJson(Map<String, dynamic> json) => _$DnsRepliesFromJson(json);

@override final  int forwarded;
@override final  int unanswered;
@override final  int local;
@override final  int optimized;
@override final  int auth;
@override final  int sum;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DnsRepliesCopyWith<_DnsReplies> get copyWith => __$DnsRepliesCopyWithImpl<_DnsReplies>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DnsRepliesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DnsReplies&&(identical(other.forwarded, forwarded) || other.forwarded == forwarded)&&(identical(other.unanswered, unanswered) || other.unanswered == unanswered)&&(identical(other.local, local) || other.local == local)&&(identical(other.optimized, optimized) || other.optimized == optimized)&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forwarded,unanswered,local,optimized,auth,sum);

@override
String toString() {
  return 'DnsReplies(forwarded: $forwarded, unanswered: $unanswered, local: $local, optimized: $optimized, auth: $auth, sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$DnsRepliesCopyWith<$Res> implements $DnsRepliesCopyWith<$Res> {
  factory _$DnsRepliesCopyWith(_DnsReplies value, $Res Function(_DnsReplies) _then) = __$DnsRepliesCopyWithImpl;
@override @useResult
$Res call({
 int forwarded, int unanswered, int local, int optimized, int auth, int sum
});




}
/// @nodoc
class __$DnsRepliesCopyWithImpl<$Res>
    implements _$DnsRepliesCopyWith<$Res> {
  __$DnsRepliesCopyWithImpl(this._self, this._then);

  final _DnsReplies _self;
  final $Res Function(_DnsReplies) _then;

/// Create a copy of DnsReplies
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forwarded = null,Object? unanswered = null,Object? local = null,Object? optimized = null,Object? auth = null,Object? sum = null,}) {
  return _then(_DnsReplies(
forwarded: null == forwarded ? _self.forwarded : forwarded // ignore: cast_nullable_to_non_nullable
as int,unanswered: null == unanswered ? _self.unanswered : unanswered // ignore: cast_nullable_to_non_nullable
as int,local: null == local ? _self.local : local // ignore: cast_nullable_to_non_nullable
as int,optimized: null == optimized ? _self.optimized : optimized // ignore: cast_nullable_to_non_nullable
as int,auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$DhcpMetrics {

 int get ack; int get nak; int get decline; int get offer; int get discover; int get inform; int get request; int get release; int get noanswer; int get bootp; int get pxe; DhcpLeases get leases;
/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpMetricsCopyWith<DhcpMetrics> get copyWith => _$DhcpMetricsCopyWithImpl<DhcpMetrics>(this as DhcpMetrics, _$identity);

  /// Serializes this DhcpMetrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DhcpMetrics&&(identical(other.ack, ack) || other.ack == ack)&&(identical(other.nak, nak) || other.nak == nak)&&(identical(other.decline, decline) || other.decline == decline)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.discover, discover) || other.discover == discover)&&(identical(other.inform, inform) || other.inform == inform)&&(identical(other.request, request) || other.request == request)&&(identical(other.release, release) || other.release == release)&&(identical(other.noanswer, noanswer) || other.noanswer == noanswer)&&(identical(other.bootp, bootp) || other.bootp == bootp)&&(identical(other.pxe, pxe) || other.pxe == pxe)&&(identical(other.leases, leases) || other.leases == leases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ack,nak,decline,offer,discover,inform,request,release,noanswer,bootp,pxe,leases);

@override
String toString() {
  return 'DhcpMetrics(ack: $ack, nak: $nak, decline: $decline, offer: $offer, discover: $discover, inform: $inform, request: $request, release: $release, noanswer: $noanswer, bootp: $bootp, pxe: $pxe, leases: $leases)';
}


}

/// @nodoc
abstract mixin class $DhcpMetricsCopyWith<$Res>  {
  factory $DhcpMetricsCopyWith(DhcpMetrics value, $Res Function(DhcpMetrics) _then) = _$DhcpMetricsCopyWithImpl;
@useResult
$Res call({
 int ack, int nak, int decline, int offer, int discover, int inform, int request, int release, int noanswer, int bootp, int pxe, DhcpLeases leases
});


$DhcpLeasesCopyWith<$Res> get leases;

}
/// @nodoc
class _$DhcpMetricsCopyWithImpl<$Res>
    implements $DhcpMetricsCopyWith<$Res> {
  _$DhcpMetricsCopyWithImpl(this._self, this._then);

  final DhcpMetrics _self;
  final $Res Function(DhcpMetrics) _then;

/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ack = null,Object? nak = null,Object? decline = null,Object? offer = null,Object? discover = null,Object? inform = null,Object? request = null,Object? release = null,Object? noanswer = null,Object? bootp = null,Object? pxe = null,Object? leases = null,}) {
  return _then(_self.copyWith(
ack: null == ack ? _self.ack : ack // ignore: cast_nullable_to_non_nullable
as int,nak: null == nak ? _self.nak : nak // ignore: cast_nullable_to_non_nullable
as int,decline: null == decline ? _self.decline : decline // ignore: cast_nullable_to_non_nullable
as int,offer: null == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as int,discover: null == discover ? _self.discover : discover // ignore: cast_nullable_to_non_nullable
as int,inform: null == inform ? _self.inform : inform // ignore: cast_nullable_to_non_nullable
as int,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as int,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as int,noanswer: null == noanswer ? _self.noanswer : noanswer // ignore: cast_nullable_to_non_nullable
as int,bootp: null == bootp ? _self.bootp : bootp // ignore: cast_nullable_to_non_nullable
as int,pxe: null == pxe ? _self.pxe : pxe // ignore: cast_nullable_to_non_nullable
as int,leases: null == leases ? _self.leases : leases // ignore: cast_nullable_to_non_nullable
as DhcpLeases,
  ));
}
/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpLeasesCopyWith<$Res> get leases {
  
  return $DhcpLeasesCopyWith<$Res>(_self.leases, (value) {
    return _then(_self.copyWith(leases: value));
  });
}
}


/// Adds pattern-matching-related methods to [DhcpMetrics].
extension DhcpMetricsPatterns on DhcpMetrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DhcpMetrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DhcpMetrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DhcpMetrics value)  $default,){
final _that = this;
switch (_that) {
case _DhcpMetrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DhcpMetrics value)?  $default,){
final _that = this;
switch (_that) {
case _DhcpMetrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int ack,  int nak,  int decline,  int offer,  int discover,  int inform,  int request,  int release,  int noanswer,  int bootp,  int pxe,  DhcpLeases leases)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DhcpMetrics() when $default != null:
return $default(_that.ack,_that.nak,_that.decline,_that.offer,_that.discover,_that.inform,_that.request,_that.release,_that.noanswer,_that.bootp,_that.pxe,_that.leases);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int ack,  int nak,  int decline,  int offer,  int discover,  int inform,  int request,  int release,  int noanswer,  int bootp,  int pxe,  DhcpLeases leases)  $default,) {final _that = this;
switch (_that) {
case _DhcpMetrics():
return $default(_that.ack,_that.nak,_that.decline,_that.offer,_that.discover,_that.inform,_that.request,_that.release,_that.noanswer,_that.bootp,_that.pxe,_that.leases);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int ack,  int nak,  int decline,  int offer,  int discover,  int inform,  int request,  int release,  int noanswer,  int bootp,  int pxe,  DhcpLeases leases)?  $default,) {final _that = this;
switch (_that) {
case _DhcpMetrics() when $default != null:
return $default(_that.ack,_that.nak,_that.decline,_that.offer,_that.discover,_that.inform,_that.request,_that.release,_that.noanswer,_that.bootp,_that.pxe,_that.leases);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DhcpMetrics implements DhcpMetrics {
  const _DhcpMetrics({required this.ack, required this.nak, required this.decline, required this.offer, required this.discover, required this.inform, required this.request, required this.release, required this.noanswer, required this.bootp, required this.pxe, required this.leases});
  factory _DhcpMetrics.fromJson(Map<String, dynamic> json) => _$DhcpMetricsFromJson(json);

@override final  int ack;
@override final  int nak;
@override final  int decline;
@override final  int offer;
@override final  int discover;
@override final  int inform;
@override final  int request;
@override final  int release;
@override final  int noanswer;
@override final  int bootp;
@override final  int pxe;
@override final  DhcpLeases leases;

/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpMetricsCopyWith<_DhcpMetrics> get copyWith => __$DhcpMetricsCopyWithImpl<_DhcpMetrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpMetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DhcpMetrics&&(identical(other.ack, ack) || other.ack == ack)&&(identical(other.nak, nak) || other.nak == nak)&&(identical(other.decline, decline) || other.decline == decline)&&(identical(other.offer, offer) || other.offer == offer)&&(identical(other.discover, discover) || other.discover == discover)&&(identical(other.inform, inform) || other.inform == inform)&&(identical(other.request, request) || other.request == request)&&(identical(other.release, release) || other.release == release)&&(identical(other.noanswer, noanswer) || other.noanswer == noanswer)&&(identical(other.bootp, bootp) || other.bootp == bootp)&&(identical(other.pxe, pxe) || other.pxe == pxe)&&(identical(other.leases, leases) || other.leases == leases));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ack,nak,decline,offer,discover,inform,request,release,noanswer,bootp,pxe,leases);

@override
String toString() {
  return 'DhcpMetrics(ack: $ack, nak: $nak, decline: $decline, offer: $offer, discover: $discover, inform: $inform, request: $request, release: $release, noanswer: $noanswer, bootp: $bootp, pxe: $pxe, leases: $leases)';
}


}

/// @nodoc
abstract mixin class _$DhcpMetricsCopyWith<$Res> implements $DhcpMetricsCopyWith<$Res> {
  factory _$DhcpMetricsCopyWith(_DhcpMetrics value, $Res Function(_DhcpMetrics) _then) = __$DhcpMetricsCopyWithImpl;
@override @useResult
$Res call({
 int ack, int nak, int decline, int offer, int discover, int inform, int request, int release, int noanswer, int bootp, int pxe, DhcpLeases leases
});


@override $DhcpLeasesCopyWith<$Res> get leases;

}
/// @nodoc
class __$DhcpMetricsCopyWithImpl<$Res>
    implements _$DhcpMetricsCopyWith<$Res> {
  __$DhcpMetricsCopyWithImpl(this._self, this._then);

  final _DhcpMetrics _self;
  final $Res Function(_DhcpMetrics) _then;

/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ack = null,Object? nak = null,Object? decline = null,Object? offer = null,Object? discover = null,Object? inform = null,Object? request = null,Object? release = null,Object? noanswer = null,Object? bootp = null,Object? pxe = null,Object? leases = null,}) {
  return _then(_DhcpMetrics(
ack: null == ack ? _self.ack : ack // ignore: cast_nullable_to_non_nullable
as int,nak: null == nak ? _self.nak : nak // ignore: cast_nullable_to_non_nullable
as int,decline: null == decline ? _self.decline : decline // ignore: cast_nullable_to_non_nullable
as int,offer: null == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as int,discover: null == discover ? _self.discover : discover // ignore: cast_nullable_to_non_nullable
as int,inform: null == inform ? _self.inform : inform // ignore: cast_nullable_to_non_nullable
as int,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as int,release: null == release ? _self.release : release // ignore: cast_nullable_to_non_nullable
as int,noanswer: null == noanswer ? _self.noanswer : noanswer // ignore: cast_nullable_to_non_nullable
as int,bootp: null == bootp ? _self.bootp : bootp // ignore: cast_nullable_to_non_nullable
as int,pxe: null == pxe ? _self.pxe : pxe // ignore: cast_nullable_to_non_nullable
as int,leases: null == leases ? _self.leases : leases // ignore: cast_nullable_to_non_nullable
as DhcpLeases,
  ));
}

/// Create a copy of DhcpMetrics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DhcpLeasesCopyWith<$Res> get leases {
  
  return $DhcpLeasesCopyWith<$Res>(_self.leases, (value) {
    return _then(_self.copyWith(leases: value));
  });
}
}


/// @nodoc
mixin _$DhcpLeases {

@JsonKey(name: 'allocated_4') int get allocated4;@JsonKey(name: 'pruned_4') int get pruned4;@JsonKey(name: 'allocated_6') int get allocated6;@JsonKey(name: 'pruned_6') int get pruned6;
/// Create a copy of DhcpLeases
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DhcpLeasesCopyWith<DhcpLeases> get copyWith => _$DhcpLeasesCopyWithImpl<DhcpLeases>(this as DhcpLeases, _$identity);

  /// Serializes this DhcpLeases to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DhcpLeases&&(identical(other.allocated4, allocated4) || other.allocated4 == allocated4)&&(identical(other.pruned4, pruned4) || other.pruned4 == pruned4)&&(identical(other.allocated6, allocated6) || other.allocated6 == allocated6)&&(identical(other.pruned6, pruned6) || other.pruned6 == pruned6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allocated4,pruned4,allocated6,pruned6);

@override
String toString() {
  return 'DhcpLeases(allocated4: $allocated4, pruned4: $pruned4, allocated6: $allocated6, pruned6: $pruned6)';
}


}

/// @nodoc
abstract mixin class $DhcpLeasesCopyWith<$Res>  {
  factory $DhcpLeasesCopyWith(DhcpLeases value, $Res Function(DhcpLeases) _then) = _$DhcpLeasesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'allocated_4') int allocated4,@JsonKey(name: 'pruned_4') int pruned4,@JsonKey(name: 'allocated_6') int allocated6,@JsonKey(name: 'pruned_6') int pruned6
});




}
/// @nodoc
class _$DhcpLeasesCopyWithImpl<$Res>
    implements $DhcpLeasesCopyWith<$Res> {
  _$DhcpLeasesCopyWithImpl(this._self, this._then);

  final DhcpLeases _self;
  final $Res Function(DhcpLeases) _then;

/// Create a copy of DhcpLeases
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allocated4 = null,Object? pruned4 = null,Object? allocated6 = null,Object? pruned6 = null,}) {
  return _then(_self.copyWith(
allocated4: null == allocated4 ? _self.allocated4 : allocated4 // ignore: cast_nullable_to_non_nullable
as int,pruned4: null == pruned4 ? _self.pruned4 : pruned4 // ignore: cast_nullable_to_non_nullable
as int,allocated6: null == allocated6 ? _self.allocated6 : allocated6 // ignore: cast_nullable_to_non_nullable
as int,pruned6: null == pruned6 ? _self.pruned6 : pruned6 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DhcpLeases].
extension DhcpLeasesPatterns on DhcpLeases {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DhcpLeases value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DhcpLeases() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DhcpLeases value)  $default,){
final _that = this;
switch (_that) {
case _DhcpLeases():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DhcpLeases value)?  $default,){
final _that = this;
switch (_that) {
case _DhcpLeases() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'allocated_4')  int allocated4, @JsonKey(name: 'pruned_4')  int pruned4, @JsonKey(name: 'allocated_6')  int allocated6, @JsonKey(name: 'pruned_6')  int pruned6)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DhcpLeases() when $default != null:
return $default(_that.allocated4,_that.pruned4,_that.allocated6,_that.pruned6);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'allocated_4')  int allocated4, @JsonKey(name: 'pruned_4')  int pruned4, @JsonKey(name: 'allocated_6')  int allocated6, @JsonKey(name: 'pruned_6')  int pruned6)  $default,) {final _that = this;
switch (_that) {
case _DhcpLeases():
return $default(_that.allocated4,_that.pruned4,_that.allocated6,_that.pruned6);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'allocated_4')  int allocated4, @JsonKey(name: 'pruned_4')  int pruned4, @JsonKey(name: 'allocated_6')  int allocated6, @JsonKey(name: 'pruned_6')  int pruned6)?  $default,) {final _that = this;
switch (_that) {
case _DhcpLeases() when $default != null:
return $default(_that.allocated4,_that.pruned4,_that.allocated6,_that.pruned6);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DhcpLeases implements DhcpLeases {
  const _DhcpLeases({@JsonKey(name: 'allocated_4') required this.allocated4, @JsonKey(name: 'pruned_4') required this.pruned4, @JsonKey(name: 'allocated_6') required this.allocated6, @JsonKey(name: 'pruned_6') required this.pruned6});
  factory _DhcpLeases.fromJson(Map<String, dynamic> json) => _$DhcpLeasesFromJson(json);

@override@JsonKey(name: 'allocated_4') final  int allocated4;
@override@JsonKey(name: 'pruned_4') final  int pruned4;
@override@JsonKey(name: 'allocated_6') final  int allocated6;
@override@JsonKey(name: 'pruned_6') final  int pruned6;

/// Create a copy of DhcpLeases
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DhcpLeasesCopyWith<_DhcpLeases> get copyWith => __$DhcpLeasesCopyWithImpl<_DhcpLeases>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DhcpLeasesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DhcpLeases&&(identical(other.allocated4, allocated4) || other.allocated4 == allocated4)&&(identical(other.pruned4, pruned4) || other.pruned4 == pruned4)&&(identical(other.allocated6, allocated6) || other.allocated6 == allocated6)&&(identical(other.pruned6, pruned6) || other.pruned6 == pruned6));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allocated4,pruned4,allocated6,pruned6);

@override
String toString() {
  return 'DhcpLeases(allocated4: $allocated4, pruned4: $pruned4, allocated6: $allocated6, pruned6: $pruned6)';
}


}

/// @nodoc
abstract mixin class _$DhcpLeasesCopyWith<$Res> implements $DhcpLeasesCopyWith<$Res> {
  factory _$DhcpLeasesCopyWith(_DhcpLeases value, $Res Function(_DhcpLeases) _then) = __$DhcpLeasesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'allocated_4') int allocated4,@JsonKey(name: 'pruned_4') int pruned4,@JsonKey(name: 'allocated_6') int allocated6,@JsonKey(name: 'pruned_6') int pruned6
});




}
/// @nodoc
class __$DhcpLeasesCopyWithImpl<$Res>
    implements _$DhcpLeasesCopyWith<$Res> {
  __$DhcpLeasesCopyWithImpl(this._self, this._then);

  final _DhcpLeases _self;
  final $Res Function(_DhcpLeases) _then;

/// Create a copy of DhcpLeases
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allocated4 = null,Object? pruned4 = null,Object? allocated6 = null,Object? pruned6 = null,}) {
  return _then(_DhcpLeases(
allocated4: null == allocated4 ? _self.allocated4 : allocated4 // ignore: cast_nullable_to_non_nullable
as int,pruned4: null == pruned4 ? _self.pruned4 : pruned4 // ignore: cast_nullable_to_non_nullable
as int,allocated6: null == allocated6 ? _self.allocated6 : allocated6 // ignore: cast_nullable_to_non_nullable
as int,pruned6: null == pruned6 ? _self.pruned6 : pruned6 // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
