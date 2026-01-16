import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/clients/data/model/lead_source.dart';
import 'package:dio/dio.dart';

class LeadSourceRepo {
  final ApiService apiService;

  LeadSourceRepo({required this.apiService});

  Future<ApiResult<List<LeadSource>>> getAllLeadsSource() async {
    try {
      final response = await apiService.getAllLeadsSource();
      return ApiResult.success(response.data);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
