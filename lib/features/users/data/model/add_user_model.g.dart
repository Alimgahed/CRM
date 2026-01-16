// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserModel _$AddUserModelFromJson(Map<String, dynamic> json) => AddUserModel(
  leaderId: json['leader_id'] as String?,
  fullName: json['full_name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  phone: json['phone'] as String,
  roleIds: json['role_id'] as String,
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$AddUserModelToJson(AddUserModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'role_id': instance.roleIds,
      'is_active': instance.isActive,
      'leader_id': instance.leaderId,
    };
