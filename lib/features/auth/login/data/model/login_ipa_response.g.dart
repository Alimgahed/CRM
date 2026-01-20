// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_ipa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginApiResponse _$LoginApiResponseFromJson(Map<String, dynamic> json) =>
    LoginApiResponse(
      message: json['message'] as String?,
      data: LoginResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginApiResponseToJson(LoginApiResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
