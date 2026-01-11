import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'developers_model.g.dart';

@JsonSerializable()
class DevCompany {
  @JsonKey(name: "dev_company_id")
  final String? devCompanyId;

  @JsonKey(name: "company_name_ar")
  final String? companyNameAr;

  @JsonKey(name: "company_name_en")
  final String? companyNameEn;

  @JsonKey(name: "contact_person")
  final String? contactPerson;

  @JsonKey(name: "contact_number")
  final String? contactNumber;

  @JsonKey(name: "Logo_url")
  final String? logoUrl;

  @JsonKey(name: "is_active")
  final bool? isActive;

  @JsonKey(name: "is_deleted")
  final bool? isDeleted;

  @JsonKey(name: "created_at")
  final String? createdAt;

  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @JsonKey(name: "company_id")
  final String? companyId;

  @JsonKey(name: "project_count")
  final int? projectCount;

  final List<Project>? projects;

  DevCompany({
    this.devCompanyId,
    this.companyNameAr,
    this.companyNameEn,
    this.contactPerson,
    this.contactNumber,
    this.logoUrl,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.projectCount,
    this.projects,
  });

  factory DevCompany.fromJson(Map<String, dynamic> json) =>
      _$DevCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$DevCompanyToJson(this);
}

@JsonSerializable()
class DevCompanyListResponse {
  final List<DevCompany>? data;
  final int? total;
  final int? page;
  @JsonKey(name: "page_size")
  final int? pageSize;
  @JsonKey(name: "total_pages")
  final int? totalPages;

  DevCompanyListResponse({
    this.data,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory DevCompanyListResponse.fromJson(Map<String, dynamic> json) =>
      _$DevCompanyListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DevCompanyListResponseToJson(this);
}
