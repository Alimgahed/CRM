// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolePermission _$RolePermissionFromJson(Map<String, dynamic> json) =>
    RolePermission(
      permissionId: (json['permission_id'] as num?)?.toInt(),
      roleId: (json['role_id'] as num?)?.toInt(),
      hasPermission: json['has_permission'] as bool?,
      isDeleted: json['is_deleted'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      permission: json['permission'] == null
          ? null
          : Permission.fromJson(json['permission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RolePermissionToJson(RolePermission instance) =>
    <String, dynamic>{
      'permission_id': instance.permissionId,
      'role_id': instance.roleId,
      'has_permission': instance.hasPermission,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'permission': instance.permission,
    };
