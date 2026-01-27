// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lead _$LeadFromJson(Map<String, dynamic> json) => Lead(
  id: (json['id'] as num?)?.toInt(),
  leadProjects: (json['lead_projects'] as List<dynamic>?)
      ?.map((e) => Project.fromJson(e as Map<String, dynamic>))
      .toList(),
  projectIds: (json['project_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  fullName: json['full_name'] as String?,
  fullNameEn: json['full_name_en'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  secondaryPhone: json['secondary_phone'] as String?,
  jobTitle: json['job_title'] as String?,
  budget: json['budget'] as num?,
  preferredContactMethod: json['preferred_contact_method'] as String?,
  status: (json['status'] as num?)?.toInt(),
  leadSourceId: (json['lead_source_id'] as num?)?.toInt(),
  assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  leadSource: json['lead_source'] == null
      ? null
      : LeadSource.fromJson(json['lead_source'] as Map<String, dynamic>),
  attachments: (json['attchments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  contracts: (json['contracts'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
  'id': instance.id,
  'lead_projects': instance.leadProjects?.map((e) => e.toJson()).toList(),
  'project_ids': instance.projectIds,
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
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'company_id': instance.companyId,
  'lead_source': instance.leadSource?.toJson(),
  'attchments': instance.attachments?.map((e) => e.toJson()).toList(),
  'contracts': instance.contracts?.map((e) => e.toJson()).toList(),
};
