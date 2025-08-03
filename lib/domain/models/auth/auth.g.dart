// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Auth _$AuthFromJson(Map<String, dynamic> json) => _Auth(
      valid: json['valid'] as bool,
      totp: json['totp'] as bool,
      sid: json['sid'] as String,
      csrf: json['csrf'] as String,
      validity: (json['validity'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AuthToJson(_Auth instance) => <String, dynamic>{
      'valid': instance.valid,
      'totp': instance.totp,
      'sid': instance.sid,
      'csrf': instance.csrf,
      'validity': instance.validity,
      'message': instance.message,
    };

_AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => _AuthSession(
      id: (json['id'] as num).toInt(),
      isValid: json['isValid'] as bool,
      isCurrentSession: json['isCurrentSession'] as bool,
      tlsStatus: $enumDecode(_$TlsStatusEnumMap, json['tlsStatus']),
      isApp: json['isApp'] as bool,
      isCli: json['isCli'] as bool,
      loginAt: DateTime.parse(json['loginAt'] as String),
      lastActive: DateTime.parse(json['lastActive'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      clientIp: json['clientIp'] as String,
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$AuthSessionToJson(_AuthSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isValid': instance.isValid,
      'isCurrentSession': instance.isCurrentSession,
      'tlsStatus': _$TlsStatusEnumMap[instance.tlsStatus]!,
      'isApp': instance.isApp,
      'isCli': instance.isCli,
      'loginAt': instance.loginAt.toIso8601String(),
      'lastActive': instance.lastActive.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'clientIp': instance.clientIp,
      'userAgent': instance.userAgent,
    };

const _$TlsStatusEnumMap = {
  TlsStatus.login: 'login',
  TlsStatus.mixed: 'mixed',
  TlsStatus.none: 'none',
};
