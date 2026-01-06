import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'developers_response.g.dart';
@JsonSerializable()
class DevCompany {
  final String devCompanyId;
  final String companyNameAr;
  final String companyNameEn;
  final String contactPerson;
  final String contactNumber;
  final String? logoUrl;
  final bool isActive;
  final bool isDeleted;
  final String createdAt;
  final String? updatedAt;
  final String companyId;

  final List<Project>? projects;

  DevCompany({
    required this.devCompanyId,
    required this.companyNameAr,
    required this.companyNameEn,
    required this.contactPerson,
    required this.contactNumber,
    this.logoUrl,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    this.updatedAt,
    required this.companyId,
    this.projects,
  });

  factory DevCompany.fromJson(Map<String, dynamic> json) =>
      _$DevCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$DevCompanyToJson(this);
}
