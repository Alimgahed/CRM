import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leads_model.g.dart';

@JsonSerializable()
class Lead {
  @JsonKey(name: 'lead_id')
  final String leadId;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'full_name_en')
  final String fullNameEn;

  final String email;
  final String phone;

  @JsonKey(name: 'secondary_phone')
  final String? secondaryPhone;

  @JsonKey(name: 'job_title')
  final String jobTitle;

  final int budget;

  @JsonKey(name: 'preferred_contact_method')
  final String preferredContactMethod;

  final int status;

  @JsonKey(name: 'lead_source_id')
  final String leadSourceId;

  @JsonKey(name: 'assigned_to_id')
  final String? assignedToId;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  // NEW: lead source details
  @JsonKey(name: 'lead_source')
  final LeadSource? leadSource;

  // NEW: attachments
  final List<Attachment>? attchments;

  // NEW: contracts
  final List<Attachment>? contracts;

  @JsonKey(name: "project_ids")
  final List<String>? projectIds;

  Lead({
    required this.leadId,
    required this.fullName,
    required this.fullNameEn,
    required this.email,
    required this.phone,
    this.secondaryPhone,
    required this.jobTitle,
    required this.budget,
    required this.preferredContactMethod,
    required this.status,
    required this.leadSourceId,
    this.assignedToId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.companyId,
    this.leadSource,
    this.attchments,
    this.contracts,
    this.projectIds,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  Map<String, dynamic> toJson() => _$LeadToJson(this);
}

@JsonSerializable()
class Attachment {
  @JsonKey(name: 'attachment_id')
  final String attachmentId;

  @JsonKey(name: 'entity_type')
  final int entityType;

  final int? category;

  @JsonKey(name: 'entity_id')
  final String entityId;

  @JsonKey(name: 'file_name')
  final String fileName;

  @JsonKey(name: 'file_path')
  final String filePath;

  @JsonKey(name: 'file_type')
  final String fileType;

  @JsonKey(name: 'file_size')
  final int fileSize;

  @JsonKey(name: 'uploaded_by')
  final String uploadedBy;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  Attachment({
    required this.attachmentId,
    required this.entityType,
    this.category,
    required this.entityId,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileSize,
    required this.uploadedBy,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.companyId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
