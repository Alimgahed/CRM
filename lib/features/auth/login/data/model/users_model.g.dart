// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leader_id': instance.leaderId,
      'full_name': instance.fullName,
      'full_name_en': instance.fullNameEn,
      'email': instance.email,
      'PASSWORD_HASH': instance.passwordHash,
      'user_type': instance.userType,
      'is_active': instance.isActive,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'company_id': instance.companyId,
      'photo_url': instance.photoUrl,
      'leader_name': instance.leaderName,
      'phone': instance.phone,
      'permissions': instance.permissions,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
    };
