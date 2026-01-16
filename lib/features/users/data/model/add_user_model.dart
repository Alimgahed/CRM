import 'package:json_annotation/json_annotation.dart';
part 'add_user_model.g.dart';

@JsonSerializable()
class AddUserModel {
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  final String password;
  final String phone;
  @JsonKey(name: 'role_id')
  final String roleIds;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'leader_id')
  final String? leaderId;
  AddUserModel({
    this.leaderId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleIds,
    required this.isActive,
  });
  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserModelToJson(this);
}
