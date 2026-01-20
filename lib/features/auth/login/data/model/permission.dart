import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission {
  final int id;

  @JsonKey(name: 'permission_key')
  final String? permissionKey;

  @JsonKey(name: 'permission_name')
  final String? permissionName;

  final String? description;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Permission({
    required this.id,
    this.permissionKey,
    this.permissionName,
    this.description,
    required this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
