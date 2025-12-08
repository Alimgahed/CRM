import 'package:json_annotation/json_annotation.dart';

part 'developers_response.g.dart';
@JsonSerializable(explicitToJson: true)
class DevelopmentCompany {
  @JsonKey(name: "ID")
  int? id;

  @JsonKey(name: "COMPANY_NAME")
  String? companyName;

  @JsonKey(name: "COMPANY_NAME_EN")
  String? companyNameEn;

  @JsonKey(name: "COMPANY_SALES_NAME")
  String? companySalesName;

  @JsonKey(name: "COMPANY_SALES_PHONE")
  String? companySalesPhone;

  @JsonKey(name: "COMPANY_ACCOUNTANT_NAME")
  String? companyAccountantName;

  @JsonKey(name: "COMPANY_ACCOUNTANT_PHONE")
  String? companyAccountantPhone;

  @JsonKey(name: "COMPANY_COMMISSION")
  dynamic companyCommission;

  @JsonKey(name: "COMPANY_INCENTIVE")
  dynamic companyIncentive;

  @JsonKey(name: "COMPANY_LOGO_URL")
  String? companyLogoUrl;

  @JsonKey(name: "COMPANY_LOGO_BASE")
  String? companyLogoBase;

  DevelopmentCompany({
    this.id,
    this.companyName,
    this.companyNameEn,
    this.companySalesName,
    this.companySalesPhone,
    this.companyAccountantName,
    this.companyAccountantPhone,
    this.companyCommission,
    this.companyIncentive,
    this.companyLogoUrl,
    this.companyLogoBase,
  });

  factory DevelopmentCompany.fromJson(Map<String, dynamic> json) =>
      _$DevelopmentCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$DevelopmentCompanyToJson(this);
}
