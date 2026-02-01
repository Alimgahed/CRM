import 'package:crm/Core/network/api_error_model.dart';
import 'package:crm/Core/network/api_result.dart';
import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/clients/data/model/request_model.dart';
import 'package:dio/dio.dart';

class RequestRepo {
  final ApiService apiService;

  RequestRepo({required this.apiService});

  Future<ApiResult<RequestResponse>> getBuyingRequests(int id) async {
    try {
      final response = await apiService.getLeadBuyingRequests({"ID": id});
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorMsg = e.response?.data?['Error'] ?? e.message;
      return ApiResult.error(ApiErrorModel(error: errorMsg));
    }
  }
}
