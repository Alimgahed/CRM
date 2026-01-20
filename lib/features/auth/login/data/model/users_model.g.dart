// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
  id: (json['id'] as num?)?.toInt(),
  leaderId: (json['leader_id'] as num?)?.toInt(),
  fullName: json['full_name'] as String,
  fullNameEn: json['full_name_en'] as String?,
  email: json['email'] as String,
  passwordHash: json['PASSWORD_HASH'] as String?,
  userType: (json['user_type'] as num).toInt(),
  isActive: json['is_active'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  photoUrl: json['photo_url'] as String?,
  leaderName: json['leader_name'] as String?,
  phone: json['phone'] as String?,
  permissions: Map<String, bool>.from(json['permissions'] as Map),
  roles: (json['roles'] as List<dynamic>?)
      ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
      .toList(),
);

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
