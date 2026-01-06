import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_service.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:dio/dio.dart';

class ProjectsRepo {
  final ApiService apiService;

  ProjectsRepo({required this.apiService});

  Future<ApiResult<List<Project>>> getAllProjects() async {
    try {
      final response = await apiService.getAllProjects();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
