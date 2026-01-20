// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  devCompanyId: (json['dev_company_id'] as num?)?.toInt(),
  projectName: json['project_name'] as String?,
  projectNameEn: json['project_name_en'] as String?,
  projectPrefix: json['project_prefix'] as String?,
  description: json['description'] as String?,
  location: json['location'] as String?,
  contactNumber: json['contact_number'] as String?,
  contactPerson: json['contact_person'] as String?,
  projectLogo: json['project_logo'] as String?,
  logoUrl: json['logo_url'] as String?,
  projectMapUrl: json['project_map_url'] as String?,
  projectUrl: json['project_url'] as String?,
  youtubeLink: json['youtube_link'] as String?,
  projectType: (json['project_type'] as num?)?.toInt(),
  areaFrom: json['area_from'] as String?,
  areaTo: json['area_to'] as String?,
  pricePerMeterFrom: json['price_mmeter_from'] as String?,
  pricePerMeterTo: json['price_mmeter_to'] as String?,
  planDescription: json['plan_description'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  planDetails: (json['plan_details'] as List<dynamic>?)
      ?.map((e) => PlanDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  projectStages: (json['project_stages'] as List<dynamic>?)
      ?.map((e) => ProjectStage.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'dev_company_id': instance.devCompanyId,
  'project_name': instance.projectName,
  'project_name_en': instance.projectNameEn,
  'project_prefix': instance.projectPrefix,
  'description': instance.description,
  'location': instance.location,
  'contact_number': instance.contactNumber,
  'contact_person': instance.contactPerson,
  'project_logo': instance.projectLogo,
  'logo_url': instance.logoUrl,
  'project_map_url': instance.projectMapUrl,
  'project_url': instance.projectUrl,
  'youtube_link': instance.youtubeLink,
  'project_type': instance.projectType,
  'area_from': instance.areaFrom,
  'area_to': instance.areaTo,
  'price_mmeter_from': instance.pricePerMeterFrom,
  'price_mmeter_to': instance.pricePerMeterTo,
  'plan_description': instance.planDescription,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'is_deleted': instance.isDeleted,
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
  'plan_details': instance.planDetails?.map((e) => e.toJson()).toList(),
  'project_stages': instance.projectStages?.map((e) => e.toJson()).toList(),
};

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
  id: (json['id'] as num?)?.toInt(),
  category: (json['category'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  entityId: (json['entity_id'] as num?)?.toInt(),
  entityType: (json['entity_type'] as num?)?.toInt(),
  fileData: json['file_data'] as String?,
  fileName: json['file_name'] as String?,
  filePath: json['file_path'] as String?,
  fileSize: (json['file_size'] as num?)?.toInt(),
  fileType: json['file_type'] as String?,
  notes: json['notes'] as String?,
  uploadedBy: (json['uploaded_by'] as num?)?.toInt(),
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'company_id': instance.companyId,
      'entity_id': instance.entityId,
      'entity_type': instance.entityType,
      'file_data': instance.fileData,
      'file_name': instance.fileName,
      'file_path': instance.filePath,
      'file_size': instance.fileSize,
      'file_type': instance.fileType,
      'notes': instance.notes,
      'uploaded_by': instance.uploadedBy,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

PlanDetail _$PlanDetailFromJson(Map<String, dynamic> json) => PlanDetail(
  id: (json['id'] as num?)?.toInt(),
  projectId: (json['project_id'] as num?)?.toInt(),
  discountPercent: (json['discount_percent'] as num?)?.toInt(),
  downPayment: (json['down_payment'] as num?)?.toInt(),
  noOfYears: (json['no_of_years'] as num?)?.toInt(),
  yearlyInstallment: (json['yearly_installment'] as num?)?.toInt(),
  planDescription: json['plan_description'] as String?,
  attachment: json['attachment'] == null
      ? null
      : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlanDetailToJson(PlanDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'discount_percent': instance.discountPercent,
      'down_payment': instance.downPayment,
      'no_of_years': instance.noOfYears,
      'yearly_installment': instance.yearlyInstallment,
      'plan_description': instance.planDescription,
      'attachment': instance.attachment?.toJson(),
    };

ProjectStage _$ProjectStageFromJson(Map<String, dynamic> json) => ProjectStage(
  id: (json['id'] as num?)?.toInt(),
  projectId: (json['project_id'] as num?)?.toInt(),
  stageName: json['stage_name'] as String?,
  groups: (json['groups'] as List<dynamic>?)
      ?.map((e) => ProjectStageGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectStageToJson(ProjectStage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'stage_name': instance.stageName,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
    };

ProjectStageGroup _$ProjectStageGroupFromJson(Map<String, dynamic> json) =>
    ProjectStageGroup(
      id: (json['id'] as num?)?.toInt(),
      projectStageId: (json['project_stage_id'] as num?)?.toInt(),
      stageCode: json['stage_code'] as String?,
    );

Map<String, dynamic> _$ProjectStageGroupToJson(ProjectStageGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_stage_id': instance.projectStageId,
      'stage_code': instance.stageCode,
    };
