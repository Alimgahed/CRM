import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/users/data/model/users_model.dart';
import 'package:dio/dio.dart';

class EditUserRepo {
  final ApiService apiService;

  EditUserRepo({required this.apiService});

  Future<ApiResult<String>> editUser(String id, User body) async {
    try {
      final response = await apiService.editUser(id, body);
      return ApiResult.success(response);
    } on DioException catch (e) {
      // Backend returned an error response
      if (e.response?.data != null) {
        try {
          final errorModel = ApiErrorModel.fromJson(e.response!.data);
          return ApiResult.error(errorModel);
        } catch (e) {
          return ApiResult.error(ApiErrorModel(error: e.toString()));
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
