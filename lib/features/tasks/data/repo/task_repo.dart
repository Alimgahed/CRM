import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/tasks/data/model/task_respone.dart';

class TaskRepo {
  final ApiService apiService;

  TaskRepo({required this.apiService});

  Future<ApiResult<TaskRespone>> getAllTasks() async {
    try {
      final response = await apiService.getAllTasks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(
        ApiErrorModel(error: 'An unexpected error occurred'),
      );
    }
  }
}
