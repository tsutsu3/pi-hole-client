// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
      error: ErrorDetails.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
      'error': instance.error,
    };

_ErrorDetails _$ErrorDetailsFromJson(Map<String, dynamic> json) =>
    _ErrorDetails(
      key: json['key'] as String,
      message: json['message'] as String,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$ErrorDetailsToJson(_ErrorDetails instance) =>
    <String, dynamic>{
      'key': instance.key,
      'message': instance.message,
      'hint': instance.hint,
    };
