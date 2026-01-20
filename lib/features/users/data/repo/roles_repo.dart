import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/auth/login/data/model/roles_model.dart';

class RolesRepo {
  final ApiService apiService;

  RolesRepo({required this.apiService});

  Future<ApiResult<List<Role>>> getRoles() async {
    try {
      final response = await apiService.getAllRoles();
      return ApiResult.success(response.data);
    } catch (e) {
      return ApiResult.error(
        ApiErrorModel(error: 'An unexpected error occurred'),
      );
    }
  }
}
