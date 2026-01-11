import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/developers/data/models/developers_model.dart';

class DevelopersRepo {
  final ApiService apiService;

  DevelopersRepo({required this.apiService});

  Future<DevCompanyListResponse> getAllDevelopmentCompanies() async {
    return await apiService.getAllDevelopmentCompanies(1, 10);
  }
}
