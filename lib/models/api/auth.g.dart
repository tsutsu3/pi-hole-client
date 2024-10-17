// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStatusResponseImpl _$$AuthStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusResponseImpl(
      sessionstatus:
          SessionStatus.fromJson(json['sessionstatus'] as Map<String, dynamic>),
      took: (json['took'] as num).toInt(),
    );

Map<String, dynamic> _$$AuthStatusResponseImplToJson(
        _$AuthStatusResponseImpl instance) =>
    <String, dynamic>{
      'sessionstatus': instance.sessionstatus,
      'took': instance.took,
    };

_$SessionStatusImpl _$$SessionStatusImplFromJson(Map<String, dynamic> json) =>
    _$SessionStatusImpl(
      valid: json['valid'] as bool,
      totp: json['totp'] as bool,
      sid: json['sid'] as String?,
      csrf: json['csrf'] as String?,
      validity: (json['validity'] as num).toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SessionStatusImplToJson(_$SessionStatusImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'totp': instance.totp,
      'sid': instance.sid,
      'csrf': instance.csrf,
      'validity': instance.validity,
      'message': instance.message,
    };

_$PasswordImpl _$$PasswordImplFromJson(Map<String, dynamic> json) =>
    _$PasswordImpl(
      password: json['password'] as String,
    );

Map<String, dynamic> _$$PasswordImplToJson(_$PasswordImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

_$AppPasswordResponseImpl _$$AppPasswordResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AppPasswordResponseImpl(
      app: App.fromJson(json['app'] as Map<String, dynamic>),
      took: (json['took'] as num).toInt(),
    );

Map<String, dynamic> _$$AppPasswordResponseImplToJson(
        _$AppPasswordResponseImpl instance) =>
    <String, dynamic>{
      'app': instance.app,
      'took': instance.took,
    };

_$AppImpl _$$AppImplFromJson(Map<String, dynamic> json) => _$AppImpl(
      password: json['password'] as String,
      hash: json['hash'] as String,
    );

Map<String, dynamic> _$$AppImplToJson(_$AppImpl instance) => <String, dynamic>{
      'password': instance.password,
      'hash': instance.hash,
    };

_$SessionListResponseImpl _$$SessionListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionListResponseImpl(
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => Session.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toInt(),
    );

Map<String, dynamic> _$$SessionListResponseImplToJson(
        _$SessionListResponseImpl instance) =>
    <String, dynamic>{
      'sessions': instance.sessions,
      'took': instance.took,
    };

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: (json['id'] as num).toInt(),
      currentSession: json['currentSession'] as bool,
      valid: json['valid'] as bool,
      tls: Tls.fromJson(json['tls'] as Map<String, dynamic>),
      app: json['app'] as bool,
      cli: json['cli'] as bool,
      loginAt: (json['loginAt'] as num).toInt(),
      lastActive: (json['lastActive'] as num).toInt(),
      validUntil: (json['validUntil'] as num).toInt(),
      remoteAddr: json['remoteAddr'] as String,
      userAgent: json['userAgent'] as String?,
      xForwardedFor: json['xForwardedFor'] as String?,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currentSession': instance.currentSession,
      'valid': instance.valid,
      'tls': instance.tls,
      'app': instance.app,
      'cli': instance.cli,
      'loginAt': instance.loginAt,
      'lastActive': instance.lastActive,
      'validUntil': instance.validUntil,
      'remoteAddr': instance.remoteAddr,
      'userAgent': instance.userAgent,
      'xForwardedFor': instance.xForwardedFor,
    };

_$TlsImpl _$$TlsImplFromJson(Map<String, dynamic> json) => _$TlsImpl(
      login: json['login'] as bool,
      mixed: json['mixed'] as bool,
    );

Map<String, dynamic> _$$TlsImplToJson(_$TlsImpl instance) => <String, dynamic>{
      'login': instance.login,
      'mixed': instance.mixed,
    };
