// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsResponse _$LeadsResponseFromJson(Map<String, dynamic> json) =>
    LeadsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Lead.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$LeadsResponseToJson(LeadsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };
