import 'package:crm/features/users/data/model/permission_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'role_info.g.dart';

@JsonSerializable(explicitToJson: true)
class RoleInfo {
  @JsonKey(name: 'role_id')
  final String? roleId;

  @JsonKey(name: 'role_name')
  final String? roleName;

  @JsonKey(name: 'role_name_en')
  final String? roleNameEn;

  final String? description;

  @JsonKey(name: 'is_system_role')
  final bool? isSystemRole;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  final List<Permission>? permissions; // ✅ nullabless

  RoleInfo({
    required this.roleId,
    required this.roleName,
    required this.roleNameEn,
    required this.description,
    required this.isSystemRole,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    this.permissions,
  });

  factory RoleInfo.fromJson(Map<String, dynamic> json) =>
      _$RoleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RoleInfoToJson(this);
}
