import 'package:crm/Core/network/api_service.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';

class DevelopersRepo {
  final ApiService apiService;

  DevelopersRepo({required this.apiService});

  Future<List<DevCompany>> getAllDevelopmentCompanies() async {
    return await apiService.getAllDevelopmentCompanies();
  }
}
