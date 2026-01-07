// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
  ownerId: json['ownerId'] as String,
  fullName: json['fullName'] as String,
  fullNameEn: json['fullNameEn'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  scoundPhone: json['scoundPhone'] as String?,
  isDeleted: json['isDeleted'] as bool,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String?,
  companyId: json['companyId'] as String,
);

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
  'ownerId': instance.ownerId,
  'fullName': instance.fullName,
  'fullNameEn': instance.fullNameEn,
  'email': instance.email,
  'phone': instance.phone,
  'scoundPhone': instance.scoundPhone,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'companyId': instance.companyId,
};
