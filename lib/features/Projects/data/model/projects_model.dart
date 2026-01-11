import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projects_model.g.dart';

/* -------------------------------------------------------------------------- */
/*                             PROJECTS RESPONSE                              */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class ProjectsResponse {
  final List<Project> data;
  final int total;
  final int page;

  @JsonKey(name: 'page_size')
  final int pageSize;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  ProjectsResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsResponseToJson(this);
}

/* -------------------------------------------------------------------------- */
/*                                PROJECT PLAN                                */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class ProjectPlan {
  @JsonKey(name: 'project_plan_id')
  final String projectPlanId;

  @JsonKey(name: 'project_id')
  final String projectId;

  @JsonKey(name: 'no_of_years')
  final int? noOfYears;

  @JsonKey(name: 'down_payment')
  final double? downPayment;

  @JsonKey(name: 'yearly_installment')
  final double? yearlyInstallment;

  @JsonKey(name: 'discount_percent')
  final double? discountPercent;

  final Attachment? attachment;

  ProjectPlan({
    required this.projectPlanId,
    required this.projectId,
    this.noOfYears,
    this.downPayment,
    this.yearlyInstallment,
    this.discountPercent,
    this.attachment,
  });

  factory ProjectPlan.fromJson(Map<String, dynamic> json) =>
      _$ProjectPlanFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectPlanToJson(this);
}

/* -------------------------------------------------------------------------- */
/*                                STAGE GROUP                                 */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class StageGroup {
  @JsonKey(name: 'stage_group_id')
  final String stageGroupId;

  @JsonKey(name: 'project_stage_id')
  final String projectStageId;

  @JsonKey(name: 'stage_code')
  final String stageCode;

  StageGroup({
    required this.stageGroupId,
    required this.projectStageId,
    required this.stageCode,
  });

  factory StageGroup.fromJson(Map<String, dynamic> json) =>
      _$StageGroupFromJson(json);

  Map<String, dynamic> toJson() => _$StageGroupToJson(this);
}

/* -------------------------------------------------------------------------- */
/*                               PROJECT STAGE                                */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class ProjectStage {
  @JsonKey(name: 'project_stage_id')
  final String projectStageId;

  @JsonKey(name: 'project_id')
  final String projectId;

  @JsonKey(name: 'stage_name')
  final String stageName;

  final List<StageGroup>? groups;

  ProjectStage({
    required this.projectStageId,
    required this.projectId,
    required this.stageName,
    this.groups,
  });

  factory ProjectStage.fromJson(Map<String, dynamic> json) =>
      _$ProjectStageFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectStageToJson(this);
}

/* -------------------------------------------------------------------------- */
/*                                   PROJECT                                  */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class Project {
  @JsonKey(name: 'project_id')
  final String projectId;

  @JsonKey(name: 'project_name')
  final String projectName;

  @JsonKey(name: 'project_name_en')
  final String projectNameEn;

  @JsonKey(name: 'project_prefix')
  final String? projectPrefix;

  @JsonKey(name: 'contact_person')
  final String? contactPerson;

  @JsonKey(name: 'contact_number')
  final String? contactNumber;

  final String? location;
  final String? description;

  @JsonKey(name: 'project_type')
  final int? projectType;

  @JsonKey(name: 'price_mmeter_from')
  final String? priceMmeterFrom;

  @JsonKey(name: 'price_mmeter_to')
  final String? priceMmeterTo;

  @JsonKey(name: 'area_from')
  final String? areaFrom;

  @JsonKey(name: 'area_to')
  final String? areaTo;

  @JsonKey(name: 'plan_description')
  final String? planDescription;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  @JsonKey(name: 'dev_company_id')
  final String? devCompanyId;

  @JsonKey(name: 'plan_details')
  final List<ProjectPlan>? planDetails;

  @JsonKey(name: 'project_stages')
  final List<ProjectStage>? projectStages;

  @JsonKey(name: 'dev_company')
  final DevCompany? devCompany;

  final List<Attachment>? attachments;

  Project({
    required this.projectId,
    required this.projectName,
    required this.projectNameEn,
    this.projectPrefix,
    this.contactPerson,
    this.contactNumber,
    this.location,
    this.description,
    this.projectType,
    this.priceMmeterFrom,
    this.priceMmeterTo,
    this.areaFrom,
    this.areaTo,
    this.planDescription,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
    this.devCompanyId,
    this.planDetails,
    this.projectStages,
    this.devCompany,
    this.attachments,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

/* -------------------------------------------------------------------------- */
/*                                 ATTACHMENT                                 */
/* -------------------------------------------------------------------------- */

@JsonSerializable()
class Attachment {
  @JsonKey(name: 'attachment_id')
  final String attachmentId;

  @JsonKey(name: 'entity_type')
  final int entityType;

  @JsonKey(name: 'entity_id')
  final String entityId;

  @JsonKey(name: 'file_name')
  final String fileName;

  @JsonKey(name: 'file_path')
  final String filePath;

  @JsonKey(name: 'file_type')
  final String? fileType;

  @JsonKey(name: 'file_size')
  final int? fileSize;

  @JsonKey(name: 'uploaded_by')
  final String? uploadedBy;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  Attachment({
    required this.attachmentId,
    required this.entityType,
    required this.entityId,
    required this.fileName,
    required this.filePath,
    this.fileType,
    this.fileSize,
    this.uploadedBy,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
