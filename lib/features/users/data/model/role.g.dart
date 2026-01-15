// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
  roleId: json['role_id'] as String?,
  roleName: json['role_name'] as String?,
  permitions: json['permitions'],
);

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
  'role_id': instance.roleId,
  'role_name': instance.roleName,
  'permitions': instance.permitions,
};
