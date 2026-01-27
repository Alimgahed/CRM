// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadSource _$LeadSourceFromJson(Map<String, dynamic> json) => LeadSource(
  id: (json['id'] as num?)?.toInt(),
  sourceName: json['source_name'] as String,
  description: json['description'] as String,
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$LeadSourceToJson(LeadSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source_name': instance.sourceName,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
    };
