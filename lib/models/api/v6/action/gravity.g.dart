// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gravity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gravity _$GravityFromJson(Map<String, dynamic> json) => _Gravity(
      entries: (json['entries'] as List<dynamic>?)
              ?.map((e) => GravityEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GravityToJson(_Gravity instance) => <String, dynamic>{
      'entries': instance.entries,
    };

_GravityEntry _$GravityEntryFromJson(Map<String, dynamic> json) =>
    _GravityEntry(
      message: json['message'] as String,
    );

Map<String, dynamic> _$GravityEntryToJson(_GravityEntry instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
