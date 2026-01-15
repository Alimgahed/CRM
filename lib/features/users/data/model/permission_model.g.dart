// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  permissionId: json['permission_id'] as String?,
  permissionKey: json['permission_key'] as String?,
  permissionName: json['permission_name'] as String?,
  description: json['description'] as String?,
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  hasPermission: json['has_permission'] as bool?,
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'permission_id': instance.permissionId,
      'permission_key': instance.permissionKey,
      'permission_name': instance.permissionName,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'has_permission': instance.hasPermission,
    };
