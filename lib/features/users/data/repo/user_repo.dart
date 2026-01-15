import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/users/data/model/user_response.dart';
import 'package:dio/dio.dart';

class UserRepo {
  final ApiService apiService;

  UserRepo({required this.apiService});

  Future<ApiResult<UsersResponse>> getAllUsers(int? page, int? pageSize) async {
    try {
      final response = await apiService.getAllUsers(page, pageSize);
      return ApiResult.success(response);
    } on DioException catch (e) {
      // Backend returned an error response
      if (e.response?.data != null) {
        try {
          final errorModel = ApiErrorModel.fromJson(e.response!.data);
          return ApiResult.error(errorModel);
        } catch (_) {
          return ApiResult.error(
            ApiErrorModel(error: 'Failed to parse error response'),
          );
        }
      } else {
        // No response from server (network issue)
        return ApiResult.error(
          ApiErrorModel(error: 'Network error. Please check your connection'),
        );
      }
    } catch (e) {
      return ApiResult.error(
        ApiErrorModel(error: 'An unexpected error occurred'),
      );
    }
  }
}
