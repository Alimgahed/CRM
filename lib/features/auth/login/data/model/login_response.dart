import 'package:json_annotation/json_annotation.dart';
import 'users_model.dart';

@JsonSerializable()
class LoginResponse {
  final bool success;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  final UsersModel user;

  LoginResponse({
    required this.success,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      user: json['user'] != null
          ? UsersModel.fromJson(json['user'])
          : UsersModel(
              roles: [],
              id: 0,
              fullName: '',
              email: '',
              userType: 0,
              isActive: false,
              isDeleted: false,
              createdAt: '',
              updatedAt: '',
              companyId: 0,
              permissions: {},
            ),
    );
  }
}
