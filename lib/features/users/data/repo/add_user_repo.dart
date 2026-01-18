import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/users/data/model/add_user_model.dart';
import 'package:dio/dio.dart';

class AddUserRepo {
  final ApiService apiService;

  AddUserRepo({required this.apiService});

  Future<ApiResult<String>> addUser(AddUserModel body) async {
    try {
      final response = await apiService.addUser(body);
      return ApiResult.success(response);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final data = e.response!.data;

        // ✅ Case 1: backend returned Map
        if (data is Map<String, dynamic>) {
          return ApiResult.error(ApiErrorModel.fromJson(data));
        }

        // ✅ Case 2: backend returned String
        if (data is String) {
          return ApiResult.error(ApiErrorModel(error: data));
        }

        // ✅ Fallback
        return ApiResult.error(ApiErrorModel(error: 'Unexpected error format'));
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
