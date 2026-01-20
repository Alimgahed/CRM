// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesResponse _$CompaniesResponseFromJson(Map<String, dynamic> json) =>
    CompaniesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DeveloperCompany.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompaniesResponseToJson(CompaniesResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };
