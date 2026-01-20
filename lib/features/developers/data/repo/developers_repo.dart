import 'package:crm/Core/network/api_services.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';

class DevelopersRepo {
  final ApiService apiService;

  DevelopersRepo({required this.apiService});

  Future<CompaniesResponse> getAllDevelopmentCompanies() async {
    return await apiService.getAllDevelopmentCompanies();
  }
}
