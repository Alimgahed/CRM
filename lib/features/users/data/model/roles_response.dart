import 'package:crm/features/auth/login/data/model/roles_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'roles_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RolesResponse {
  final List<Role> data;
  final int? total;
  final int? page;
  final int? pageSize;
  final int? totalPages;

  RolesResponse({
    required this.data,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory RolesResponse.fromJson(Map<String, dynamic> json) =>
      _$RolesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RolesResponseToJson(this);
}
