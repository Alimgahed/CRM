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
        try {
          final errorModel = e.response!.data["Error"];
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
