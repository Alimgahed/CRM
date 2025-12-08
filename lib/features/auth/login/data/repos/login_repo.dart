import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_service.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/model/login_response.dart';

import 'package:dio/dio.dart';


class LoginRepo {
  final ApiService apiService;

  LoginRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login(LoginRequestBody requestBody) async {
    try {
      final response = await apiService.login(requestBody);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
