// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Clients _$ClientsFromJson(Map<String, dynamic> json) => _Clients(
  clients: (json['clients'] as List<dynamic>)
      .map((e) => Client.fromJson(e as Map<String, dynamic>))
      .toList(),
  took: (json['took'] as num).toDouble(),
  processed: json['processed'] == null
      ? null
      : Processed.fromJson(json['processed'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ClientsToJson(_Clients instance) => <String, dynamic>{
  'clients': instance.clients.map((e) => e.toJson()).toList(),
  'took': instance.took,
  'processed': instance.processed?.toJson(),
};

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  client: json['client'] as String,
  id: (json['id'] as num).toInt(),
  groups: (json['groups'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  dateAdded: (json['date_added'] as num).toInt(),
  dateModified: (json['date_modified'] as num).toInt(),
  name: json['name'] as String?,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'client': instance.client,
  'id': instance.id,
  'groups': instance.groups,
  'date_added': instance.dateAdded,
  'date_modified': instance.dateModified,
  'name': instance.name,
  'comment': instance.comment,
};

_Processed _$ProcessedFromJson(Map<String, dynamic> json) => _Processed(
  success: (json['success'] as List<dynamic>)
      .map((e) => ProcessedSuccess.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: (json['errors'] as List<dynamic>)
      .map((e) => ProcessedError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProcessedToJson(_Processed instance) =>
    <String, dynamic>{
      'success': instance.success.map((e) => e.toJson()).toList(),
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };

_ProcessedSuccess _$ProcessedSuccessFromJson(Map<String, dynamic> json) =>
    _ProcessedSuccess(item: json['item'] as String);

Map<String, dynamic> _$ProcessedSuccessToJson(_ProcessedSuccess instance) =>
    <String, dynamic>{'item': instance.item};

_ProcessedError _$ProcessedErrorFromJson(Map<String, dynamic> json) =>
    _ProcessedError(
      item: json['item'] as String,
      error: json['error'] as String,
    );

Map<String, dynamic> _$ProcessedErrorToJson(_ProcessedError instance) =>
    <String, dynamic>{'item': instance.item, 'error': instance.error};
