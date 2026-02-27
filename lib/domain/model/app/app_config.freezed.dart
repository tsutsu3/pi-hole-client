// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppConfig {

 int get autoRefreshTime; AppThemeMode get theme; String get language; bool get reducedDataCharts; double get logsPerQuery; int get logAutoRefreshTime; bool get liveLog; bool get isLivelogPaused; bool get useBiometricAuth; bool get importantInfoReaden; bool get hideZeroValues; bool get loadingAnimation; StatisticsVisualizationMode get statisticsVisualizationMode; HomeVisualizationMode get homeVisualizationMode; bool get sendCrashReports; String? get passCode;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.autoRefreshTime, autoRefreshTime) || other.autoRefreshTime == autoRefreshTime)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.language, language) || other.language == language)&&(identical(other.reducedDataCharts, reducedDataCharts) || other.reducedDataCharts == reducedDataCharts)&&(identical(other.logsPerQuery, logsPerQuery) || other.logsPerQuery == logsPerQuery)&&(identical(other.logAutoRefreshTime, logAutoRefreshTime) || other.logAutoRefreshTime == logAutoRefreshTime)&&(identical(other.liveLog, liveLog) || other.liveLog == liveLog)&&(identical(other.isLivelogPaused, isLivelogPaused) || other.isLivelogPaused == isLivelogPaused)&&(identical(other.useBiometricAuth, useBiometricAuth) || other.useBiometricAuth == useBiometricAuth)&&(identical(other.importantInfoReaden, importantInfoReaden) || other.importantInfoReaden == importantInfoReaden)&&(identical(other.hideZeroValues, hideZeroValues) || other.hideZeroValues == hideZeroValues)&&(identical(other.loadingAnimation, loadingAnimation) || other.loadingAnimation == loadingAnimation)&&(identical(other.statisticsVisualizationMode, statisticsVisualizationMode) || other.statisticsVisualizationMode == statisticsVisualizationMode)&&(identical(other.homeVisualizationMode, homeVisualizationMode) || other.homeVisualizationMode == homeVisualizationMode)&&(identical(other.sendCrashReports, sendCrashReports) || other.sendCrashReports == sendCrashReports)&&(identical(other.passCode, passCode) || other.passCode == passCode));
}


@override
int get hashCode => Object.hash(runtimeType,autoRefreshTime,theme,language,reducedDataCharts,logsPerQuery,logAutoRefreshTime,liveLog,isLivelogPaused,useBiometricAuth,importantInfoReaden,hideZeroValues,loadingAnimation,statisticsVisualizationMode,homeVisualizationMode,sendCrashReports,passCode);

