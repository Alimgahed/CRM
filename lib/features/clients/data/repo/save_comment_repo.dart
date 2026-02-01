import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:dio/dio.dart';

class SaveCommentRepo {
  final ApiService apiService;

  SaveCommentRepo({required this.apiService});

  Future<ApiResult<dynamic>> saveComment(
    Map<String, dynamic> commentModel,
  ) async {
    try {
      final response = await apiService.addLeadComment(commentModel);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
