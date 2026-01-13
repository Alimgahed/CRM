import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/auth/login/data/model/login_request_body.dart';
import 'package:crm/features/auth/login/data/model/login_response.dart';
import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:crm/features/statistics/data/model/statistics_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody body);

  @GET(ApiConstants.allprojects)
  Future<ProjectsResponse> getAllProjects(
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
  );

  @GET(ApiConstants.getAllDevelopmentCompanies)
  Future<DevCompanyListResponse> getAllDevelopmentCompanies(
    @Query('page') int? page,
    @Query('page_size') int? pageSize,
  );

  @GET(ApiConstants.getStatistics)
  Future<AgentActionStatisticsResponse> getAgentActionStatistics();
}
