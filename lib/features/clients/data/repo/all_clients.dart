import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/clients/data/model/leads_response.dart';
import 'package:dio/dio.dart';

class LeadsRepo {
  final ApiService apiService;

  LeadsRepo({required this.apiService});

  Future<ApiResult<LeadsResponse>> getAllLeads() async {
    try {
      final response = await apiService.getAllLeads(1, 10);
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
