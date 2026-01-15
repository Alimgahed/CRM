import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  @JsonKey(name: 'role_id')
  final String? roleId;

  @JsonKey(name: 'role_name')
  final String? roleName;

  final dynamic permitions;

  Role({this.roleId, this.roleName, this.permitions});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
