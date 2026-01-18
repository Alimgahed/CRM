import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/owners/data/models/owner_respone.dart';

class OwnerRepo {
  final ApiService apiService;

  OwnerRepo({required this.apiService});

  Future<ApiResult<OwnerResponse>> getAllOwners() async {
    try {
      final response = await apiService.getAllOwners();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(
        ApiErrorModel(error: 'An unexpected error occurred'),
      );
    }
  }
}
