import 'package:crm/features/users/data/model/users_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UsersResponse {
  final List<User> data;
  final int? total;
  final int? page;
  final int? pageSize;
  final int? totalPages;

  UsersResponse({
    required this.data,
    this.total,
    this.page,
    this.pageSize,
    this.totalPages,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
