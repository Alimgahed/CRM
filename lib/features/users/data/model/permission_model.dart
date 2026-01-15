import 'package:json_annotation/json_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class Permission {
  @JsonKey(name: 'permission_id')
  final String? permissionId;

  @JsonKey(name: 'permission_key')
  final String? permissionKey;

  @JsonKey(name: 'permission_name')
  final String? permissionName;

  final String? description;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'has_permission')
  final bool? hasPermission;

  Permission({
    this.permissionId,
    this.permissionKey,
    this.permissionName,
    this.description,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.hasPermission,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
