// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsResponse _$ProjectsResponseFromJson(Map<String, dynamic> json) =>
    ProjectsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['page_size'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
    );

Map<String, dynamic> _$ProjectsResponseToJson(ProjectsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.pageSize,
      'total_pages': instance.totalPages,
    };

ProjectPlan _$ProjectPlanFromJson(Map<String, dynamic> json) => ProjectPlan(
  projectPlanId: json['project_plan_id'] as String,
  projectId: json['project_id'] as String,
  noOfYears: (json['no_of_years'] as num?)?.toInt(),
  downPayment: (json['down_payment'] as num?)?.toDouble(),
  yearlyInstallment: (json['yearly_installment'] as num?)?.toDouble(),
  discountPercent: (json['discount_percent'] as num?)?.toDouble(),
  attachment: json['attachment'] == null
      ? null
      : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectPlanToJson(ProjectPlan instance) =>
    <String, dynamic>{
      'project_plan_id': instance.projectPlanId,
      'project_id': instance.projectId,
      'no_of_years': instance.noOfYears,
      'down_payment': instance.downPayment,
      'yearly_installment': instance.yearlyInstallment,
      'discount_percent': instance.discountPercent,
      'attachment': instance.attachment,
    };

StageGroup _$StageGroupFromJson(Map<String, dynamic> json) => StageGroup(
  stageGroupId: json['stage_group_id'] as String,
  projectStageId: json['project_stage_id'] as String,
  stageCode: json['stage_code'] as String,
);

Map<String, dynamic> _$StageGroupToJson(StageGroup instance) =>
    <String, dynamic>{
      'stage_group_id': instance.stageGroupId,
      'project_stage_id': instance.projectStageId,
      'stage_code': instance.stageCode,
    };

ProjectStage _$ProjectStageFromJson(Map<String, dynamic> json) => ProjectStage(
  projectStageId: json['project_stage_id'] as String,
  projectId: json['project_id'] as String,
  stageName: json['stage_name'] as String,
  groups: (json['groups'] as List<dynamic>?)
      ?.map((e) => StageGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectStageToJson(ProjectStage instance) =>
    <String, dynamic>{
      'project_stage_id': instance.projectStageId,
      'project_id': instance.projectId,
      'stage_name': instance.stageName,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  projectId: json['project_id'] as String,
  projectName: json['project_name'] as String,
  projectNameEn: json['project_name_en'] as String,
  projectPrefix: json['project_prefix'] as String?,
  contactPerson: json['contact_person'] as String?,
  contactNumber: json['contact_number'] as String?,
  location: json['location'] as String?,
  description: json['description'] as String?,
  projectType: (json['project_type'] as num?)?.toInt(),
  priceMmeterFrom: json['price_mmeter_from'] as String?,
  priceMmeterTo: json['price_mmeter_to'] as String?,
  areaFrom: json['area_from'] as String?,
  areaTo: json['area_to'] as String?,
  planDescription: json['plan_description'] as String?,
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String?,
  companyId: json['company_id'] as String,
  devCompanyId: json['dev_company_id'] as String?,
  planDetails: (json['plan_details'] as List<dynamic>?)
      ?.map((e) => ProjectPlan.fromJson(e as Map<String, dynamic>))
      .toList(),
  projectStages: (json['project_stages'] as List<dynamic>?)
      ?.map((e) => ProjectStage.fromJson(e as Map<String, dynamic>))
      .toList(),
  devCompany: json['dev_company'] == null
      ? null
      : DevCompany.fromJson(json['dev_company'] as Map<String, dynamic>),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'project_id': instance.projectId,
  'project_name': instance.projectName,
  'project_name_en': instance.projectNameEn,
  'project_prefix': instance.projectPrefix,
  'contact_person': instance.contactPerson,
  'contact_number': instance.contactNumber,
  'location': instance.location,
  'description': instance.description,
  'project_type': instance.projectType,
  'price_mmeter_from': instance.priceMmeterFrom,
  'price_mmeter_to': instance.priceMmeterTo,
  'area_from': instance.areaFrom,
  'area_to': instance.areaTo,
  'plan_description': instance.planDescription,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'company_id': instance.companyId,
  'dev_company_id': instance.devCompanyId,
  'plan_details': instance.planDetails?.map((e) => e.toJson()).toList(),
  'project_stages': instance.projectStages?.map((e) => e.toJson()).toList(),
  'dev_company': instance.devCompany?.toJson(),
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
};

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
  attachmentId: json['attachment_id'] as String,
  entityType: (json['entity_type'] as num).toInt(),
  entityId: json['entity_id'] as String,
  fileName: json['file_name'] as String,
  filePath: json['file_path'] as String,
  fileType: json['file_type'] as String?,
  fileSize: (json['file_size'] as num?)?.toInt(),
  uploadedBy: json['uploaded_by'] as String?,
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String?,
  companyId: json['company_id'] as String,
);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'attachment_id': instance.attachmentId,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'file_name': instance.fileName,
      'file_path': instance.filePath,
      'file_type': instance.fileType,
      'file_size': instance.fileSize,
      'uploaded_by': instance.uploadedBy,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'company_id': instance.companyId,
    };
