// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeveloperCompany _$DeveloperCompanyFromJson(Map<String, dynamic> json) =>
    DeveloperCompany(
      logo: json['Logo'] as String?,
      companyId: (json['company_id'] as num?)?.toInt(),
      companyNameAr: json['company_name_ar'] as String?,
      companyNameEn: json['company_name_en'] as String?,
      contactNumber: json['contact_number'] as String?,
      contactPerson: json['contact_person'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      logoUrl: json['logo_url'] as String?,
      projectCount: (json['project_count'] as num?)?.toInt(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DeveloperCompanyToJson(DeveloperCompany instance) =>
    <String, dynamic>{
      'Logo': instance.logo,
      'company_id': instance.companyId,
      'company_name_ar': instance.companyNameAr,
      'company_name_en': instance.companyNameEn,
      'contact_number': instance.contactNumber,
      'contact_person': instance.contactPerson,
      'created_at': instance.createdAt,
      'id': instance.id,
      'is_active': instance.isActive,
      'is_deleted': instance.isDeleted,
      'logo_url': instance.logoUrl,
      'project_count': instance.projectCount,
      'projects': instance.projects?.map((e) => e.toJson()).toList(),
      'updated_at': instance.updatedAt,
    };
