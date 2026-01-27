// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyActionsModel _$CompanyActionsModelFromJson(Map<String, dynamic> json) =>
    CompanyActionsModel(
      id: (json['id'] as num?)?.toInt(),
      actionType: (json['actionType'] as num?)?.toInt(),
      name: json['Name'] as String?,
      nameEn: json['NameEn'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      isDeleted: json['isDeleted'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CompanyActionsModelToJson(
  CompanyActionsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'actionType': instance.actionType,
  'Name': instance.name,
  'NameEn': instance.nameEn,
  'companyId': instance.companyId,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

CompanyActionsResponse _$CompanyActionsResponseFromJson(
  Map<String, dynamic> json,
) => CompanyActionsResponse(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => CompanyActionsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompanyActionsResponseToJson(
  CompanyActionsResponse instance,
) => <String, dynamic>{'data': instance.data};
