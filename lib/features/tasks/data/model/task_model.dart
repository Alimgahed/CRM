import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: 'task_id')
  final String? taskId;

  final String? title;
  final String? description;
  final int? status;

  @JsonKey(name: 'assigned_to_id')
  final String? assignedToId;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'due_date')
  final DateTime? dueDate;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'company_id')
  final String? companyId;

  @JsonKey(name: 'created_by')
  final UsersModel? createdBy;

  @JsonKey(name: 'assigned_to')
  final UsersModel? assignedTo;

  TaskModel({
    this.taskId,
    this.title,
    this.description,
    this.status,
    this.assignedToId,
    this.userId,
    this.dueDate,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.createdBy,
    this.assignedTo,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
