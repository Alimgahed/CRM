// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevCompany _$DevCompanyFromJson(Map<String, dynamic> json) => DevCompany(
  devCompanyId: json['dev_company_id'] as String?,
  companyNameAr: json['company_name_ar'] as String?,
  companyNameEn: json['company_name_en'] as String?,
  contactPerson: json['contact_person'] as String?,
  contactNumber: json['contact_number'] as String?,
  logoUrl: json['Logo_url'] as String?,
  isActive: json['is_active'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  companyId: json['company_id'] as String?,
  projects: (json['projects'] as List<dynamic>?)
      ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DevCompanyToJson(DevCompany instance) =>
    <String, dynamic>{
      'dev_company_id': instance.devCompanyId,
      'company_name_ar': instance.companyNameAr,
      'company_name_en': instance.companyNameEn,
      'contact_person': instance.contactPerson,
      'contact_number': instance.contactNumber,
      'Logo_url': instance.logoUrl,
      'is_active': instance.isActive,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'company_id': instance.companyId,
      'projects': instance.projects,
    };
