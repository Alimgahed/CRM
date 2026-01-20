import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  final String username;
  @JsonKey(name: 'remember_me')
  final bool rememberMe;
  final String password;

  LoginRequestBody({
    required this.username,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
