import 'package:crm/features/auth/login/data/model/role_permission.dart';
import 'package:json_annotation/json_annotation.dart';

part 'roles_model.g.dart';

@JsonSerializable()
class Role {
  final int? id;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'created_by')
  final int? createdBy;

  final String? description;

  @JsonKey(name: 'role_name')
  final String? roleName;

  @JsonKey(name: 'role_name_en')
  final String? roleNameEn;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'is_system_role')
  final bool? isSystemRole;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'role_permissions')
  final List<RolePermission>? rolePermissions;

  Role({
    this.id,
    this.companyId,
    this.createdBy,
    this.description,
    this.roleName,
    this.roleNameEn,
    this.isDeleted,
    this.isSystemRole,
    this.createdAt,
    this.updatedAt,
    this.rolePermissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
