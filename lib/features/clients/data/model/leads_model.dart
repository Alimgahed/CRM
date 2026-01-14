import 'package:crm/features/Projects/data/model/projects_model.dart';
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
