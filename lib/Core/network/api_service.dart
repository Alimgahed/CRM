import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/model/login_response.dart';
import 'package:crm/features/developers/data/models/developers_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginnow)
  Future<LoginResponse> login(
    @Body() LoginRequestBody body,
  );

  @GET(ApiConstants.allprojects)
  Future<List<Project>> getAllProjects();

  @GET(ApiConstants.getAllDevelopmentCompanies)
  Future<List<DevCompany>> getAllDevelopmentCompanies();
}

