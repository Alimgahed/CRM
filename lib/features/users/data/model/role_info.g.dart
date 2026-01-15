// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleInfo _$RoleInfoFromJson(Map<String, dynamic> json) => RoleInfo(
  roleId: json['role_id'] as String?,
  roleName: json['role_name'] as String?,
  roleNameEn: json['role_name_en'] as String?,
  description: json['description'] as String?,
  isSystemRole: json['is_system_role'] as bool?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleInfoToJson(RoleInfo instance) => <String, dynamic>{
  'role_id': instance.roleId,
  'role_name': instance.roleName,
  'role_name_en': instance.roleNameEn,
  'description': instance.description,
  'is_system_role': instance.isSystemRole,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'permissions': instance.permissions?.map((e) => e.toJson()).toList(),
};
