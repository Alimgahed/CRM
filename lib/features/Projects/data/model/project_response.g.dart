// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectPlan _$ProjectPlanFromJson(Map<String, dynamic> json) => ProjectPlan(
  projectPlanId: json['projectPlanId'] as String,
  projectId: json['projectId'] as String,
  noOfYears: (json['noOfYears'] as num?)?.toInt(),
  downPayment: (json['downPayment'] as num?)?.toDouble(),
  yearlyInstallment: (json['yearlyInstallment'] as num?)?.toDouble(),
  attachment: json['attachment'] == null
      ? null
      : Attachment.fromJson(json['attachment'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectPlanToJson(ProjectPlan instance) =>
    <String, dynamic>{
      'projectPlanId': instance.projectPlanId,
      'projectId': instance.projectId,
      'noOfYears': instance.noOfYears,
      'downPayment': instance.downPayment,
      'yearlyInstallment': instance.yearlyInstallment,
      'attachment': instance.attachment,
    };

StageGroup _$StageGroupFromJson(Map<String, dynamic> json) => StageGroup(
  stageGroupId: json['stageGroupId'] as String,
  projectStageId: json['projectStageId'] as String,
  stageCode: json['stageCode'] as String,
);

Map<String, dynamic> _$StageGroupToJson(StageGroup instance) =>
    <String, dynamic>{
      'stageGroupId': instance.stageGroupId,
      'projectStageId': instance.projectStageId,
      'stageCode': instance.stageCode,
    };

ProjectStage _$ProjectStageFromJson(Map<String, dynamic> json) => ProjectStage(
  projectStageId: json['projectStageId'] as String,
  projectId: json['projectId'] as String,
  stageName: json['stage_name'] as String,
  groups: (json['groups'] as List<dynamic>?)
      ?.map((e) => StageGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectStageToJson(ProjectStage instance) =>
    <String, dynamic>{
      'projectStageId': instance.projectStageId,
      'projectId': instance.projectId,
      'stage_name': instance.stageName,
      'groups': instance.groups?.map((e) => e.toJson()).toList(),
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  projectId: json['projectId'] as String,
  projectName: json['projectName'] as String,
  projectNameEn: json['projectNameEn'] as String,
  projectPrefix: json['projectPrefix'] as String?,
  contactPerson: json['contactPerson'] as String?,
  contactNumber: json['contactNumber'] as String?,
  logoUrl: json['logoUrl'] as String?,
  location: json['location'] as String?,
  description: json['description'] as String?,
  youtubeLink: json['youtubeLink'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
  priceMmeterFrom: json['price_mmeter_from'] as String?,
  priceMmeterTo: json['price_mmeter_to'] as String?,
  areaFrom: json['area_from'] as String?,
  areaTo: json['area_to'] as String?,
  planDescription: json['planDescription'] as String?,
  isDeleted: json['isDeleted'] as bool,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  companyId: json['companyId'] as String,
  devCompanyId: json['devCompanyId'] as String?,
  planDetails: (json['planDetails'] as List<dynamic>?)
      ?.map((e) => ProjectPlan.fromJson(e as Map<String, dynamic>))
      .toList(),
  projectStages: (json['projectStages'] as List<dynamic>?)
      ?.map((e) => ProjectStage.fromJson(e as Map<String, dynamic>))
      .toList(),
  devCompany: json['devCompany'] == null
      ? null
      : DevCompany.fromJson(json['devCompany'] as Map<String, dynamic>),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'projectNameEn': instance.projectNameEn,
  'projectPrefix': instance.projectPrefix,
  'contactPerson': instance.contactPerson,
  'contactNumber': instance.contactNumber,
  'logoUrl': instance.logoUrl,
  'location': instance.location,
  'description': instance.description,
  'youtubeLink': instance.youtubeLink,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'price_mmeter_from': instance.priceMmeterFrom,
  'price_mmeter_to': instance.priceMmeterTo,
  'area_from': instance.areaFrom,
  'area_to': instance.areaTo,
  'planDescription': instance.planDescription,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'companyId': instance.companyId,
  'devCompanyId': instance.devCompanyId,
  'planDetails': instance.planDetails?.map((e) => e.toJson()).toList(),
  'projectStages': instance.projectStages?.map((e) => e.toJson()).toList(),
  'devCompany': instance.devCompany?.toJson(),
  'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 1,
  ProjectStatus.onHold: 2,
  ProjectStatus.complete: 3,
};

Attachment _$AttachmentFromJson(Map<String, dynamic> json) => Attachment(
  attachmentId: json['attachmentId'] as String,
  entityType: (json['entityType'] as num).toInt(),
  category: json['category'] as String?,
  entityId: json['entityId'] as String,
  fileName: json['fileName'] as String,
  filePath: json['filePath'] as String,
  fileType: json['fileType'] as String?,
  fileData: json['fileData'] as String?,
  fileSize: (json['fileSize'] as num?)?.toInt(),
  uploadedBy: json['uploadedBy'] as String?,
  notes: json['notes'] as String?,
  isDeleted: json['isDeleted'] as bool,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  companyId: json['companyId'] as String,
);

Map<String, dynamic> _$AttachmentToJson(Attachment instance) =>
    <String, dynamic>{
      'attachmentId': instance.attachmentId,
      'entityType': instance.entityType,
      'category': instance.category,
      'entityId': instance.entityId,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileType': instance.fileType,
      'fileData': instance.fileData,
      'fileSize': instance.fileSize,
      'uploadedBy': instance.uploadedBy,
      'notes': instance.notes,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'companyId': instance.companyId,
    };
