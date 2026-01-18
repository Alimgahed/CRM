import 'dart:convert';

import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/tasks/data/model/task_model.dart';
import 'package:dio/dio.dart';

class AddTaskRepo {
  final ApiService apiService;

  AddTaskRepo({required this.apiService});

  Future<ApiResult<String>> addTask(TaskModel taskModel) async {
    try {
      final response = await apiService.addTask(taskModel);
      return ApiResult.success(response);
    } on DioException catch (e) {
      // print typeo of e.response?.data
      if (e.response?.data != null) {
        try {
          if (e.response!.data is String) {
            final Map<String, dynamic> errorMap = jsonDecode(e.response!.data);

            return ApiResult.error(ApiErrorModel(error: errorMap['Error']));
          }
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
