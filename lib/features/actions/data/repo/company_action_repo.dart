import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/actions/data/model/company_actions.dart';
import 'package:dio/dio.dart';

class CompanyActionRepo {
  final ApiService apiService;

  CompanyActionRepo({required this.apiService});

  Future<ApiResult<CompanyActionsResponse>> getCompanyActions() async {
    try {
      final response = await apiService.getCompanyActions();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
