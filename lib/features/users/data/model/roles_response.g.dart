// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesResponse _$RolesResponseFromJson(Map<String, dynamic> json) =>
    RolesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RolesResponseToJson(RolesResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
    };
