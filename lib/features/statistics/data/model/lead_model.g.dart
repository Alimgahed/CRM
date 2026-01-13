// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lead _$LeadFromJson(Map<String, dynamic> json) => Lead(
  leadId: json['lead_id'] as String,
  fullName: json['full_name'] as String,
  fullNameEn: json['full_name_en'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  secondaryPhone: json['secondary_phone'] as String?,
  jobTitle: json['job_title'] as String,
  budget: (json['budget'] as num).toInt(),
  preferredContactMethod: json['preferred_contact_method'] as String,
  status: (json['status'] as num).toInt(),
  leadSourceId: json['lead_source_id'] as String,
  assignedToId: json['assigned_to_id'] as String?,
  projects: (json['projects'] as List<dynamic>)
      .map((e) => Project.fromJson(e as Map<String, dynamic>))
      .toList(),
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  companyId: json['company_id'] as String,
);

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
  'lead_id': instance.leadId,
  'full_name': instance.fullName,
  'full_name_en': instance.fullNameEn,
  'email': instance.email,
  'phone': instance.phone,
  'secondary_phone': instance.secondaryPhone,
  'job_title': instance.jobTitle,
  'budget': instance.budget,
  'preferred_contact_method': instance.preferredContactMethod,
  'status': instance.status,
  'lead_source_id': instance.leadSourceId,
  'assigned_to_id': instance.assignedToId,
  'projects': instance.projects,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'company_id': instance.companyId,
};
