import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/auth/login/data/model/users_model.dart';
import 'package:crm/features/users/data/model/add_user_model.dart';
import 'package:dio/dio.dart';

class AddUserRepo {
  final ApiService apiService;

  AddUserRepo({required this.apiService});

  Future<ApiResult<String>> addUser(UsersModel body) async {
    try {
      final response = await apiService.addUser(body);
      return ApiResult.success(response.toString());
    } on DioException catch (e) {
      if (e.response?.data != null) {
        try {
          final errorModel = ApiErrorModel.fromJson(e.response!.data);
          return ApiResult.error(errorModel);
        } catch (_) {
          return ApiResult.error(
            ApiErrorModel(error: 'Failed to parse error response'),
          );
        }
      }

      return ApiResult.error(
        ApiErrorModel(error: 'Network error. Please check your connection'),
      );
    } catch (e) {
      return ApiResult.error(
        ApiErrorModel(error: 'An unexpected error occurred'),
      );
    }
  }
}
