// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevCompany _$DevCompanyFromJson(Map<String, dynamic> json) => DevCompany(
      devCompanyId: json['devCompanyId'] as String,
      companyNameAr: json['companyNameAr'] as String,
      companyNameEn: json['companyNameEn'] as String,
      contactPerson: json['contactPerson'] as String,
      contactNumber: json['contactNumber'] as String,
      logoUrl: json['logoUrl'] as String?,
      isActive: json['isActive'] as bool,
      isDeleted: json['isDeleted'] as bool,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      companyId: json['companyId'] as String,
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DevCompanyToJson(DevCompany instance) =>
    <String, dynamic>{
      'devCompanyId': instance.devCompanyId,
      'companyNameAr': instance.companyNameAr,
      'companyNameEn': instance.companyNameEn,
      'contactPerson': instance.contactPerson,
      'contactNumber': instance.contactNumber,
      'logoUrl': instance.logoUrl,
      'isActive': instance.isActive,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'companyId': instance.companyId,
      'projects': instance.projects,
    };
