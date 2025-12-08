// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevelopmentCompany _$DevelopmentCompanyFromJson(Map<String, dynamic> json) =>
    DevelopmentCompany(
      id: (json['ID'] as num?)?.toInt(),
      companyName: json['COMPANY_NAME'] as String?,
      companyNameEn: json['COMPANY_NAME_EN'] as String?,
      companySalesName: json['COMPANY_SALES_NAME'] as String?,
      companySalesPhone: json['COMPANY_SALES_PHONE'] as String?,
      companyAccountantName: json['COMPANY_ACCOUNTANT_NAME'] as String?,
      companyAccountantPhone: json['COMPANY_ACCOUNTANT_PHONE'] as String?,
      companyCommission: json['COMPANY_COMMISSION'],
      companyIncentive: json['COMPANY_INCENTIVE'],
      companyLogoUrl: json['COMPANY_LOGO_URL'] as String?,
      companyLogoBase: json['COMPANY_LOGO_BASE'] as String?,
    );

Map<String, dynamic> _$DevelopmentCompanyToJson(DevelopmentCompany instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'COMPANY_NAME': instance.companyName,
      'COMPANY_NAME_EN': instance.companyNameEn,
      'COMPANY_SALES_NAME': instance.companySalesName,
      'COMPANY_SALES_PHONE': instance.companySalesPhone,
      'COMPANY_ACCOUNTANT_NAME': instance.companyAccountantName,
      'COMPANY_ACCOUNTANT_PHONE': instance.companyAccountantPhone,
      'COMPANY_COMMISSION': instance.companyCommission,
      'COMPANY_INCENTIVE': instance.companyIncentive,
      'COMPANY_LOGO_URL': instance.companyLogoUrl,
      'COMPANY_LOGO_BASE': instance.companyLogoBase,
    };
