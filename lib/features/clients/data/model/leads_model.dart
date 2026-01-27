import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leads_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Lead {
  final int? id;

  @JsonKey(name: 'lead_projects')
  final List<Project>? leadProjects;

  @JsonKey(name: 'project_ids')
  final List<int>? projectIds;

  @JsonKey(name: 'full_name')
  final String? fullName;

  @JsonKey(name: 'full_name_en')
  final String? fullNameEn;

  final String? email;
  final String? phone;

  @JsonKey(name: 'secondary_phone')
  final String? secondaryPhone;

  @JsonKey(name: 'job_title')
  final String? jobTitle;

  final num? budget;

  @JsonKey(name: 'preferred_contact_method')
  final String? preferredContactMethod;

  final int? status;

  @JsonKey(name: 'lead_source_id')
  final int? leadSourceId;

  @JsonKey(name: 'assigned_to_id')
  final int? assignedToId;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'lead_source')
  final LeadSource? leadSource;

  /// API typo: "attchments"
  @JsonKey(name: 'attchments')
  final List<Attachment>? attachments;

  final List<Attachment>? contracts;

  Lead({
    this.id,
    this.leadProjects,
    this.projectIds,
    this.fullName,
    this.fullNameEn,
    this.email,
    this.phone,
    this.secondaryPhone,
    this.jobTitle,
    this.budget,
    this.preferredContactMethod,
    this.status,
    this.leadSourceId,
    this.assignedToId,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.leadSource,
    this.attachments,
    this.contracts,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);

  Map<String, dynamic> toJson() => _$LeadToJson(this);
}
