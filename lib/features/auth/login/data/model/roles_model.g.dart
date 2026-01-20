// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  createdBy: (json['created_by'] as num?)?.toInt(),
  description: json['description'] as String?,
  roleName: json['role_name'] as String?,
  roleNameEn: json['role_name_en'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  isSystemRole: json['is_system_role'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  rolePermissions: (json['role_permissions'] as List<dynamic>?)
      ?.map((e) => RolePermission.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'created_by': instance.createdBy,
  'description': instance.description,
  'role_name': instance.roleName,
  'role_name_en': instance.roleNameEn,
  'is_deleted': instance.isDeleted,
  'is_system_role': instance.isSystemRole,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'role_permissions': instance.rolePermissions,
};
