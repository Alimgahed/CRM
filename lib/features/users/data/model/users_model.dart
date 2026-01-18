import 'package:crm/features/users/data/model/role.dart';
import 'package:crm/features/users/data/model/role_info.dart';
import 'package:json_annotation/json_annotation.dart';
part 'users_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'leader_id')
  final String? leaderId;
  final String? phone;

  @JsonKey(name: 'full_name')
  final String? fullName;

  final String? username;
  final String? email;

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
  final String? companyId;

  @JsonKey(name: 'photo_url')
  final String? photoUrl;

  final String? role;

  @JsonKey(name: 'leader_name')
  final String? leaderName;

  @JsonKey(name: 'permissions')
  final Map<String, dynamic>? permissions;

  @JsonKey(name: 'role_info')
  final RoleInfo? roleInfo;

  final List<Role>? roles;

  User({
    this.userId,
    this.leaderId,
    this.fullName,
    this.username,
    this.email,

    this.userType,
    this.phone,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.photoUrl,
    this.role,
    this.leaderName,
    Map<String, dynamic>? permissions,
    this.roleInfo,
    List<Role>? roles,
  }) : permissions = permissions ?? {},
       roles = roles ?? [];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
