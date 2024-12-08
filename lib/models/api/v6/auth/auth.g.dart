// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PasswordImpl _$$PasswordImplFromJson(Map<String, dynamic> json) =>
    _$PasswordImpl(
      password: json['password'] as String,
    );

Map<String, dynamic> _$$PasswordImplToJson(_$PasswordImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      session: SessionDetail.fromJson(json['session'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'session': instance.session,
      'took': instance.took,
    };

_$SessionDetailImpl _$$SessionDetailImplFromJson(Map<String, dynamic> json) =>
    _$SessionDetailImpl(
      valid: json['valid'] as bool,
      totp: json['totp'] as bool,
      sid: json['sid'] as String,
      csrf: json['csrf'] as String,
      validity: (json['validity'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$SessionDetailImplToJson(_$SessionDetailImpl instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'totp': instance.totp,
      'sid': instance.sid,
      'csrf': instance.csrf,
      'validity': instance.validity,
      'message': instance.message,
    };
