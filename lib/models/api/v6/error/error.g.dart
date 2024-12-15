// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      error: ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

_$ErrorDetailsImpl _$$ErrorDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ErrorDetailsImpl(
      key: json['key'] as String,
      message: json['message'] as String,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$$ErrorDetailsImplToJson(_$ErrorDetailsImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'message': instance.message,
      'hint': instance.hint,
    };
