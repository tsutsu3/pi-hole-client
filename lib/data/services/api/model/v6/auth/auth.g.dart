// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Password _$PasswordFromJson(Map<String, dynamic> json) => _Password(
      password: json['password'] as String,
    );

Map<String, dynamic> _$PasswordToJson(_Password instance) => <String, dynamic>{
      'password': instance.password,
    };

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
      session: SessionDetail.fromJson(json['session'] as Map<String, dynamic>),
      took: (json['took'] as num).toDouble(),
    );

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
      'session': instance.session.toJson(),
      'took': instance.took,
    };

_SessionDetail _$SessionDetailFromJson(Map<String, dynamic> json) =>
    _SessionDetail(
      valid: json['valid'] as bool,
      totp: json['totp'] as bool,
      sid: json['sid'] as String,
      csrf: json['csrf'] as String,
      validity: (json['validity'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SessionDetailToJson(_SessionDetail instance) =>
    <String, dynamic>{
      'valid': instance.valid,
      'totp': instance.totp,
      'sid': instance.sid,
      'csrf': instance.csrf,
      'validity': instance.validity,
      'message': instance.message,
    };
