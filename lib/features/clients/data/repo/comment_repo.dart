import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/clients/data/model/comment_response.dart';
import 'package:dio/dio.dart';

class CommentRepo {
  final ApiService apiService;

  CommentRepo({required this.apiService});

  Future<ApiResult<CommentResponse>> getComments(int id) async {
    try {
      final response = await apiService.getLeadComments({"ID": id});
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
