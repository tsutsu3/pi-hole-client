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
