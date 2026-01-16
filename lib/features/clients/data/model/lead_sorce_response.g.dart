// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_sorce_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadSourceResponse _$LeadSourceResponseFromJson(Map<String, dynamic> json) =>
    LeadSourceResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => LeadSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$LeadSourceResponseToJson(LeadSourceResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };
