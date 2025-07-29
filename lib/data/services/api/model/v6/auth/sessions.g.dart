// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSessions _$AuthSessionsFromJson(Map<String, dynamic> json) =>
    _AuthSessions(
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => SessionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$AuthSessionsToJson(_AuthSessions instance) =>
    <String, dynamic>{
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'took': instance.took,
    };

_SessionData _$SessionDataFromJson(Map<String, dynamic> json) => _SessionData(
      id: (json['id'] as num).toInt(),
      currentSession: json['current_session'] as bool,
      valid: json['valid'] as bool,
      tls: Tls.fromJson(json['tls'] as Map<String, dynamic>),
      app: json['app'] as bool,
      cli: json['cli'] as bool,
      loginAt: (json['login_at'] as num).toInt(),
      lastActive: (json['last_active'] as num).toInt(),
      validUntil: (json['valid_until'] as num).toInt(),
      remoteAddr: json['remote_addr'] as String,
      userAgent: json['user_agent'] as String?,
      xForwardedFor: json['x_forwarded_for'] as String?,
    );

Map<String, dynamic> _$SessionDataToJson(_SessionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'current_session': instance.currentSession,
      'valid': instance.valid,
      'tls': instance.tls.toJson(),
      'app': instance.app,
      'cli': instance.cli,
      'login_at': instance.loginAt,
      'last_active': instance.lastActive,
      'valid_until': instance.validUntil,
      'remote_addr': instance.remoteAddr,
      'user_agent': instance.userAgent,
      'x_forwarded_for': instance.xForwardedFor,
    };

_Tls _$TlsFromJson(Map<String, dynamic> json) => _Tls(
      login: json['login'] as bool,
      mixed: json['mixed'] as bool,
    );

Map<String, dynamic> _$TlsToJson(_Tls instance) => <String, dynamic>{
      'login': instance.login,
      'mixed': instance.mixed,
    };
