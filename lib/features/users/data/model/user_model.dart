import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

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

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'company_id')
  final String companyId;

  final String role;

  @JsonKey(name: 'leader_name')
  final String leaderName;

  final dynamic permissions;

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
    required this.updatedAt,
    required this.companyId,
    required this.role,
    required this.leaderName,
    this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