@override
String toString() {
  return 'AppConfig(autoRefreshTime: $autoRefreshTime, theme: $theme, language: $language, reducedDataCharts: $reducedDataCharts, logsPerQuery: $logsPerQuery, logAutoRefreshTime: $logAutoRefreshTime, liveLog: $liveLog, isLivelogPaused: $isLivelogPaused, useBiometricAuth: $useBiometricAuth, importantInfoReaden: $importantInfoReaden, hideZeroValues: $hideZeroValues, loadingAnimation: $loadingAnimation, statisticsVisualizationMode: $statisticsVisualizationMode, homeVisualizationMode: $homeVisualizationMode, sendCrashReports: $sendCrashReports, passCode: $passCode)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 int autoRefreshTime, AppThemeMode theme, String language, bool reducedDataCharts, double logsPerQuery, int logAutoRefreshTime, bool liveLog, bool isLivelogPaused, bool useBiometricAuth, bool importantInfoReaden, bool hideZeroValues, bool loadingAnimation, StatisticsVisualizationMode statisticsVisualizationMode, HomeVisualizationMode homeVisualizationMode, bool sendCrashReports, String? passCode
});




}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? autoRefreshTime = null,Object? theme = null,Object? language = null,Object? reducedDataCharts = null,Object? logsPerQuery = null,Object? logAutoRefreshTime = null,Object? liveLog = null,Object? isLivelogPaused = null,Object? useBiometricAuth = null,Object? importantInfoReaden = null,Object? hideZeroValues = null,Object? loadingAnimation = null,Object? statisticsVisualizationMode = null,Object? homeVisualizationMode = null,Object? sendCrashReports = null,Object? passCode = freezed,}) {
  return _then(_self.copyWith(
autoRefreshTime: null == autoRefreshTime ? _self.autoRefreshTime : autoRefreshTime // ignore: cast_nullable_to_non_nullable
as int,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,reducedDataCharts: null == reducedDataCharts ? _self.reducedDataCharts : reducedDataCharts // ignore: cast_nullable_to_non_nullable
as bool,logsPerQuery: null == logsPerQuery ? _self.logsPerQuery : logsPerQuery // ignore: cast_nullable_to_non_nullable
as double,logAutoRefreshTime: null == logAutoRefreshTime ? _self.logAutoRefreshTime : logAutoRefreshTime // ignore: cast_nullable_to_non_nullable
as int,liveLog: null == liveLog ? _self.liveLog : liveLog // ignore: cast_nullable_to_non_nullable
as bool,isLivelogPaused: null == isLivelogPaused ? _self.isLivelogPaused : isLivelogPaused // ignore: cast_nullable_to_non_nullable
as bool,useBiometricAuth: null == useBiometricAuth ? _self.useBiometricAuth : useBiometricAuth // ignore: cast_nullable_to_non_nullable
as bool,importantInfoReaden: null == importantInfoReaden ? _self.importantInfoReaden : importantInfoReaden // ignore: cast_nullable_to_non_nullable
as bool,hideZeroValues: null == hideZeroValues ? _self.hideZeroValues : hideZeroValues // ignore: cast_nullable_to_non_nullable
as bool,loadingAnimation: null == loadingAnimation ? _self.loadingAnimation : loadingAnimation // ignore: cast_nullable_to_non_nullable
as bool,statisticsVisualizationMode: null == statisticsVisualizationMode ? _self.statisticsVisualizationMode : statisticsVisualizationMode // ignore: cast_nullable_to_non_nullable
as StatisticsVisualizationMode,homeVisualizationMode: null == homeVisualizationMode ? _self.homeVisualizationMode : homeVisualizationMode // ignore: cast_nullable_to_non_nullable
as HomeVisualizationMode,sendCrashReports: null == sendCrashReports ? _self.sendCrashReports : sendCrashReports // ignore: cast_nullable_to_non_nullable
as bool,passCode: freezed == passCode ? _self.passCode : passCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int autoRefreshTime,  AppThemeMode theme,  String language,  bool reducedDataCharts,  double logsPerQuery,  int logAutoRefreshTime,  bool liveLog,  bool isLivelogPaused,  bool useBiometricAuth,  bool importantInfoReaden,  bool hideZeroValues,  bool loadingAnimation,  StatisticsVisualizationMode statisticsVisualizationMode,  HomeVisualizationMode homeVisualizationMode,  bool sendCrashReports,  String? passCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.autoRefreshTime,_that.theme,_that.language,_that.reducedDataCharts,_that.logsPerQuery,_that.logAutoRefreshTime,_that.liveLog,_that.isLivelogPaused,_that.useBiometricAuth,_that.importantInfoReaden,_that.hideZeroValues,_that.loadingAnimation,_that.statisticsVisualizationMode,_that.homeVisualizationMode,_that.sendCrashReports,_that.passCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int autoRefreshTime,  AppThemeMode theme,  String language,  bool reducedDataCharts,  double logsPerQuery,  int logAutoRefreshTime,  bool liveLog,  bool isLivelogPaused,  bool useBiometricAuth,  bool importantInfoReaden,  bool hideZeroValues,  bool loadingAnimation,  StatisticsVisualizationMode statisticsVisualizationMode,  HomeVisualizationMode homeVisualizationMode,  bool sendCrashReports,  String? passCode)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.autoRefreshTime,_that.theme,_that.language,_that.reducedDataCharts,_that.logsPerQuery,_that.logAutoRefreshTime,_that.liveLog,_that.isLivelogPaused,_that.useBiometricAuth,_that.importantInfoReaden,_that.hideZeroValues,_that.loadingAnimation,_that.statisticsVisualizationMode,_that.homeVisualizationMode,_that.sendCrashReports,_that.passCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int autoRefreshTime,  AppThemeMode theme,  String language,  bool reducedDataCharts,  double logsPerQuery,  int logAutoRefreshTime,  bool liveLog,  bool isLivelogPaused,  bool useBiometricAuth,  bool importantInfoReaden,  bool hideZeroValues,  bool loadingAnimation,  StatisticsVisualizationMode statisticsVisualizationMode,  HomeVisualizationMode homeVisualizationMode,  bool sendCrashReports,  String? passCode)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.autoRefreshTime,_that.theme,_that.language,_that.reducedDataCharts,_that.logsPerQuery,_that.logAutoRefreshTime,_that.liveLog,_that.isLivelogPaused,_that.useBiometricAuth,_that.importantInfoReaden,_that.hideZeroValues,_that.loadingAnimation,_that.statisticsVisualizationMode,_that.homeVisualizationMode,_that.sendCrashReports,_that.passCode);case _:
  return null;

}
}

}

