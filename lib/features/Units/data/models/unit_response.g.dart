// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitResponse _$UnitResponseFromJson(Map<String, dynamic> json) => UnitResponse(
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => Unit.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['page_size'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$UnitResponseToJson(UnitResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };
