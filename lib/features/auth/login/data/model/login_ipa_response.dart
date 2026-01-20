import 'package:json_annotation/json_annotation.dart';
import 'login_response.dart';

part 'login_ipa_response.g.dart';

@JsonSerializable()
class LoginApiResponse {
  final String? message;
  final LoginResponse data;

  LoginApiResponse({this.message, required this.data});

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginApiResponseToJson(this);
}
