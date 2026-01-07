// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  userId: json['user_id'] as String,
  leaderId: json['leader_id'] as String?,
  fullName: json['full_name'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  userType: (json['user_type'] as num).toInt(),
  isActive: json['is_active'] as bool,
  isDeleted: json['is_deleted'] as bool,
  createdAt: json['created_at'] as String,
  companyId: json['company_id'] as String,
  role: json['role'] as String,
  leaderName: json['leader_name'] as String,
  permissions: Map<String, bool>.from(json['permissions'] as Map),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'user_id': instance.userId,
  'leader_id': instance.leaderId,
  'full_name': instance.fullName,
  'username': instance.username,
  'email': instance.email,
  'user_type': instance.userType,
  'is_active': instance.isActive,
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt,
  'company_id': instance.companyId,
  'role': instance.role,
  'leader_name': instance.leaderName,
  'permissions': instance.permissions,
};