/// @nodoc


class _AppConfig implements AppConfig {
  const _AppConfig({required this.autoRefreshTime, required this.theme, required this.language, required this.reducedDataCharts, required this.logsPerQuery, required this.logAutoRefreshTime, required this.liveLog, required this.isLivelogPaused, required this.useBiometricAuth, required this.importantInfoReaden, required this.hideZeroValues, required this.loadingAnimation, required this.statisticsVisualizationMode, required this.homeVisualizationMode, required this.sendCrashReports, this.passCode});
  

@override final  int autoRefreshTime;
@override final  AppThemeMode theme;
@override final  String language;
@override final  bool reducedDataCharts;
@override final  double logsPerQuery;
@override final  int logAutoRefreshTime;
@override final  bool liveLog;
@override final  bool isLivelogPaused;
@override final  bool useBiometricAuth;
@override final  bool importantInfoReaden;
@override final  bool hideZeroValues;
@override final  bool loadingAnimation;
@override final  StatisticsVisualizationMode statisticsVisualizationMode;
@override final  HomeVisualizationMode homeVisualizationMode;
@override final  bool sendCrashReports;
@override final  String? passCode;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.autoRefreshTime, autoRefreshTime) || other.autoRefreshTime == autoRefreshTime)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.language, language) || other.language == language)&&(identical(other.reducedDataCharts, reducedDataCharts) || other.reducedDataCharts == reducedDataCharts)&&(identical(other.logsPerQuery, logsPerQuery) || other.logsPerQuery == logsPerQuery)&&(identical(other.logAutoRefreshTime, logAutoRefreshTime) || other.logAutoRefreshTime == logAutoRefreshTime)&&(identical(other.liveLog, liveLog) || other.liveLog == liveLog)&&(identical(other.isLivelogPaused, isLivelogPaused) || other.isLivelogPaused == isLivelogPaused)&&(identical(other.useBiometricAuth, useBiometricAuth) || other.useBiometricAuth == useBiometricAuth)&&(identical(other.importantInfoReaden, importantInfoReaden) || other.importantInfoReaden == importantInfoReaden)&&(identical(other.hideZeroValues, hideZeroValues) || other.hideZeroValues == hideZeroValues)&&(identical(other.loadingAnimation, loadingAnimation) || other.loadingAnimation == loadingAnimation)&&(identical(other.statisticsVisualizationMode, statisticsVisualizationMode) || other.statisticsVisualizationMode == statisticsVisualizationMode)&&(identical(other.homeVisualizationMode, homeVisualizationMode) || other.homeVisualizationMode == homeVisualizationMode)&&(identical(other.sendCrashReports, sendCrashReports) || other.sendCrashReports == sendCrashReports)&&(identical(other.passCode, passCode) || other.passCode == passCode));
}


@override
int get hashCode => Object.hash(runtimeType,autoRefreshTime,theme,language,reducedDataCharts,logsPerQuery,logAutoRefreshTime,liveLog,isLivelogPaused,useBiometricAuth,importantInfoReaden,hideZeroValues,loadingAnimation,statisticsVisualizationMode,homeVisualizationMode,sendCrashReports,passCode);

