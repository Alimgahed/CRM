import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/developers/data/models/developers_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project_response.g.dart';

@JsonSerializable()
class ProjectPlan {
  final String projectPlanId;
  final String projectId;
  final int? noOfYears;
  final double? downPayment;
  final double? yearlyInstallment;

  final Attachment? attachment;

  ProjectPlan({
    required this.projectPlanId,
    required this.projectId,
    this.noOfYears,
    this.downPayment,
    this.yearlyInstallment,
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
  final String stageGroupId;
  final String projectStageId;
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

@JsonSerializable(explicitToJson: true)
class ProjectStage {
  final String projectStageId;
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

@JsonSerializable(explicitToJson: true)
class Project {
  final String projectId;
  final String projectName;
  final String projectNameEn;

  final String? projectPrefix;
  final String? contactPerson;
  final String? contactNumber;

  final String? logoUrl;
  final String? location;
  final String? description;
  final String? youtubeLink;

  final String? startDate;
  final String? endDate;
  final ProjectStatus status;

  @JsonKey(name: 'price_mmeter_from')
  final String? priceMmeterFrom;

  @JsonKey(name: 'price_mmeter_to')
  final String? priceMmeterTo;

  @JsonKey(name: 'area_from')
  final String? areaFrom;

  @JsonKey(name: 'area_to')
  final String? areaTo;

  final String? planDescription;
  final bool isDeleted;
  final String createdAt;
  final String? updatedAt;
  final String companyId;

  final String? devCompanyId;

  final List<ProjectPlan>? planDetails;
  final List<ProjectStage>? projectStages;

  final DevCompany? devCompany;

  /// NEW
  final List<Attachment>? attachments;

  Project({
    required this.projectId,
    required this.projectName,
    required this.projectNameEn,
    this.projectPrefix,
    this.contactPerson,
    this.contactNumber,
    this.logoUrl,
    this.location,
    this.description,
    this.youtubeLink,
    this.startDate,
    this.endDate,
    required this.status,
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
    this.attachments, // ADDED
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}


@JsonSerializable()
class Attachment {
  final String attachmentId;
  final int entityType;
  final String? category;
  final String entityId;
  final String fileName;
  final String filePath;
  final String? fileType;
  final String? fileData;
  final int? fileSize;
  final String? uploadedBy;
  final String? notes;
  final bool isDeleted;
  final String createdAt;
  final String? updatedAt;
  final String companyId;

  Attachment({
    required this.attachmentId,
    required this.entityType,
    this.category,
    required this.entityId,
    required this.fileName,
    required this.filePath,
    this.fileType,
    this.fileData,
    this.fileSize,
    this.uploadedBy,
    this.notes,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
