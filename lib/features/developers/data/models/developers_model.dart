import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'developers_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeveloperCompany {
  @JsonKey(name: 'Logo')
  final String? logo;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'company_name_ar')
  final String? companyNameAr;

  @JsonKey(name: 'company_name_en')
  final String? companyNameEn;

  @JsonKey(name: 'contact_number')
  final String? contactNumber;

  @JsonKey(name: 'contact_person')
  final String? contactPerson;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final int? id;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @JsonKey(name: 'project_count')
  final int? projectCount;

  final List<Project>? projects;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  DeveloperCompany({
    this.logo,
    this.companyId,
    this.companyNameAr,
    this.companyNameEn,
    this.contactNumber,
    this.contactPerson,
    this.createdAt,
    this.id,
    this.isActive,
    this.isDeleted,
    this.logoUrl,
    this.projectCount,
    this.projects,
    this.updatedAt,
  });

  factory DeveloperCompany.fromJson(Map<String, dynamic> json) =>
      _$DeveloperCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperCompanyToJson(this);
}
