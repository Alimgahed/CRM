import 'package:json_annotation/json_annotation.dart';

part 'projects_model.g.dart';

/// ===============================
/// PROJECT
/// ===============================
@JsonSerializable(explicitToJson: true)
class Project {
  final int? id;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'dev_company_id')
  final int? devCompanyId;

  @JsonKey(name: 'project_name')
  final String? projectName;

  @JsonKey(name: 'project_name_en')
  final String? projectNameEn;

  @JsonKey(name: 'project_prefix')
  final String? projectPrefix;

  final String? description;
  final String? location;

  @JsonKey(name: 'contact_number')
  final String? contactNumber;

  @JsonKey(name: 'contact_person')
  final String? contactPerson;

  @JsonKey(name: 'project_logo')
  final String? projectLogo;

  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @JsonKey(name: 'project_map_url')
  final String? projectMapUrl;

  @JsonKey(name: 'project_url')
  final String? projectUrl;

  @JsonKey(name: 'youtube_link')
  final String? youtubeLink;

  @JsonKey(name: 'project_type')
  final int? projectType;

  @JsonKey(name: 'area_from')
  final String? areaFrom;

  @JsonKey(name: 'area_to')
  final String? areaTo;

  @JsonKey(name: 'price_mmeter_from')
  final String? pricePerMeterFrom;

  @JsonKey(name: 'price_mmeter_to')
  final String? pricePerMeterTo;

  @JsonKey(name: 'plan_description')
  final String? planDescription;

  @JsonKey(name: 'start_date')
  final String? startDate;

  @JsonKey(name: 'end_date')
  final String? endDate;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  final List<Attachment>? attachments;

  @JsonKey(name: 'plan_details')
  final List<PlanDetail>? planDetails;

  @JsonKey(name: 'project_stages')
  final List<ProjectStage>? projectStages;

  Project({
    this.id,
    this.companyId,
    this.devCompanyId,
    this.projectName,
    this.projectNameEn,
    this.projectPrefix,
    this.description,
    this.location,
    this.contactNumber,
    this.contactPerson,
    this.projectLogo,
    this.logoUrl,
    this.projectMapUrl,
    this.projectUrl,
    this.youtubeLink,
    this.projectType,
    this.areaFrom,
    this.areaTo,
    this.pricePerMeterFrom,
    this.pricePerMeterTo,
    this.planDescription,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.attachments,
    this.planDetails,
    this.projectStages,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

/// ===============================
/// ATTACHMENT
/// ===============================
@JsonSerializable()
class Attachment {
  final int? id;

  final int? category;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'entity_id')
  final int? entityId;

  @JsonKey(name: 'entity_type')
  final int? entityType;

  @JsonKey(name: 'file_data')
  final String? fileData;

  @JsonKey(name: 'file_name')
  final String? fileName;

  @JsonKey(name: 'file_path')
  final String? filePath;

  @JsonKey(name: 'file_size')
  final int? fileSize;

  @JsonKey(name: 'file_type')
  final String? fileType;

  final String? notes;

  @JsonKey(name: 'uploaded_by')
  final int? uploadedBy;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Attachment({
    this.id,
    this.category,
    this.companyId,
    this.entityId,
    this.entityType,
    this.fileData,
    this.fileName,
    this.filePath,
    this.fileSize,
    this.fileType,
    this.notes,
    this.uploadedBy,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

/// ===============================
/// PLAN DETAILS
/// ===============================
@JsonSerializable(explicitToJson: true)
class PlanDetail {
  final int? id;

  @JsonKey(name: 'project_id')
  final int? projectId;

  @JsonKey(name: 'discount_percent')
  final int? discountPercent;

  @JsonKey(name: 'down_payment')
  final int? downPayment;

  @JsonKey(name: 'no_of_years')
  final int? noOfYears;

  @JsonKey(name: 'yearly_installment')
  final int? yearlyInstallment;

  @JsonKey(name: 'plan_description')
  final String? planDescription;

  final Attachment? attachment;

  PlanDetail({
    this.id,
    this.projectId,
    this.discountPercent,
    this.downPayment,
    this.noOfYears,
    this.yearlyInstallment,
    this.planDescription,
    this.attachment,
  });

  factory PlanDetail.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDetailToJson(this);
}

/// ===============================
/// PROJECT STAGES
/// ===============================
@JsonSerializable(explicitToJson: true)
class ProjectStage {
  final int? id;

  @JsonKey(name: 'project_id')
  final int? projectId;

  @JsonKey(name: 'stage_name')
  final String? stageName;

  final List<ProjectStageGroup>? groups;

  ProjectStage({this.id, this.projectId, this.stageName, this.groups});

  factory ProjectStage.fromJson(Map<String, dynamic> json) =>
      _$ProjectStageFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectStageToJson(this);
}

/// ===============================
/// PROJECT STAGE GROUPS
/// ===============================
@JsonSerializable()
class ProjectStageGroup {
  final int? id;

  @JsonKey(name: 'project_stage_id')
  final int? projectStageId;

  @JsonKey(name: 'stage_code')
  final String? stageCode;

  ProjectStageGroup({this.id, this.projectStageId, this.stageCode});

  factory ProjectStageGroup.fromJson(Map<String, dynamic> json) =>
      _$ProjectStageGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectStageGroupToJson(this);
}
