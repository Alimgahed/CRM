import 'package:json_annotation/json_annotation.dart';
import 'permission.dart';

part 'role_permission.g.dart';

@JsonSerializable()
class RolePermission {
  @JsonKey(name: 'permission_id')
  final int? permissionId;

  @JsonKey(name: 'role_id')
  final int? roleId;

  @JsonKey(name: 'has_permission')
  final bool? hasPermission;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  final Permission? permission;

  RolePermission({
    this.permissionId,
    this.roleId,
    this.hasPermission,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.permission,
  });

  factory RolePermission.fromJson(Map<String, dynamic> json) =>
      _$RolePermissionFromJson(json);

  Map<String, dynamic> toJson() => _$RolePermissionToJson(this);
}