@override
String toString() {
  return 'AppConfig(autoRefreshTime: $autoRefreshTime, theme: $theme, language: $language, reducedDataCharts: $reducedDataCharts, logsPerQuery: $logsPerQuery, logAutoRefreshTime: $logAutoRefreshTime, liveLog: $liveLog, isLivelogPaused: $isLivelogPaused, useBiometricAuth: $useBiometricAuth, importantInfoReaden: $importantInfoReaden, hideZeroValues: $hideZeroValues, loadingAnimation: $loadingAnimation, statisticsVisualizationMode: $statisticsVisualizationMode, homeVisualizationMode: $homeVisualizationMode, sendCrashReports: $sendCrashReports, passCode: $passCode)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 int autoRefreshTime, AppThemeMode theme, String language, bool reducedDataCharts, double logsPerQuery, int logAutoRefreshTime, bool liveLog, bool isLivelogPaused, bool useBiometricAuth, bool importantInfoReaden, bool hideZeroValues, bool loadingAnimation, StatisticsVisualizationMode statisticsVisualizationMode, HomeVisualizationMode homeVisualizationMode, bool sendCrashReports, String? passCode
});




}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? autoRefreshTime = null,Object? theme = null,Object? language = null,Object? reducedDataCharts = null,Object? logsPerQuery = null,Object? logAutoRefreshTime = null,Object? liveLog = null,Object? isLivelogPaused = null,Object? useBiometricAuth = null,Object? importantInfoReaden = null,Object? hideZeroValues = null,Object? loadingAnimation = null,Object? statisticsVisualizationMode = null,Object? homeVisualizationMode = null,Object? sendCrashReports = null,Object? passCode = freezed,}) {
  return _then(_AppConfig(
autoRefreshTime: null == autoRefreshTime ? _self.autoRefreshTime : autoRefreshTime // ignore: cast_nullable_to_non_nullable
as int,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,reducedDataCharts: null == reducedDataCharts ? _self.reducedDataCharts : reducedDataCharts // ignore: cast_nullable_to_non_nullable
as bool,logsPerQuery: null == logsPerQuery ? _self.logsPerQuery : logsPerQuery // ignore: cast_nullable_to_non_nullable
as double,logAutoRefreshTime: null == logAutoRefreshTime ? _self.logAutoRefreshTime : logAutoRefreshTime // ignore: cast_nullable_to_non_nullable
as int,liveLog: null == liveLog ? _self.liveLog : liveLog // ignore: cast_nullable_to_non_nullable
as bool,isLivelogPaused: null == isLivelogPaused ? _self.isLivelogPaused : isLivelogPaused // ignore: cast_nullable_to_non_nullable
as bool,useBiometricAuth: null == useBiometricAuth ? _self.useBiometricAuth : useBiometricAuth // ignore: cast_nullable_to_non_nullable
as bool,importantInfoReaden: null == importantInfoReaden ? _self.importantInfoReaden : importantInfoReaden // ignore: cast_nullable_to_non_nullable
as bool,hideZeroValues: null == hideZeroValues ? _self.hideZeroValues : hideZeroValues // ignore: cast_nullable_to_non_nullable
as bool,loadingAnimation: null == loadingAnimation ? _self.loadingAnimation : loadingAnimation // ignore: cast_nullable_to_non_nullable
as bool,statisticsVisualizationMode: null == statisticsVisualizationMode ? _self.statisticsVisualizationMode : statisticsVisualizationMode // ignore: cast_nullable_to_non_nullable
as StatisticsVisualizationMode,homeVisualizationMode: null == homeVisualizationMode ? _self.homeVisualizationMode : homeVisualizationMode // ignore: cast_nullable_to_non_nullable
as HomeVisualizationMode,sendCrashReports: null == sendCrashReports ? _self.sendCrashReports : sendCrashReports // ignore: cast_nullable_to_non_nullable
as bool,passCode: freezed == passCode ? _self.passCode : passCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
