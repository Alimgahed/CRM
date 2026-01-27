import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/actions/data/model/lead_action_model.dart';
import 'package:dio/dio.dart';

class AddActionRepo {
  final ApiService apiService;

  AddActionRepo({required this.apiService});

  Future<ApiResult<String>> addAgentAction(LeadActionModel requestBody) async {
    try {
      final response = await apiService.addAgentAction(requestBody);
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
