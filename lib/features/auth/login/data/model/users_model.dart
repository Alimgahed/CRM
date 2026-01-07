import 'package:json_annotation/json_annotation.dart';
part 'users_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'leader_id')
  final String? leaderId;

  @JsonKey(name: 'full_name')
  final String fullName;

  final String username;
  final String email;

  @JsonKey(name: 'user_type')
  final int userType;

  @JsonKey(name: 'is_active')
  final bool isActive;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  final String role;

  @JsonKey(name: 'leader_name')
  final String leaderName;

  final Map<String, bool> permissions;

  User({
    required this.userId,
    this.leaderId,
    required this.fullName,
    required this.username,
    required this.email,
    required this.userType,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.companyId,
    required this.role,
    required this.leaderName,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // ⭐ Helper method to check specific permission
  bool hasPermission(String permission) {
    return permissions[permission] ?? false;
  }

  // ⭐ Helper method to check multiple permissions (ALL required)
  bool hasAllPermissions(List<String> requiredPermissions) {
    return requiredPermissions.every((p) => permissions[p] ?? false);
  }

  // ⭐ Helper method to check multiple permissions (ANY required)
  bool hasAnyPermission(List<String> requiredPermissions) {
    return requiredPermissions.any((p) => permissions[p] ?? false);
  }

  // ⭐ Helper to get all granted permissions
  List<String> get grantedPermissions {
    return permissions.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
  }

  // ⭐ Helper to check if user is admin (has all permissions)
  bool get isAdmin {
    return permissions.values.every((hasPermission) => hasPermission);
  }
}
