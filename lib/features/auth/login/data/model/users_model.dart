import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UsersModel {
  final int? id;

  @JsonKey(name: 'leader_id')
  final int? leaderId;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'full_name_en')
  final String? fullNameEn;

  final String email;

  @JsonKey(name: 'PASSWORD_HASH')
  final String? passwordHash;

  @JsonKey(name: 'user_type')
  final int? userType;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'is_deleted')
  final bool? isDeleted;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'company_id')
  final int? companyId;

  @JsonKey(name: 'photo_url')
  final String? photoUrl;

  @JsonKey(name: 'leader_name')
  final String? leaderName;

  final String? phone;

  /// 🔥 User-level permissions (nullable safe)
  final Map<String, bool>? permissions;

  /// 🔥 Roles assigned to this user
  final List<Role>? roles;

  UsersModel({
    this.id,
    this.leaderId,
    required this.fullName,
    this.fullNameEn,
    required this.email,
    this.passwordHash,
    this.userType,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.photoUrl,
    this.leaderName,
    this.phone,
    this.permissions,
    required this.roles,
  });

  /// ⭐ Custom fromJson to prevent null crashes
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? 0,
      leaderId: json['leader_id'],
      fullName: json['full_name'] ?? '',
      fullNameEn: json['full_name_en'],
      email: json['email'] ?? '',
      passwordHash: json['PASSWORD_HASH'],
      userType: json['user_type'] ?? 0,
      isActive: json['is_active'] ?? false,
      isDeleted: json['is_deleted'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      companyId: json['company_id'] ?? 0,
      photoUrl: json['photo_url'],
      leaderName: json['leader_name'],
      phone: json['phone'],
      permissions: Map<String, bool>.from(json['permissions'] ?? {}),
      roles:
          (json['roles'] as List<dynamic>?)
              ?.map((e) => Role.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);

  /// 🔐 Safe permission check (user + roles)
  bool hasPermission(String key) {
    if (permissions?[key] == true) return true;
    for (var role in roles ?? []) {
      for (var rp in role.rolePermissions ?? []) {
        if (rp.hasPermission && rp.permission?.permissionKey == key) {
          return true;
        }
      }
    }
    return false;
  }
}
