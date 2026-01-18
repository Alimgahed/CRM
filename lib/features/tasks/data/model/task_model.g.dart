// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
  taskId: json['task_id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  status: (json['status'] as num?)?.toInt(),
  assignedToId: json['assigned_to_id'] as String?,
  userId: json['user_id'] as String?,
  dueDate: json['due_date'] == null
      ? null
      : DateTime.parse(json['due_date'] as String),
  isDeleted: json['is_deleted'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  companyId: json['company_id'] as String?,
  createdBy: json['created_by'] == null
      ? null
      : User.fromJson(json['created_by'] as Map<String, dynamic>),
  assignedTo: json['assigned_to'] == null
      ? null
      : User.fromJson(json['assigned_to'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
  'task_id': instance.taskId,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'assigned_to_id': instance.assignedToId,
  'user_id': instance.userId,
  'due_date': instance.dueDate?.toIso8601String(),
  'is_deleted': instance.isDeleted,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'company_id': instance.companyId,
  'created_by': instance.createdBy,
  'assigned_to': instance.assignedTo,
};
