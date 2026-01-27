// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
  id: (json['id'] as num?)?.toInt(),
  fullName: json['full_name'] as String?,
  fullNameEn: json['fullNameEn'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  secondPhone: json['scound_phone'] as String?,
  isDeleted: json['isDeleted'] as bool? ?? false,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'fullNameEn': instance.fullNameEn,
  'email': instance.email,
  'phone': instance.phone,
  'scound_phone': instance.secondPhone,
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'company_id': instance.companyId,
};
